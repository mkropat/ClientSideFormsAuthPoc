using System.Web.Http;
using System.Web.Security;

namespace ClientSideFormsAuthPoc.Controllers
{
    public class ServerIdentityController : ApiController
    {
        [HttpPost]
        public LogInResult LogIn(string username)
        {
            FormsAuthentication.SetAuthCookie(username, false, "/");

            return new LogInResult
            {
                Message = string.Format("User '{0}' has been successfully logged in.", username),
            };
        }

        public class LogInResult
        {
            public string Message { get; set; }
        }
    }
}
