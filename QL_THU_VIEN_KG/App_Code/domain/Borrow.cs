using Microsoft.Owin.Security.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Borrow
/// </summary>

public class BorrowRecord
{
    public int ID { get; set; }
    public int MemberID { get; set; }
    public int UserID { get; set; }
    public DateTime BorrowDate { get; set; }
    public DateTime DueDate { get; set; }
    public DateTime ReturnDate { get; set; }
    public string Status { get; set; }

    public List<BorrowDetail> Details { get; set; } // one to many
}

public class BorrowDetail
{
    public int ID { get; set; }
    public int BorrowID { get; set; }
    public int BookID { get; set; }
    public int Quantity { get; set; }

    public BorrowDetail()
    {
    }
}