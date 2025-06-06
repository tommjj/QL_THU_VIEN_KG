using Dapper;
using Org.BouncyCastle.Utilities;
using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Members_Default : System.Web.UI.Page
{
    protected int PageSize = 15;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadMembers();
    }

    private void LoadMembers()
    {
        var q = Request.QueryString.Get("q") ?? string.Empty;
        var pageStr = Request.QueryString.Get("page");
        int page = 1;
        if (!int.TryParse(pageStr, out page) || page < 1)
        {
            page = 1;
        }

        var members = GetMembersWithBorrowedBooks(q, page-1, PageSize);
        TotalMember.Text = members.Count.ToString();
        MembersRepeater.DataSource = members;
        MembersRepeater.DataBind();
    }

    protected int GetTotalMember()
    {
        var q = Request.QueryString.Get("q");
        if (q == null)
        {
            q = "";
        }

        return GetMemberCount(q);
    }

    protected class MemberWithBorrowedBooks: Member
    {
        public int BorrowedBooksCount { get; set; }
    }

    protected List<MemberWithBorrowedBooks> GetMembersWithBorrowedBooks(string q, int pageIndex, int pageSize)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();
            var template = builder.AddTemplate(@"
                SELECT m.ID, m.FullName, m.Email, m.Phone, m.Address, m.CreatedAt, 
                        COALESCE(SUM(CASE WHEN br.ReturnDate IS NULL THEN bd.Quantity ELSE 0 END), 0) AS BorrowedBooksCount
                FROM Members m
                LEFT JOIN BorrowRecords br ON m.ID = br.MemberID
                LEFT JOIN BorrowDetails bd ON br.ID = bd.BorrowID
                /**where**/
                GROUP BY m.ID, m.FullName, m.Email, m.Phone, m.Address, m.CreatedAt
                ORDER BY m.CreatedAt DESC
                OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY", new { Offset = pageIndex * pageSize, PageSize = pageSize });

            if (q.Trim().Length > 0)
            {
                builder.Where("m.DeletedAt IS NULL AND (m.FullName COLLATE Latin1_General_CI_AI LIKE @Keyword OR m.Email COLLATE Latin1_General_CI_AI LIKE @Keyword OR m.Phone LIKE @Keyword)", new { Keyword = $"%{q}%" });
            } else
            {
                builder.Where("m.DeletedAt IS NULL");
            }

            return conn.Query<MemberWithBorrowedBooks>(template.RawSql, template.Parameters).ToList();
        }
    }

    protected int GetMemberCount(string q)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();

            var template = builder.AddTemplate(@"
                SELECT COUNT(*)
                FROM Members m
                /**where**/");

            if (q.Trim().Length > 0)
            {
                builder.Where("(m.FullName COLLATE Latin1_General_CI_AI LIKE @Keyword OR m.Email COLLATE Latin1_General_CI_AI LIKE @Keyword OR m.Phone LIKE @Keyword) AND m.DeletedAt IS NULL", new { Keyword = $"%{q}%" });
            } else
            {
                builder.Where("m.DeletedAt IS NULL");
            }
                
            return conn.QueryFirstOrDefault<int>(template.RawSql, template.Parameters);
        }
    }
}


      
               
        
            