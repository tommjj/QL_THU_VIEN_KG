using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for createDefaultAdimAcc
/// </summary>
public static class CreateDefaultAdimAcc
{
    private static User defultUser = new User
    {
        Email = "laplala@mail.com",
        FullName = "Laplala",
        Username = "laplala",
        Role = Constands.Roles.Admin,
    };


    public static void Create()
    {
        var pass = "12345678";

        defultUser.PasswordHash = BCrypt.Net.BCrypt.HashPassword(pass);

        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var userRepo = new UserRepo(conn);

            try
            {
                userRepo.GetUserByUsername(defultUser.Username);
            }
            catch (Exception ex)
            {
                if (ex == Errors.ErrDataNotFound)
                {
                    userRepo.CreateUser(defultUser);
                }
            }
            finally { 
                conn.Close();
            }
        }
    }
}