using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IdentityModel.Protocols.WSTrust;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Borrows_ReturnBook : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BorrowID.Attributes.Add("x-bind:value", "$store.returnBook.id");
    }

    protected void ReturnBookBtn_Click(object sender, EventArgs e)
    {
        var ID = int.Parse(BorrowID.Text);

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var borrowRecord = GetBorrowRecordByID(conn, ID);
            if (borrowRecord == null || borrowRecord.Status == Constands.BorrowStatus.Returned)
            {
                return;
            }

            using (var tx = conn.BeginTransaction())
            {
                try
                {
                    // Update book avalilable copies
                    foreach (var d in borrowRecord.Details)
                    {
                        var usql = "UPDATE Books SET AvailableCopies = AvailableCopies + @Quantity WHERE ID = @ID";

                        conn.Execute(usql, new
                        {
                            Quantity = d.Quantity,
                            ID = d.BookID,
                        }, transaction: tx);
                    }

                    var sql = "UPDATE BorrowRecords SET Status = @Status, ReturnDate = @ReturnDate WHERE ID = @ID";

                    conn.Execute(sql, new
                    {
                        Status = Constands.BorrowStatus.Returned,
                        ReturnDate = DateTime.Now.Date,
                        ID = borrowRecord.ID,
                    }, transaction: tx);

                    tx.Commit();
                }
                catch (Exception ex) {
                    tx.Rollback();
                    throw ex;
                }
            }
        } 

        Response.Redirect(Request.RawUrl);
    }

    private BorrowRecord GetBorrowRecordByID(SqlConnection conn, int id)
    {
        var getSql = @"
            SELECT b.ID, b.MemberID, b.UserID, b.BorrowDate, b.DueDate , b.ReturnDate, b.Status, bd.BorrowID, bd.BookID, bd.Quantity
            FROM BorrowRecords b
            JOIN BorrowDetails bd ON b.ID = bd.BorrowID
            WHERE b.ID = @ID";

        BorrowRecord borrowRecord = null;
        conn.Query<BorrowRecord, BorrowDetail, BorrowRecord>(getSql,
            (r, d) =>
            {
                if (borrowRecord == null)
                {
                    borrowRecord = r;
                    borrowRecord.Details = new List<BorrowDetail>();
                }
                borrowRecord.Details.Add(d);
                return borrowRecord;
            }
            , new { ID = id }, splitOn: "BorrowID");

        return borrowRecord;
    }
}