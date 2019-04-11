<%-- 
    Document   : executa
    Created on : 11/04/2019, 19:34:05
    Author     : marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controle.Buscabanco"%>
<%
    Buscabanco Banco = new Buscabanco();
    String instrucao = request.getParameter("comando");
    Banco.sql = instrucao;
    Banco.Executa();
    out.print(instrucao);
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
