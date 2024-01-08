using Microsoft.AspNet.Identity.Owin;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace REPORT_MANAGEMENT_APP.Controllers
{
    //[Route("api/[controller]")]
    public class AuthController : ApiController
    {

        public AuthController() { }


        [HttpGet]
        public IEnumerable<string> Index()
        {
            return new string[] { $"Instance injected" };
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IHttpActionResult> GetToken([FromBody] dynamic information)
        {
            var name = information.username.ToString();
            var password = information.password?.ToString() ?? string.Empty;

            /*
            var properties = Request.Properties;
            var params = HttpContext.Current.Request.Params;
            */

            var signInManager = Request.GetOwinContext().Get<ApplicationSignInManager>();
            var userManager = Request.GetOwinContext().GetUserManager<ApplicationUserManager>();

            var result = await signInManager.PasswordSignInAsync(name, password, true, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.LockedOut:
                case SignInStatus.RequiresVerification:
                case SignInStatus.Failure:
                    return Unauthorized();
                case SignInStatus.Success:
                default:

                    var user = await userManager.FindByNameAsync(name);
                    var userClaims = await userManager.GetClaimsAsync(user.Id);
                    var userRoles = await userManager.GetRolesAsync(user.Id);

                    var key = ConfigurationManager.AppSettings["JwtKey"];
                    var issuer = ConfigurationManager.AppSettings["JwtIssuer"];

                    var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
                    var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

                    // Create a List of Claims, Keep claims name short    
                    var permClaims = new List<Claim>
                    {
                        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                        new Claim(ClaimTypes.Name, name)
                    };
                    permClaims.AddRange(userClaims);
                    foreach (var userRole in userRoles)
                    {
                        permClaims.Add(new Claim(ClaimTypes.Role, userRole.ToString()));
                    }

                    // Create Security Token object by giving required parameters    
                    var token = new JwtSecurityToken(issuer, //Issure    
                                    issuer,  //Audience    
                                    permClaims,
                                    expires: DateTime.Now.AddDays(1),
                                    signingCredentials: credentials);
                    var jwt_token = new JwtSecurityTokenHandler().WriteToken(token);
                    return Ok(jwt_token);
            }
        }
    }
}
