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

    public static class BorrowStatus
    {
        public const string Borrowed = "borrowed";
        public const string Returned = "returned";
        public const string Canceled = "canceled";
        public const string Overdue = "overdue";
        public const string Lost = "lost";
        public const string Suspended = "suspended";

        public static string[] AllStatuses = new string[]
        {
            Borrowed, Returned, Canceled, Overdue, Lost, Suspended
        };

        /**
         * ToVietNamese converts the status string to its Vietnamese equivalent.
         * Returns the original status if no match is found.
         */
        public static string ToVietNamese(string status)
        {
            switch (status)
            {
                case Borrowed:
                    return "Đã mượn";
                case Returned:
                    return "Đã trả";
                case Canceled:
                    return "Đã hủy";
                case Overdue:
                    return "Quá hạn";
                case Lost:
                    return "Mất sách";
                case Suspended:
                    return "Tạm dừng";
                default:
                    return status;
            }
        }
    }
}