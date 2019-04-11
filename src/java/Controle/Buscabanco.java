package Controle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Buscabanco {
    
    public String servidor;
    public String banco;
    public String usuario;
    public String senha;
        
    public Connection DB() throws ClassNotFoundException, java.lang.NullPointerException, SQLException, InstantiationException, IllegalAccessException{
        Connection con=null;
        try{   
            if(banco.equals("mysql")){
                Class.forName("com.mysql.jdbc.Driver").newInstance();             
                con = DriverManager.getConnection("jdbc:mysql://"+servidor+":3306/wp?useTimezone=true&serverTimezone=UTC",usuario,senha);           
            }    
            return con;
         } 
         catch (SQLException e) {  
            System.out.println("Nao foi possivel conectar ao Banco de Dados.");  
            System.out.println(e.getMessage()); 
            return null ; 
        }
    }
    
    public ResultSet Conexao(String sql) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        try{
            Connection conn = DB();
            Statement pstm = conn.createStatement();
            ResultSet rs = pstm.executeQuery(sql);
            return  rs;     
        }
        catch (SQLException e) {  
            System.out.println("Nao foi possivel conectar ao tabela."); 
            System.out.println(e.getMessage()); 
            return null; 
       }
    }    
}