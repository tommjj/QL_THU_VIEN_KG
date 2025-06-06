using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Borrows_Default : System.Web.UI.Page
{
    protected int PageSize = 15;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadBorrows();
    }

    protected void LoadBorrows()
    {
        var q = Request.QueryString.Get("q") ?? string.Empty;
        var status = Request.QueryString.Get("status") ?? string.Empty;
        var pageStr = Request.QueryString.Get("page");
        int page = 1;
        if (!int.TryParse(pageStr, out page) || page < 1)
        {
            page = 1;
        }
        var borrows = GetBorrow(q, status, page - 1, PageSize);

        TotalBorrow.Text = borrows.Count.ToString();
        BorrowRepeater.DataSource = borrows;
        BorrowRepeater.DataBind();
    }

    protected int LoadBorrowsCount()
    {
        var q = Request.QueryString.Get("q") ?? string.Empty;
        var status = Request.QueryString.Get("status") ?? string.Empty;

        return GetTotalBorrowCount(q, status);
    }

    protected int GetBorrowedCount()
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "SELECT COUNT(*) FROM BorrowRecords WHERE ReturnDate IS NULL";
            return conn.Query<int>(sql).FirstOrDefault();
        }
    }

    protected int GetOverdueBorrowedCount()
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "SELECT COUNT(*) FROM BorrowRecords WHERE ReturnDate IS NULL AND DueDate < GETDATE()";
            return conn.Query<int>(sql).FirstOrDefault();
        }
    }

    protected int GetReturnedBorrowedCount() {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "SELECT COUNT(*) FROM BorrowRecords WHERE ReturnDate IS NOT NULL AND ReturnDate >= DATEADD(MONTH, -1, CAST(GETDATE() AS DATE))";
            return conn.Query<int>(sql).FirstOrDefault();
        }
    }

    protected class BorrowRecordWithMemberNameAndBooks : BorrowRecord
    {
        public string MemberName { get; set; }
        public string Quantity { get; set; }
    }

    protected List<BorrowRecordWithMemberNameAndBooks> GetBorrow(string q, string status, int pageIndex, int pageSize)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();

            var template = builder.AddTemplate(@"
                SELECT b.*, m.FullName as MemberName, SUM(bd.Quantity) as Quantity
                FROM BorrowRecords b 
                JOIN Members m ON b.MemberID = m.ID
                JOIN BorrowDetails bd ON b.ID = bd.BorrowID
                /**where**/
                GROUP BY b.ID, b.MemberID, b.MemberID, b.UserID, b.BorrowDate, b.DueDate, b.ReturnDate, b.Status, m.FullName
                ORDER BY b.ID DESC
                OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY
            ", new
            {
                Offset = pageIndex * pageSize,
                PageSize = pageSize
            });

            if (!string.IsNullOrEmpty(q))
            {
                builder.Where("m.FullName COLLATE Latin1_General_CI_AI LIKE @Q", new
                {
                    Q = $"%{q}%",
                });
            } 

            if (!string.IsNullOrEmpty(status))
            {
                builder.Where("b.Status = @Status", new
                {
                    Status = status,
                });
            }

            return conn.Query<BorrowRecordWithMemberNameAndBooks>(template.RawSql, template.Parameters).ToList();
        }
    }

    protected int GetTotalBorrowCount(string q, string status)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();
            var template = builder.AddTemplate(@"
                    SELECT COUNT(*)
                    FROM BorrowRecords b 
                    JOIN Members m ON b.MemberID = m.ID
                    /**where**/
                ");
            if (!string.IsNullOrEmpty(q))
            {
                builder.Where("m.FullName COLLATE Latin1_General_CI_AI LIKE @Q", new
                {
                    Q = $"%{q}%",
                });
            }
            if (!string.IsNullOrEmpty(status))
            {
                builder.Where("b.Status = @Status", new
                {
                    Status = status,
                });
            }
            return conn.Query<int>(template.RawSql, template.Parameters).FirstOrDefault();
        }
    }
}