<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client-side Forms Auth Proof of Concept</title>
</head>
<body>
    <form id="form1" runat="server">

    <asp:LoginView runat="server" ViewStateMode="Disabled">
        <AnonymousTemplate>
            <p>
                <label for="username">Username:</label>
                <input id="username" name="username" value="a_user" />
            </p>
            <p>
                <input id="login_client" type="button" value="Log In (Client Cookie)" />
                <input id="login_server" type="button" value="Log In (Server Cookie)" />
            </p>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <p>Logged in as: <asp:LoginName runat="server" /></p>
            <p><asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/" /></p>
        </LoggedInTemplate>
    </asp:LoginView>

    <asp:ScriptManager runat="server">
        <Scripts>
            <asp:ScriptReference Name="jquery" />
        </Scripts>
    </asp:ScriptManager>

    <script>
        $('#login_client').click(function () {
            $.ajax('/api/ClientIdentity/LogIn?username=' + $('#username').val(), {
                method: 'POST'
            })
                .success(function (result) {
                    document.cookie = '.ASPXAUTH=' + result.Cookie + '; path=/';
                    window.location.reload();
                });
        });

        $('#login_server').click(function () {
            $.ajax('/api/ServerIdentity/LogIn?username=' + $('#username').val(), {
                method: 'POST'
            })
                .success(function () {
                    window.location.reload();
                });
        });
    </script>

    </form>
</body>
</html>
