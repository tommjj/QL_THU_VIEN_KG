using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for errors
/// </summary>
public static class Errors
{
    public static Exception ErrInvalidCredentials = new Exception("Error invalid credentials");
    
    public static Exception ErrDataNotFound = new Exception("Error data not found");
    public static Exception ErrDataAlreadyExists = new Exception("Error data already exists");
    public static Exception ErrDataNotValid = new Exception("Error data not valid");
    public static Exception ErrDataNotUpdated = new Exception("Error data not updated");
}

public class InvalidDataException : Exception
{
    public String[] Messages { get; set; }
    
    public InvalidDataException(String[] messages) : base("Invalid data")
    {
        this.Messages = messages;
    }
}
