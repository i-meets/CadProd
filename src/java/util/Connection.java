package util;


import java.sql.DriverManager;
import java.sql.SQLException;

public class Connection {
    
    
    public Connection con() {

        try {
            Class.forName("com.mysql.jdbc.Driver");

            return (Connection) DriverManager.getConnection("jdbc:mysql://localhost:8080/mydb?useSSL=false&user=root&password=");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Erro de conecão: " + ex);
        }
        return con();
    }
}
