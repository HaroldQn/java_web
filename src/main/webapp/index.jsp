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
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
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
