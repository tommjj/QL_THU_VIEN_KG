using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;

public partial class Dashboard_Genres_CreateGenre : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CGenrename.Attributes.Add("@input", "$refs.createErrorMess.remove()");
    }

    protected void CreateButton_Click(object sender, EventArgs e)
    {
        var name = CGenrename.Text;
        var description = CGenredescription.Text;

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "INSERT INTO Genres (Name, Description) VALUES (@Name, @Description)";
            try
            {
                conn.Execute(sql, new { Name = name, Description = description });

                Response.Redirect(Request.RawUrl);
            }
            catch (SqlException ex) when (ex.Number == 2627 || ex.Number == 2601)
            {
                ErrorLabel.Text = "Tên thể loại đã tồn tại.";
            }
            catch (Exception ex) 
            {
                ErrorLabel.Text = "Đã xảy ra lỗi không xác định.";
                return;
            }
        }
    }
}