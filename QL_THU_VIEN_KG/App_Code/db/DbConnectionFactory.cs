using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// DbConnectionFactory is a factory class for creating database connections.
/// </summary>
public class DbConnectionFactory
{
    private static readonly string _connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QL_THU_VIEN_KG"].ConnectionString;
    private static readonly DbConnectionFactory _instance = new DbConnectionFactory();

    public DbConnectionFactory()
    {
    }

    public static DbConnectionFactory Instance => _instance;

    public SqlConnection CreateConnection()
    {
        var conn = new SqlConnection(_connectionString);
        conn.Open();
        return conn;
    }
}