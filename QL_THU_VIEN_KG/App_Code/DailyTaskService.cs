using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;

/// <summary>
/// Summary description for BackgroundService
/// </summary>
public class DailyTaskService 
{
    public static void RunDailyTasks()
    {
        // Update overdue books status
        UpdateOverdueBooksStatus();
    }

    private static void UpdateOverdueBooksStatus()
    {
        using (var conn = DbConnectionFactory.Instance.CreateConnection())
        {
            var sql = @"
                UPDATE BorrowRecords
                SET Status = @Status
                WHERE ReturnDate IS NULL AND DueDate < GETDATE()";
            
            conn.Execute(sql, new { Status = Constands.BorrowStatus.Overdue });
        }
    }
}