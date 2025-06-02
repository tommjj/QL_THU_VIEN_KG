using Microsoft.Owin.Security;
using Org.BouncyCastle.Crypto.Generators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Policy;
using System.Web;

/// <summary>
/// Summary description for Auth
/// </summary>
public static class Auth
{
    public static void Login(string username, string password, bool isPersistent)
    {
        var isValid = false;
        User user = null;

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var repo = new UserRepo(conn);

            user = repo.GetUserByUsername(username);

            if (user == null) { 
                throw Errors.ErrInvalidCredentials;
            }

            if (BCrypt.Net.BCrypt.Verify(password, user.PasswordHash)) {
                isValid = true;
            }
            conn.Close();
        }

        if (!isValid)
        {
            throw Errors.ErrInvalidCredentials;
        }

        // Set session variables
        IAuthenticationManager authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

        var claims = new List<System.Security.Claims.Claim>
        {
            new Claim(ClaimTypes.NameIdentifier, user.ID.ToString()),
            new Claim(ClaimTypes.Name, user.Username),
            new Claim(ClaimTypes.Email, user.Email),
            new Claim("FullName", user.FullName),
            new Claim(ClaimTypes.Role, user.Role)
        };

        var identity = new ClaimsIdentity(claims, "ApplicationCookie");

        authenticationManager.SignIn(
           new AuthenticationProperties
           {
               IsPersistent = isPersistent,
               ExpiresUtc = DateTime.UtcNow.AddHours(12)
           },
           identity
        );
    }
}

