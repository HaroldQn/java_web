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
            <form id="formMateriales">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <label>Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                        <label>Cantidad</label>
                        <input type="number" class="form-control" id="cantidad" name="cantidad" required>
                        <label>Categoria</label>
                        <select class="form-select" id="categoria" name="categoria" required>
                            <option value="">------Seleccione------</option>
                            <c:forEach var="cat" items="${listaCategoria}">
                                <option value="${cat.idCategoria}">${cat.nombre}</option>
                            </c:forEach>  
                        </select>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary mt-3 ">Agregar</button>
                        </div>
                    </div>
                    <div class="col-md-4"></div>
                </div>

            </form>
            
        </div>
            
    <jsp:include page="listaMateriales.jsp" />
    
    <script type="module" src="${pageContext.request.contextPath}/js/materiales.js"></script>
    </body>
</html>
