using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Members_UpdateMember : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddAlpineA();
    }

    private void AddAlpineA()
    {
        UMenberID.Attributes.Add("x-model", "$store.updateMemberModal.id");
        UMemberName.Attributes.Add("x-model", "$store.updateMemberModal.name");
        UMemberMail.Attributes.Add("x-model", "$store.updateMemberModal.email");
        UMemberMail.Attributes.Add("@input", "$refs.updateMemberModal.remove()");
        UMemberPhone.Attributes.Add("x-model", "$store.updateMemberModal.phone");
        UMemberAddress.Attributes.Add("x-model", "$store.updateMemberModal.address");
    }

    protected void CMemberBT_Click(object sender, EventArgs e)
    {
        var member = new Member
        {
            ID = int.Parse(UMenberID.Text),
            FullName = UMemberName.Text,
            Email = UMemberMail.Text,
            Phone = UMemberPhone.Text,
            Address = UMemberAddress.Text,
        };

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = @"UPDATE Members SET FullName = @FullName, Email = @Email, Phone = @Phone, Address = @Address WHERE ID = @ID";
       
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