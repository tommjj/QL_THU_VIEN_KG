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
        
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        var pass = Request.Form["password"].ToString(); 
        var rememberMe = Request.Form["rememberme"] == "on";
        var username = Request.Form["username"].ToString();

        try
        {
            Auth.Login(username, pass, rememberMe);
        }
        catch (Exception ex) { 
            ErrLabel.Text = "tài khoản hoặc mật khẩu không đúng!";
        }
    }
}