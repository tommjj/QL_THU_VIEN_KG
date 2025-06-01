using System;
using System.Collections.Generic;
using System.Deployment.Internal;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Genres
/// </summary>
public class Genre
{
    public int ID { get; set; }
    public string Name { get; set; }

    public string Description { get; set; } // Optional field for additional information
    public Genre()
    {
    }

    public Genre(int id, string name)
    {
        ID = id;
        Name = name;
    }
}