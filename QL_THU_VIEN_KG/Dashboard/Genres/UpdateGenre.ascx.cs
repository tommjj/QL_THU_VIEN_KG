using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Genres_UpdateGenre : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddAlpineA();
    }

    private void AddAlpineA()
    {
        UGenreID.Attributes.Add("x-model", "$store.updatdeGenre.id");
        UGenrename.Attributes.Add("x-model", "$store.updatdeGenre.name");
        UGenredescription.Attributes.Add("x-model", "$store.updatdeGenre.description");
        UGenrename.Attributes.Add("@input", "$refs.updateErrorMess.remove()");
    }

    protected void CreateButton_Click(object sender, EventArgs e)
    {
        var id = UGenreID.Text;
        var name = UGenrename.Text;
        var description = UGenredescription.Text;

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "UPDATE Genres SET Name = @Name, Description = @Description WHERE ID = @ID";
            try
            {
                conn.Execute(sql, new { Name = name, Description = description, ID = id });

                Response.Redirect(Request.RawUrl);
            }
            catch (SqlException ex) when (ex.Number == 2627 || ex.Number == 2601)
            {
                UpdateErrorLabel.Text = "Tên thể loại đã tồn tại.";
            }
            catch (Exception ex)
            {
                UpdateErrorLabel.Text = "Đã xảy ra lỗi không xác định.";
                return;
            }
        }
    }
}