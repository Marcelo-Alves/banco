<%-- 
    Document   : executa
    Created on : 11/04/2019, 19:34:05
    Author     : marcelo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Controle.Buscabanco"%>
<%
    Buscabanco Banco = new Buscabanco();
    Banco.servidor = (String) session.getAttribute("servidor");
    Banco.senha = (String) session.getAttribute("senha");
    Banco.usuario = (String) session.getAttribute("usuario");
    Banco.banco = (String) session.getAttribute("banco");
    String instrucao = request.getParameter("comando");
    Banco.sql = instrucao;
    try{
        int i = Banco.Executa();
        out.print(i);
        //out.print(instrucao);
        out.print("<br>");
        out.print(Banco.sql);
    }catch(Exception e){
        out.print(e.getMessage());
    }
    /*
    Banco.Executa(instrucao);
    
*/


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
