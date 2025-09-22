<%@page import="modelo.dto.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.dto.Material"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Connection"%>
<%@page import="servicios.conectaDB"%>

<%
    Connection cnx = new conectaDB().getConection();
    PreparedStatement ps;
    ResultSet rs;

    String cadSQL = "select m.idmaterial, m.nombre,m.cantidad,c.idcategoria,c.nombre as 'categoria' " +
                    "from material m inner join categorias c on m.idcategoria = c.idcategoria;";

    List<Material> lista = new ArrayList<>();

    try {
        ps = cnx.prepareStatement(cadSQL);
        rs = ps.executeQuery();
        while(rs.next()){
            Material m = new Material(
                rs.getInt("idmaterial"),
                rs.getString("nombre"),
                rs.getInt("cantidad"),
                new Categoria(rs.getInt("idcategoria"), rs.getString("categoria")));
            lista.add(m);
        }
        rs.close();
    } catch (Exception e) {}
    request.setAttribute("listaMateriales", lista);
%>

<div class="container mt-4">
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Categoría</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="m" items="${listaMateriales}">
                <tr>
                    <td>${m.idMaterial}</td>
                    <td>${m.nombre}</td>
                    <td>${m.cantidad}</td>
                    <td>${m.categoria.nombre}</td>
                    <td>
                        <a href="#" class="btn btn-warning btn-sm">Editar</a>
                        <a href="#" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="5" class="text-center">2025</td>
            </tr>
        </tfoot>
    </table>
</div>
