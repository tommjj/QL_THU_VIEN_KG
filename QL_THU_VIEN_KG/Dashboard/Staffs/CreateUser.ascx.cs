using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Staffs_CreateUser : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateButton_Click(object sender, EventArgs e)
    {
        var user = new User
        {
            FullName = CFullName.Text,
            Username = CUsername.Text,
            Email = CUserMail.Text,
            Role = Constands.Roles.Librarian,
            PasswordHash = BCrypt.Net.BCrypt.HashPassword(CPassword.Text),
        };

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var userRepo = new UserRepo(conn);

            try
            {
                userRepo.GetUserByUsername(user.Username);
            }
            catch (Exception ex)
            {
                if (ex == Errors.ErrDataNotFound)
                {
                    userRepo.CreateUser(user);
                }
            }
            finally
            {
                conn.Close();
            }
        }

        Response.Redirect(Request.RawUrl);
    }
}