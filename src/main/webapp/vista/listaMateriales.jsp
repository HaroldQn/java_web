<%-- 
    Document   : listaMateriales
    Created on : 16 set. 2025, 11:32:09
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connecion cnx = new Connecion().getConnection();
            PreparedStatement ps;
            ResultSet rs;

            String cadenaSql = "";

            List<Material> lista = null;

            try{
                ps = cnx.prepareStatement(cadenaSql);
                rs = ps.executeQuery();
                lista = new ArrayList<>();
                while(rs.next()){
                    Material m = new Material(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getInt("cantidad"),
                        rs.getString("categoria"),
                        new Categoria(rs.getInt("id_categoria"), rs.getString("nombre_categoria")));
                    lista.add(m);
                }
                rs.close();
                ps.close();
                cnx.close();
            }catch(SQLException e){
                e.printStackTrace();

            }
            request.setAttribute("listaMateriales", lista);
        %>

        <div class="container">
            <table class="tablaRep">
                <caption>Lista materiales</caption>
            
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Categoria</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="m" items="${requestScope.listaMateriales}">
                        <tr>
                            <td>${m.id}</td>
                            <td>${m.nombre}</td>
                            <td>${m.cantidad}</td>
                            <td>${m.categoria.nombre}</td>
                            <td>
                                <a href="">Editar</a>
                                <a href="">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot></tfoot>
                    <tr>
                        <td colspan="5">2025</td>
                    </tr>
                </tfoot>
            </table>
    </div>


    </body>
</html>
