using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for createDefaultAdminAcc
/// </summary>
public static class CreateDefaultAdminAcc
{
    private static User defultUser = new User
    {
        Email = "laplala@mail.com",
        FullName = "Laplala",
        Username = "laplala",
        Role = Constands.Roles.Admin,
        PasswordHash = BCrypt.Net.BCrypt.HashPassword("12345678")
    };

    public static void Create()
    {
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