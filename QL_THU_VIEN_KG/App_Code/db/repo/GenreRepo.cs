using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;


/// <summary>
/// Summary description for GenreRepo
/// </summary>
public class GenreRepo
{
    private SqlConnection conn;
    public GenreRepo(SqlConnection conn)
    {
        this.conn = conn;
    }

    public Genre CreateGenre(Genre genre)
    {
        string query = "INSERT INTO Genres (Name, Description)" +
                       "VALUES (@Name, @Description)" + "" +
                       "SELECT CAST(SCOPE_IDENTITY() as int)";

        var id = conn.QuerySingle<int>(query, genre);
        genre.ID = id;
        return genre;
    }

    public Genre GetGenreByID(int id)
    {
        string query = "SELECT * FROM Genres WHERE ID = @ID";

        var genre = conn.QueryFirstOrDefault<Genre>(query, new { ID = id });
        if (genre == null)
        {
            throw Errors.ErrDataNotFound;
        }

        return genre;
    }

    public Genre GetGenreByName(string name)
    {
        string query = "SELECT * FROM Genres WHERE Name = @Name";

        var genre = conn.QueryFirstOrDefault<Genre>(query, new { Name = name });
        if (genre == null)
        {
            throw Errors.ErrDataNotFound;
        }

        return genre;
    }

    public void UpdateGenre(Genre genre)
    {
        string query = "UPDATE Genres SET Name = @Name WHERE ID = @ID";

        var rowsAffected = conn.Execute(query, genre);
        if (rowsAffected == 0)
        {
            throw Errors.ErrDataNotUpdated;
        }
    }

    public void DeleteGenre(int id)
    {
        string query = "DELETE FROM Genres WHERE ID = @ID";
        var rowsAffected = conn.Execute(query, new { ID = id });
        if (rowsAffected == 0)
        {
            throw Errors.ErrDataNotFound;
        }
    }
}