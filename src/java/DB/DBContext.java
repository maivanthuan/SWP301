/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author thuan
 */
public class DBContext {
    public Connection connection;
    public DBContext() {
        try {
            String dbURL = "jdbc:sqlserver://localhost;databaseName=Pitch;user=sa;password=sa;encrypt=true;trustServerCertificate=true;";
//            String dbURL = "jdbc:sqlserver://DESKTOP-IPDB6V8\\SQLEXPRESS;databaseName=Student;user=sa;password=123";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(dbURL);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.getMessage();
        }
    }
}
