using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Staffs_Default : System.Web.UI.Page
{
    protected int PageSize = 15;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadUsers();
    }

    private void LoadUsers()
    {
        var q = Request.QueryString.Get("q") ?? string.Empty;
        var pageStr = Request.QueryString.Get("page");
        int page = 1;
        if (!int.TryParse(pageStr, out page) || page < 1)
        {
            page = 1;
        }

        var members = GetUsers(q, page - 1, PageSize);
        TotalStaffs.Text = members.Count.ToString();
        StaffsRepeater.DataSource = members;
        StaffsRepeater.DataBind();
    }

    protected int GetTotalUser()
    {
        var q = Request.QueryString.Get("q");
        if (q == null)
        {
            q = "";
        }

        return GetUsersCount(q);
    }

    protected List<User> GetUsers(string q, int pageIndex, int pageSize)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();
            var template = builder.AddTemplate(@"
                SELECT *
                FROM Users u
                /**where**/
                ORDER BY u.CreatedAt DESC
                OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY", new { Offset = pageIndex * pageSize, PageSize = pageSize });

            if (q.Trim().Length > 0)
            {
                builder.Where("(u.FullName COLLATE Latin1_General_CI_AI LIKE @Keyword OR u.Email COLLATE Latin1_General_CI_AI LIKE @Keyword OR u.Username LIKE @Keyword)", new { Keyword = $"%{q}%" });
            }

            return conn.Query<User>(template.RawSql, template.Parameters).ToList();
        }
    }

    protected int GetUsersCount(string q)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();

            var template = builder.AddTemplate(@"
                SELECT COUNT(*)
                FROM Users u
                /**where**/");

            if (q.Trim().Length > 0)
            {
                builder.Where("(u.FullName COLLATE Latin1_General_CI_AI LIKE @Keyword OR u.Email COLLATE Latin1_General_CI_AI LIKE @Keyword OR u.Username LIKE @Keyword)", new { Keyword = $"%{q}%" });
            }

            return conn.QueryFirstOrDefault<int>(template.RawSql, template.Parameters);
        }
    }
}