using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Dashboard_Genres_DeleteGenre : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DeleteGenreID.Attributes.Add("x-model", "$store.deleteGenre.id");
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        var id = DeleteGenreID.Text;

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "DELETE Genres WHERE ID = @ID";
            try
            {
                conn.Execute(sql, new { ID = id });

                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                return;
            }
        }
    }
}