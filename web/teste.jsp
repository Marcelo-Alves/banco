<%-- 
    Document   : teste
    Created on : 08/04/2019, 09:46:12
    Author     : marcelo.moreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste </title>
    </head>
    <body>
        <h1><%out.print(session.getAttribute("servidor"));%></h1>
        <h1><%out.print(session.getAttribute("banco"));%></h1>
        <h1><%out.print(session.getAttribute("usuario"));%></h1>
        <h1><%out.print(session.getAttribute("senha"));%></h1>
        <a href="index.jsp">Voltar</a>
    </body>
</html>
