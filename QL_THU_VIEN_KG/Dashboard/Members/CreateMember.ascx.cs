using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;

public partial class Dashboard_Members_CreateMember : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CMemberMail.Attributes.Add("@input", "$refs.createErrorMess.remove()");
    }

    protected void CMemberBT_Click(object sender, EventArgs e)
    {
        var member = new Member
        {
            FullName = CMemberName.Text,
            Email = CMemberMail.Text,
            Phone = CMemberPhone.Text,
            Address = CMemberAddress.Text,
            CreatedAt = DateTime.Now,
        };

        using(var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "INSERT INTO Members (FullName, Email, Phone, Address, CreatedAt) VALUES (@FullName, @Email, @Phone, @Address, @CreatedAt)";
            try
            {
                conn.Execute(sql, member);
                Response.Redirect(Request.RawUrl);
            }
            catch (SqlException ex) when (ex.Number == 2627 || ex.Number == 2601)
            {
                ErrorLabel.Text = "Email đã tồn tại.";
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = "Đã xảy ra lỗi không xác định.";
                return;
            }
        }
    }
}