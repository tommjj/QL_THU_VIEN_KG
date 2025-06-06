using Dapper;
using System;
using System.Collections.Generic;
using System.IdentityModel.Protocols.WSTrust;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Members_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request.QueryString.Get("id") ?? "";
        if (!int.TryParse(id, out int ID))
        {
            Response.Redirect("Default.aspx");
            return;
        }

        var borrowRecord = GetBorrowRecordEx(ID);
        if (borrowRecord == null)
        {
            Response.Redirect("Default.aspx");
            return;
        }

        MemberName.Text = borrowRecord.MemberName;
        MemberID.Text = borrowRecord.MemberID.ToString();
        MemberEmail.Text = borrowRecord.MemberEmail;
        MemberPhone.Text = borrowRecord.MemberPhone;

        MemberName2.Text = borrowRecord.MemberName;

        DueDate.Text = borrowRecord.DueDate.ToString("dd/MM/yyyy");
        BorrowDate.Text = borrowRecord.BorrowDate.ToString("dd/MM/yyyy");

        BorrowDays.Text = (borrowRecord.DueDate - borrowRecord.BorrowDate).Days.ToString();

        var mumberBorrowedBooks = 0;
        borrowRecord.DetailsWithBook.ForEach(book => {
            mumberBorrowedBooks += book.Quantity;
        });

        MumberBook.Text = borrowRecord.DetailsWithBook.Count.ToString();
        MumberBorrowedBooks.Text = mumberBorrowedBooks.ToString();

        Status.Attributes.Add("x-bind:class", "$el.innerText === 'Quá hạn' ? 'bg-destructive text-destructive-foreground hover:bg-destructive/80' : 'bg-primary text-primary-foreground hover:bg-primary/80'");
        Status.Text = Constands.BorrowStatus.ToVietNamese(borrowRecord.Status);

        BooksRepeater.DataSource = borrowRecord.DetailsWithBook;
        BooksRepeater.DataBind();

        if (borrowRecord.Status != Constands.BorrowStatus.Returned)
        {
            ReturnButton.Text = $@"
                 <button @click=""$store.returnBook.setReturn({borrowRecord.ID}, '{borrowRecord.MemberName}')"" type=""button"" class=""inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 w-full"">
                    <i class=""h-3 w-3 mr-1"" data-lucide=""rotate-cw""></i>
                    Trả sách
                </button>
            ";
        }
    }

    protected class BorrowDetailWithBook: BorrowDetail
    {
        public string BookTitle { get; set; }
        public string BookCoverImage { get; set; }
        public string BookISBN { get; set; }
        public string BookGenre { get; set; }
        public string BookAuthor { get; set; }
    }

    protected class BorrowRecordEx : BorrowRecord
    {
        public string MemberName { get; set; }
        public string MemberEmail { get; set; }
        public string MemberPhone { get; set; }
        public string UserName { get; set; }
        public string UserEmail { get; set; }
        public List<BorrowDetailWithBook> DetailsWithBook { get; set; }
    }

    private BorrowRecordEx GetBorrowRecordEx(int ID)
    {
        var sql = @"
            SELECT b.ID, b.MemberID, b.UserID, b.BorrowDate, b.DueDate, b.ReturnDate, b.Status,
                m.FullName as MemberName, m.Email as MemberEmail, m.Phone as MemberPhone,  
                u.FullName as UserName, u.Email as UserEmail, 
                bd.BorrowID, bd.BookID, bd.Quantity,
                bk.Title as BookTitle, bk.CoverImage as BookCoverImage, bk.ISBN as BookISBN, bk.Author as BookAuthor,
                g.Name as BookGenre
            FROM BorrowRecords b
                JOIN Members m ON m.ID = b.MemberID
                JOIN Users u ON u.ID = b.UserID
                JOIN BorrowDetails bd ON bd.BorrowID = b.ID
                JOIN Books bk ON bk.ID = bd.BookID
                JOIN Genres g ON g.ID = bk.GenreID
            WHERE b.ID = @ID
        ";

        BorrowRecordEx borrowRecord = null;
        
        using(var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            conn.Query<BorrowRecordEx, BorrowDetailWithBook, BorrowRecordEx>(
                sql,
                (b, br) =>
                {
                    if (borrowRecord == null) {
                        borrowRecord = b;
                        borrowRecord.DetailsWithBook = new List<BorrowDetailWithBook>();
                    }
                    borrowRecord.DetailsWithBook.Add(br);
                    return borrowRecord;
                },  new
                {
                    ID,
                }, splitOn: "BorrowID"
                );
        }

        return borrowRecord;
    }
}