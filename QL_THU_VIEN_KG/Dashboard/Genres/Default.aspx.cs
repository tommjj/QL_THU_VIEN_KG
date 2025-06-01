using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;

public partial class Dashboard_Genres_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AddAlpinejsAttributes();
        }
        LoadGenres();
        GetGenreWithBookCounts("");
    }

    private void AddAlpinejsAttributes()
    {
    }

    protected void LoadGenres()
    {
        var q = Request.QueryString.Get("q");
        if (q == null)
        {
            q = "";
        }

        var genres = GetGenreWithBookCounts(q);
        GenresCount.Text = genres.Count.ToString();
        GenresRepeater.DataSource = genres;
        GenresRepeater.DataBind();
    }

    protected class GenreWithBookCount: Genre
    {
        public int BookCount {  get; set; }
    }

    protected List<GenreWithBookCount> GetGenreWithBookCounts(string q)
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var builder = new SqlBuilder();

            var template = builder.AddTemplate(@"SELECT g.ID, g.Name, g.Description, COUNT(b.ID) as BookCount
                    FROM Genres g     
                    LEFT JOIN Books b ON g.ID = b.GenreID
                    /**where**/
                    GROUP BY g.ID, g.Name, g.Description
                    ORDER BY g.ID DESC
                ");

            if (q.Trim().Length > 0) {
                builder.Where("g.Name COLLATE Latin1_General_CI_AI Like @Keyword", new { Keyword = $"%{q}%" });
            }
            
            return conn.Query<GenreWithBookCount>(template.RawSql, template.Parameters).ToList();
        }
    }
}

