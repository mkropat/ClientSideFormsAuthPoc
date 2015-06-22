using System.Web.Http;
using System.Web.Security;

namespace ClientSideFormsAuthPoc.Controllers
{
    public class ClientIdentityController : ApiController
    {
        [HttpPost]
        public LogInResult LogIn(string username)
        {
            var cookie = FormsAuthentication.GetAuthCookie(username, false, "/");

            return new LogInResult
            {
                Cookie = cookie.Value,
                Message = string.Format("User '{0}' has been successfully logged in.", username),
                Name = cookie.Name,
                Path = cookie.Path,
            };
        }

        public class LogInResult
        {
            public string Cookie { get; set; }
            public string Message { get; set; }
            public string Name { get; set; }
            public string Path { get; set; }
        }
    }
}
