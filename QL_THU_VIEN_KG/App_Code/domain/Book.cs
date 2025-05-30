using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Book
/// </summary>
public class Book
{
    public int ID { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public string CoverImage { get; set; }
    public string Author { get; set; }
    public string ISBN { get; set; }
    public string Publisher { get; set; }
    public int PublishedYear { get; set; }
    public int GenreID { get; set; }
    public int TotalCopies { get; set; }
    public int AvailableCopies { get; set; }
    public DateTime CreatedAt { get; set; }

    public Genre Genre { get; set; } // one to one 
    public Book()
    {
    }
}