package util;

import java.sql.*;
public class Conexao {
    
    ///O DRIVER PARA A CONEXÃO TEM QUE SER O DRIVER 8 DO JDBC CONECTOR 
    
    String servidor = new Config().servidor;
    String banco = new Config().banco;
    String usuario = new Config().usuario;
    String senha = new Config().senha;
    
    String con = "jdbc:mysql://"+servidor+"/"+banco+"?useTimezone=true&serverTimezone=UTC&user="+usuario+"&password="+senha;
    
    public Connection conectar() throws SQLException{
        try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           
           //localhost
           return DriverManager.getConnection(con); 
           
           
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }
    }
}
