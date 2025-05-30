using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static Constands;

/// <summary>
/// User class 
/// </summary>
public class User
{
    public int ID { get; set; }
    public string Username { get; set; }
    public string PasswordHash { get; set; }
    public string FullName { get; set; }
    public string Email { get; set; }
    public string Role { get; set; }
    public DateTime CreatedAt { get; set; }
    public User()
    {
    }

    public User(int id, string username, string passwordHash, string fullName, string email, string role, DateTime createdAt)
    {
        ID = id;
        Username = username;
        PasswordHash = passwordHash;
        FullName = fullName;
        Email = email;
        Role = role;
        CreatedAt = createdAt;
    }

    public override string ToString()
    {
        return $"ID: {ID}, Username: {Username}, FullName: {FullName}, Email: {Email}, Role: {Role}, CreatedAt: {CreatedAt}";
    }

    public void ClearPassword()
    {
        PasswordHash = string.Empty;
    }

    public bool IsAdmin()
    {
        return Role.Equals(Roles.Admin, StringComparison.OrdinalIgnoreCase);
    }
    public bool IsLibrarian()
    {
        return Role.Equals(Roles.Librarian, StringComparison.OrdinalIgnoreCase);
    }
}