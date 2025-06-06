using Dapper;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Borrows_BookSelector : System.Web.UI.UserControl
{
    protected int PageSize = 15;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CurrentPageLabel.Text = "1";
            LoadBooks();
            LoadMaxPageCount();
        }
    }

    protected void PrivPage_Click(object sender, EventArgs e)
    {
        var mum = (int.Parse(CurrentPageLabel.Text) - 1);
        if (mum > 1)
        {
            CurrentPageLabel.Text = mum.ToString();
            LoadBooks();
        }
    }

    protected void NextPage_Click(object sender, EventArgs e)
    {
        var max = int.Parse(MaxPage.Text);
        var curr = int.Parse(CurrentPageLabel.Text);

        if (curr < max)
        {
            CurrentPageLabel.Text = (int.Parse(CurrentPageLabel.Text) + 1).ToString();
            LoadBooks();
        }
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        CurrentSearchValue.Text = SearchTextBox.Text;
        CurrentPageLabel.Text = "1";

        LoadMaxPageCount();
        LoadBooks();
    }

    protected void LoadMaxPageCount()
    {
        MaxPage.Text = Math.Ceiling((double)GetBookCount(CurrentSearchValue.Text) / PageSize).ToString();
    }

    private void LoadBooks()
    {
        var currPage = int.Parse(CurrentPageLabel.Text);
        var q = CurrentSearchValue.Text;

        var book = GetBooks(q, currPage - 1, PageSize);

        BooksRepeater.DataSource = book;
        BooksRepeater.DataBind();
    }


    private int GetBookCount(string q)
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
                (book, genre) =>
                {
                    book.Genre = genre;
                    return book;
                }, template.Parameters, splitOn: "GenreID").ToList();
        }
    }
}