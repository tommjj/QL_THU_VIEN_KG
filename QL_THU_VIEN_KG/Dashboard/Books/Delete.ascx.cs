using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Books_Delete : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DeleteID.Attributes.Add("x-model", "$store.deleteBook.id");
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        var ID = DeleteID.Text;

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "UPDATE Books SET DeletedAt = GETDATE() WHERE ID = @ID";

            conn.Execute(sql, new { ID });

            Response.Redirect(Request.RawUrl);
        }
    }
}