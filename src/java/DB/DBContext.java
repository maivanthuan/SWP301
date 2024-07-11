package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;
    public DBContext() {
       
   try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String serverName = "DESKTOP-EECT8AK";
            String databaseName = "pitch";
            String url = "jdbc:sqlserver://" + serverName + ";databaseName="
                    + databaseName + ";encrypt=false";
            String username = "sa";
            String password = "nhattruong123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
}}