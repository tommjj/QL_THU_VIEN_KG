using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Books_Default : System.Web.UI.Page
{
    protected int PageSize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadBooks();
    }

    private void LoadBooks()
    {
        var q = Request.QueryString.Get("q") ?? string.Empty;
        var pageStr = Request.QueryString.Get("page");
        int page = 1;
        if (!int.TryParse(pageStr, out page) || page < 1)
        {
            page = 1;
        }
        var books = GetBooks(q, page - 1, PageSize);

        TotalBook.Text = books.Count.ToString();
        BooksRepeater.DataSource = books;
        BooksRepeater.DataBind();
    }

    protected int GetTotalBooks()
    {
        var q = Request.QueryString.Get("q") ?? "";
        return GetTotalBooks(q);
    }

    private List<Book> GetBooks(string q, int pageIndex, int pageSize)
    {
        var builder = new SqlBuilder();

        var template = builder.AddTemplate(@"
            SELECT b.*, g.ID AS GenreID,  g.ID, g.Name FROM Books b
            LEFT JOIN Genres g ON b.GenreID = g.ID
            /**where**/
            ORDER BY b.ID DESC
            OFFSET @PageIndex * @PageSize ROWS FETCH NEXT @PageSize ROWS ONLY", new { PageIndex = pageIndex, PageSize = pageSize });

        if (q.Trim().Length > 0)
        {
            builder.Where("DeletedAt IS NULL AND (Title COLLATE Latin1_General_CI_AI LIKE @Q OR Author COLLATE Latin1_General_CI_AI LIKE @Q OR ISBN = @ISBN)", new { q = $"%{q}%", ISBN = q });
        }
        else
        {
            builder.Where("DeletedAt IS NULL");
        }

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            return conn.Query<Book, Genre, Book>(template.RawSql,
                ( book, genre) =>
            {
                book.Genre = genre;
                return book;
            }, template.Parameters, splitOn: "GenreID").ToList();
        }
    }

    private int GetTotalBooks(string q)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();
            var template = builder.AddTemplate("SELECT COUNT(*) FROM Books /**where**/");
            if (q.Trim().Length > 0)
            {
                builder.Where("DeletedAt IS NULL AND (Title COLLATE Latin1_General_CI_AI LIKE @Q OR Author COLLATE Latin1_General_CI_AI LIKE @Q OR ISBN = @ISBN)", new { q = $"%{q}%", ISBN = q });
            }
            else
            {
                builder.Where("DeletedAt IS NULL");
            }
            return conn.ExecuteScalar<int>(template.RawSql, template.Parameters);
        }
    }
}