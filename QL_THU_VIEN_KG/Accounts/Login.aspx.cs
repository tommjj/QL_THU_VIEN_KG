using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accounts_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IAuthenticationManager authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

        var claims = new List<System.Security.Claims.Claim>
        {
            new Claim(ClaimTypes.NameIdentifier, "id"),  
            new Claim(ClaimTypes.Name, "name"),             
            new Claim(ClaimTypes.Email, "enmail"),              
            new Claim("FullName", "fullname"), 
            new Claim(ClaimTypes.Role, "role")
        };

        var identity = new ClaimsIdentity(claims, "ApplicationCookie");

        authenticationManager.SignIn(
            new AuthenticationProperties
            {
                IsPersistent = false,
                ExpiresUtc = DateTime.UtcNow.AddMinutes(30) // Set the expiration time for the cookie
            },
            identity
        );
    }
}