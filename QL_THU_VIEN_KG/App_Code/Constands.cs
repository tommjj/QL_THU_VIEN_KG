using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Constands
/// </summary>
public static class Constands
{
    public static class SessionKeys
    {
        public const string ID = "ID";
        public const string Username = "Username";
        public const string FullName = "FullName";
        public const string Email = "Email";
        public const string Role = "Role";
    }

    public static class Roles
    {
        public const string Admin = "admin";
        public const string Librarian = "librarian";
    }
}