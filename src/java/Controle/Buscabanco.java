package Controle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.lang.String;

public class Buscabanco {
    
    public String servidor;
    public String banco;
    public String usuario;
    public String senha;
    public String sql;
    public Connection con = null;
    public ResultSet rs = null;
        
    public String DB() throws ClassNotFoundException, java.lang.NullPointerException, SQLException, InstantiationException, IllegalAccessException{
        try{   
            if(banco.equals("mysql")){
                Class.forName("com.mysql.jdbc.Driver").newInstance();             
                con = DriverManager.getConnection("jdbc:mysql://"+servidor+":3306/",usuario,senha);           
            }  
         } 
         catch (SQLException e) {  
            return "Nao foi possivel conectar ao Banco de Dados.";  
        }
        return null ; 
    }
    
    public String Conexao() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        try{
            DB();
            Statement pstm = con.createStatement();
            rs = pstm.executeQuery(sql);
        }
        catch (SQLException e) {  
            return "Nao foi possivel conectar ao tabela."; 
       }
        return null; 
    }   
    
    public String Executa() throws ClassNotFoundException, NullPointerException, SQLException, InstantiationException, IllegalAccessException{
        String reg = null;
        int reg1;
        try{
            DB();
            Statement pstm = con.createStatement();
            reg1 = pstm.executeUpdate(sql);
            //reg1.parseInt(String reg);
            
        }
        catch (SQLException e) {  
            return e.getMessage(); 
       }
        
        
        return reg;
    }
    
}