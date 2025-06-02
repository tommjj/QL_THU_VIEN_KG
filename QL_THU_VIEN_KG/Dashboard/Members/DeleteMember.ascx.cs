using Microsoft.Ajax.Utilities;
using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Data.Entity.Infrastructure.Design.Executor;
using Dapper;

public partial class Dashboard_Members_DeleteMember : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DeleteMemberID.Attributes.Add("x-model", "$store.deleteMember.id");
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        var ID = DeleteMemberID.Text;

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "UPDATE Members SET DeletedAt = GETDATE() WHERE ID = @ID";

            conn.Execute(sql, new { ID });

            Response.Redirect(Request.RawUrl);
        }
    }
}