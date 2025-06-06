using Dapper;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.IdentityModel.Protocols.WSTrust;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Borrows_Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {
            string today = DateTime.Today.ToString("yyyy-MM-dd");

            MemberID.Attributes.Add("x-bind:value", "$store.createBorrow.member ? $store.createBorrow.member.id : ''");
            SelectedBookCount.Attributes.Add("x-bind:value", "$store.createBorrow.books.length > 0 ? $store.createBorrow.books.length : ''");
            BorrowDate.Attributes.Add("x-model", "$store.createBorrow.borrowDate");
            DueDate.Attributes.Add("x-model", "$store.createBorrow.dueDate");
            BorrowDay.Attributes.Add("x-bind:value", "$store.createBorrow.borrowDay");

            BorrowDate.Attributes.Add("min", today);
            DueDate.Attributes.Add("min", today);
        }
    }

    protected void CreateButton_Click(object sender, EventArgs e)
    {
     

        var books = Request.Form.GetValues("books");
        var memberID = int.Parse(MemberID.Text);

        var borrowDate = DateTime.Parse(BorrowDate.Text);
        var dueDate = DateTime.Parse(DueDate.Text);
       
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            using (var tx = conn.BeginTransaction()) 
            {
                try
                {
                    var id = conn.ExecuteScalar<int>(@"
                        INSERT INTO BorrowRecords (MemberID, UserID, BorrowDate, DueDate, Status)
                        OUTPUT INSERTED.ID
                        VALUES (@MemberID, @UserID, @BorrowDate, @DueDate, @Status)
                    ", new
                    {
                        MemberID = memberID,
                        UserID = Context.User.Identity.GetUserId(),
                        BorrowDate = borrowDate,
                        DueDate = dueDate,
                        Status = Constands.BorrowStatus.Borrowed,
                    }, transaction: tx);

                    foreach (var book in books)
                    {
                        var splited = book.Split(':');
                        var bookID = splited[0];
                        var quanity = splited[1];

                        // add detail
                        conn.Execute(@"
                            INSERT INTO BorrowDetails (BorrowID, BookID, Quantity)
                            VALUES (@BorrowID, @BookID, @Quantity)
                        ", new
                        {
                            BorrowID = id,
                            BookID = bookID,
                            Quantity = quanity,
                        }, transaction: tx);


                        conn.Execute(@"
                            UPDATE Books SET AvailableCopies = AvailableCopies - @Quantity
                            WHERE ID = @BookID
                        ", new
                        {
                            BookID = bookID,
                            Quantity = quanity,
                        }, transaction: tx);
                    }

                    tx.Commit();
                }
                catch (Exception ex)
                {
                    tx.Rollback();
                    throw ex;
                }
            }

           
        }

        Response.Redirect("/Dashboard/Borrows/");
    }
}