<%-- 
    Document   : index
    Created on : 18 ago. 2025, 2:19:46 p. m.
    Author     : LAB-USR-LNORTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Iniciar Sesión</h2>
        <form action="LoginServlet" method="POST">
        Usuario:
        <input type="text" name="username" required><br>
        Constraseña:
        <input type="password" name="password" required><br>
        <input type="submit" value="Ingresar">
        </form>
        <% if (request.getAttribute("error") != null) {%>
        <p style="color:red;"><%= request.getAttribute("error")%></p>
        <% }%>        
    </body>
</html>
