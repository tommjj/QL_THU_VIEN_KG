using Dapper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Books_Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CCoverUpload.Attributes.Add("@change", "onFileChange($event)");
    }

    protected void CreateButton_Click(object sender, EventArgs e)
    {
        var imageName = SaveImage();

        var book = new Book
        {
            Title = CTitle.Text,
            Author = CAuthor.Text,
            Description = CDescription.Text,
            ISBN = CISBN.Text,
            Publisher = CPublisher.Text,
            PublishedYear = int.Parse(CYear.Text),
            GenreID = int.Parse(CGenreSelect.SelectedValue),
            AvailableCopies = int.Parse(CQuantity.Text),
            TotalCopies = int.Parse(CQuantity.Text),
            CoverImage = imageName,
            CreatedAt = DateTime.Now,
        };

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = @"INSERT INTO Books 
                        (Title, Author, Description, ISBN, Publisher, PublishedYear, GenreID, AvailableCopies, TotalCopies, CoverImage, CreatedAt)
                        VALUES 
                        (@Title, @Author, @Description, @ISBN, @Publisher, @PublishedYear, @GenreID, @AvailableCopies, @TotalCopies, @CoverImage, @CreatedAt)";

            try
            {
                conn.Execute(sql, book);

                Response.Redirect("~/Dashboard/Books");
            }
            catch (Exception ex)
            {

            }
        }
    }

    private string GenFileName(string fileExt)
    {
        return Guid.NewGuid().ToString() + fileExt;
    }

    private string SaveImage()
    {
        var staticFolder = Server.MapPath("~/Static/");

        var ext = Path.GetExtension(CCoverUpload.FileName).ToLower();
        var fileName = GenFileName(ext);
        var filepath = Path.Combine(staticFolder, fileName);

        CCoverUpload.SaveAs(filepath);

        return fileName;
    }
}