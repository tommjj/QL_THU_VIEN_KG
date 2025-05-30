using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Dapper;


/// <summary>
/// Summary description for UserRepo
/// </summary>
public class UserRepo
{
    private SqlConnection conn;
    public UserRepo(SqlConnection conn)
    {
        this.conn = conn;
    }

    public User CreateUser(User user)
    {
        string query = "INSERT INTO Users (Username, PasswordHash, FullName, Email, Role) " +
                       "VALUES (@Username, @PasswordHash, @FullName, @Email, @Role); " +
                       "SELECT CAST(SCOPE_IDENTITY() as int)";
        
        var id = conn.QuerySingle<int>(query, user);
        user.ID = id;
        return user;
    }

    public User GetUserByUsername(string username)
    {
        string query = "SELECT * FROM Users WHERE Username = @Username";

        var user = conn.QueryFirstOrDefault<User>(query, new { Username = username });
        if (user == null)
        {
            throw Errors.ErrDataNotFound;
        }

        return user;
    }   

    public User GetUserById(int id)
    {
        string query = "SELECT * FROM Users WHERE ID = @ID";
        var user = conn.QueryFirstOrDefault<User>(query, new { ID = id });
        if (user == null)
        {
            throw Errors.ErrDataNotFound;
        }
        return user;
    }
    public User GetUserByEmail(string email)
    {
        string query = "SELECT * FROM Users WHERE Email = @Email";
        var user = conn.QueryFirstOrDefault<User>(query, new { Email = email });
        if (user == null)
        {
            throw Errors.ErrDataNotFound;
        }
        return user;
    }

    public void UpdateUser(User user)
    {
        string query = "UPDATE Users SET Username = @Username, PasswordHash = @PasswordHash, FullName = @FullName, " +
                       "Email = @Email, Role = @Role WHERE ID = @ID";
        var rowsAffected = conn.Execute(query, user);
        if (rowsAffected == 0)
        {
            throw Errors.ErrDataNotUpdated;
        }
    }

    public void DeleteUser(int id)
    {
        string query = "DELETE FROM Users WHERE ID = @ID";
        var rowsAffected = conn.Execute(query, new { ID = id });
        if (rowsAffected == 0)
        {
            throw Errors.ErrDataNotFound;
        }
    }
}   