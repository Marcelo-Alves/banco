<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Controle.Buscabanco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("servidor",request.getParameter("nome_servidor"));
    session.setAttribute("banco",request.getParameter("banco"));
    session.setAttribute("usuario",request.getParameter("nome_usuario"));
    session.setAttribute("senha",request.getParameter("senha"));
        
    Buscabanco Banco = new Buscabanco();
    Banco.servidor = (String) session.getAttribute("servidor");
    Banco.senha = (String) session.getAttribute("senha");
    Banco.usuario = (String) session.getAttribute("usuario");
    Banco.banco = (String) session.getAttribute("banco");
    
    
    //if(session.getAttribute("banco").equals("mysql")){
        Banco.sql = "select distinct table_schema as BANCOS from information_schema.tables";
   // }
   /* if(session.getAttribute("banco").equals("oracle")){
        Buscabanco.sql = "SELECT distinct grantee as BANCOS FROM DBA_SYS_PRIVS";
    }*/ 
   try{
    Banco.Conexao();
   }
   catch(Exception e){
       out.print(e.getMessage());
   }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Painel Banco</title>
        <style>
            #geral{
                width: 100%;
                margin: 0 auto;            
            }
            #topo{
                border: 1px solid #000;
            }
            #lateral{
                border: 1px solid #000;
                width: 15%;
            }
            #conteudo{
                border: 1px solid #00;
                width: 84%;
            }
        </style>    
    </head>
    <body>
        <div id="geral" name="geral">
            <div id="topo" name="topo">
                <form action="executa.jsp" method="post">
                    <textarea id="comando" name="comando" rows="10" cols="100"></textarea>
                    <input type="submit" value="Enviar" />
                </form>
            </div>
            <div id="lateral" name="lateral">
                <%
                    try{ 
                        
                        while(Banco.rs.next() ){
                          out.println(Banco.rs.getString("BANCOS")+"<BR>");
                      }
                    }
                    catch (Exception e) {  
                            out.println("Nao foi possivel conectar "+ e.getMessage());
                    }
                %>
            </div>
            <div id="conteudo"></div>
        </div>
    </body>
</html>