<%-- 
    Document   : dashboard
    Created on : 19 ago. 2025, 2:32:12 p. m.
    Author     : LAB-USR-LNORTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("user") == null){
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        <h2>Bienvenido</h2>
        <p>Información para usuarios que iniciaron sesión</p>
        <a href="LogoutServlet">Cerrar sesión</a>
    </body>
</html>
