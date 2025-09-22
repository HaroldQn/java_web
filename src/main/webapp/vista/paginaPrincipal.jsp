<%-- 
    Document   : paginaPrincipal
    Created on : 1 set. 2025, 3:04:15 p. m.
    Author     : LAB-USR-LNORTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="bg-white">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Pagee</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Pagina Pricipal!</h1>

            <h4 class="text-center">Registro de Material</h4>
            <form action="<%= request.getContextPath() %>/controladorMateriales" method="POST" id="formMateriales">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <label>Nombre</label>
                        <input type="text" class="form-control" value="${nombre}" name="nombre" required>
                        <label>Cantidad</label>
                        <input type="number" class="form-control" value="${cantidad}" name="cantidad" required>
                        <label>Categoria</label>
                        <select class="form-select" name="categoria" required>
                            <option value="">------Seleccione------</option>
                            <c:forEach var="cat" items="${listaCategoria}">
                                <option value="${cat.idCategoria}">${cat.nombre}</option>
                            </c:forEach>  
                        </select>
                    </div>
                    <div class="col-md-4"></div>
                </div>

            </form>
            
        </div>
    <!-- <c:if test ="${requestScope.mensaje != null}"> 
        <script type="module">
            import { mostrarAlerta } from '<%= request.getContextPath() %>/js/listaMateriales.js';
            mostrarAlerta('success', 'Hola');
        </script>
    </c:if> -->
            
    <%@include file="listaMateriales.jsp" %>
    </body>
</html>
