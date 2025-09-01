<%-- 
    Document   : index
    Created on : 18 ago. 2025, 2:19:46 p. m.
    Author     : LAB-USR-LNORTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="bg-white">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Pagee</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center mt-3">Iniciar Sesión</h2>
            <form action="LoginServlet" method="POST">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <label>Usuario:</label>
                        <input type="text" class="form-control" name="username" required><br>
                        <label>Contraseña:</label>
                        <input type="password" class="form-control" name="password" required><br>
                        <button type="submit" class="btn btn-success">Ingresar</button>
                    </div>
                    <div class="col-md-4"></div>
                <div
            </form>
            <% if (request.getAttribute("error") != null) {%>
            <p style="color:red;"><%= request.getAttribute("error")%></p>
            <% }%>        
            
        </div>
    </body>
</html>
