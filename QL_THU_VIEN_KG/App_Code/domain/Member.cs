using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Member
/// </summary>
public class Member
{
    public int ID { get; set; }
    public string FullName { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string Address { get; set; }
    public DateTime CreatedAt { get; set; }

    public Member()
    {
    }

    public Member(int iD, string fullName, string email, string phone, string address, DateTime createdAt)
    {
        ID = iD;
        FullName = fullName;
        Email = email;
        Phone = phone;
        Address = address;
        CreatedAt = createdAt;
    }
}