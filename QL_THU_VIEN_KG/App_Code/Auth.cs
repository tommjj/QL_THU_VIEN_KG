using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Auth
/// </summary>
public class Auth
{
    public Auth()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Login(string username, string password, bool isPersistent)
    {
        var isValid = true;
        // TODO: login logic

        if (!isValid)
        {
            throw Errors.ErrInvalidCredentials;
        }

        // Set session variables
        IAuthenticationManager authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

    }
}

