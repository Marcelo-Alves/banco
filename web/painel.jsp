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
    String sql="";
    
    if(session.getAttribute("senha").equals("mysql")){
        sql = "select distinct table_schema as BANCOS from information_schema.tables";
    }
    if(session.getAttribute("senha").equals("oracle")){
        sql = "SELECT distinct grantee as BANCOS FROM DBA_SYS_PRIVS";
    }
    ResultSet rs = Banco.Conexao(sql); 
       
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
                <textarea id="comando" name="comando" rows="10" cols="160"></textarea>
                <input type="button" value="Enviar" />
            </div>
            <div id="lateral" name="lateral">
                <%
                    
                    
                    while(rs.next() ){
                          out.println(rs.getString("BANCOS")+"<BR>");
                      }
                %>
            </div>
            <div id="conteudo"></div>
            
        </div>
    </body>
</html>