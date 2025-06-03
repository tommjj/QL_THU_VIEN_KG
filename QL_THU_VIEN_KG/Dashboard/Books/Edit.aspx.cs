using Dapper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Books_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UCoverUpload.Attributes.Add("@change", "onFileChange($event)");

            var book = LoadBook();

            if (book == null)
            {
                Response.Redirect("~/Dashboard/Books");
                return;
            }

            UID.Text = book.ID.ToString();
            UGenreSelect.SelectedValue = book.GenreID.ToString();
            DefaultImage.ImageUrl = "/Static/" + book.CoverImage;
            UTitle.Text = book.Title;
            UDescription.Text = book.Description;
            UAuthor.Text = book.Author;
            UYear.Text = book.PublishedYear.ToString();
            UISBN.Text = book.ISBN;
            UPublisher.Text = book.Publisher;
            UQuantity.Text = book.AvailableCopies.ToString();
        }
    }

    private Book LoadBook()
    {
        var bookIdStr = Request.QueryString.Get("id");
        if (string.IsNullOrEmpty(bookIdStr) || !int.TryParse(bookIdStr, out int bookId))
        {
            Response.Redirect("~/Dashboard/Books");
            return null;
        }
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            try
            {
                var sql = @"SELECT b.*, g.ID AS GenreID, g.Name AS GenreName FROM Books b
                        LEFT JOIN Genres g ON b.GenreID = g.ID
                        WHERE b.ID = @BookId AND b.DeletedAt IS NULL";

                return conn.QueryFirstOrDefault<Book>(sql, new { BookId = bookId });
            }
            catch (Exception ex)
            {
                // Log the exception
                Response.Redirect("~/Dashboard/Books");
                return null;
            }
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        var currBook = LoadBook();

        var imageName = SaveImage();
       
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = @"UPDATE Books 
                        SET Title = @Title, Author = @Author, Description = @Description, 
                            ISBN = @ISBN, Publisher = @Publisher, PublishedYear = @PublishedYear, 
                            GenreID = @GenreID, AvailableCopies = AvailableCopies + @Num, TotalCopies = TotalCopies + @Num, CoverImage = @CoverImage
                        WHERE ID = @ID AND DeletedAt IS NULL";
            try
            {
                conn.Execute(sql, new
                {
                    ID = int.Parse(UID.Text),
                    Title = UTitle.Text,
                    Author = UAuthor.Text,
                    Description = UDescription.Text,
                    ISBN = UISBN.Text,
                    Publisher = UPublisher.Text,
                    PublishedYear = int.Parse(UYear.Text),
                    GenreID = int.Parse(UGenreSelect.SelectedValue),
                    CoverImage = imageName ?? currBook.CoverImage,

                    Num = int.Parse(UQuantity.Text) - currBook.AvailableCopies,
                });
                Response.Redirect("~/Dashboard/Books");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

    private string SaveImage()
    {
        if (UCoverUpload.PostedFile == null || UCoverUpload.PostedFile.ContentLength == 0)
        {
            return null; 
        }

        var staticFolder = Server.MapPath("~/Static/");

        var ext = Path.GetExtension(UCoverUpload.FileName).ToLower();
        var fileName = GenFileName(ext);
        var filepath = Path.Combine(staticFolder, fileName);

        UCoverUpload.SaveAs(filepath);

        return fileName;
    }

    private string GenFileName(string fileExt)
    {
        return Guid.NewGuid().ToString() + fileExt;
    }
}