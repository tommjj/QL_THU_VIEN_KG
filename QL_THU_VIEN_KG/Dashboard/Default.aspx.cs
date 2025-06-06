using Dapper;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadTopBorrowedBooks();
        loadLastBorrowedRecords();
    }

    private void loadTopBorrowedBooks()
    {
        var topBooks = GetTopBorrowedBooks(5);

        TopBorrowedBooksRepeater.DataSource = topBooks;
        TopBorrowedBooksRepeater.DataBind();
    }

    private void loadLastBorrowedRecords()
    {
        var lastBorrowed = GetLastBorrow(5);

        LastBorrowedRepeater.DataSource = lastBorrowed;
        LastBorrowedRepeater.DataBind();
    }

    protected int getMemberCount()
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "SELECT COUNT(*) FROM Members WHERE DeletedAt IS NULL";
            return conn.Query<int>(sql).FirstOrDefault();
        }
    }

    protected int getBookCount()
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "SELECT COUNT(*) FROM Books WHERE DeletedAt IS NULL";
            return conn.Query<int>(sql).FirstOrDefault();
        }
    }

    protected int getTotalBookCount()
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "SELECT COALESCE(SUM(TotalCopies), 0) FROM Books WHERE DeletedAt IS NULL";
            return conn.Query<int>(sql).FirstOrDefault();
        }
    }

    protected int getBorrowedCount()
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "SELECT COUNT(*) FROM BorrowRecords WHERE ReturnDate IS NULL";
            return conn.Query<int>(sql).FirstOrDefault();
        }
    }

    protected int getOverdueBorrowedCount()
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = "SELECT COUNT(*) FROM BorrowRecords WHERE ReturnDate IS NULL AND DueDate < GETDATE()";
            return conn.Query<int>(sql).FirstOrDefault();
        }
    }

    protected class TopBorredBook { 
        public string BookName { get; set; }
        public int BorrowCount { get; set; }
    }

    protected List<TopBorredBook> GetTopBorrowedBooks(int top = 5)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = @"
                SELECT TOP (@Top) b.Title as BookName, COALESCE(SUM(br.Quantity), 0)  AS BorrowCount
                FROM Books b
                JOIN BorrowDetails br ON b.ID = br.BookID
                JOIN BorrowRecords brc ON brc.ID = br.BorrowID
                WHERE brc.BorrowDate >= DATEADD(MONTH, -1, CAST(GETDATE() AS DATE))
                GROUP BY b.Title
                ORDER BY BorrowCount DESC";
            return conn.Query<TopBorredBook>(sql, new { Top = top }).ToList();
        }
    }

    protected class BorrowRecordWithMemberName: BorrowRecord
    {
        public string MemberName { get; set; }
    }

    protected List<BorrowRecordWithMemberName> GetLastBorrow(int top = 5)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = @"
                SELECT TOP (@Top) br.ID, br.MemberID, br.UserID, br.DueDate, br.ReturnDate, br.Status, br.BorrowDate, m.FullName as MemberName 
                FROM BorrowRecords br JOIN Members m ON br.MemberID = m.ID
                ORDER BY br.ID DESC";
            return conn.Query<BorrowRecordWithMemberName>(sql, new { Top = top }).ToList();
        }
    }
}