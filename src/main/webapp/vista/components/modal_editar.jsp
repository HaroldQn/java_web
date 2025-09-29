<%-- 
    Document   : modal_editar
    Created on : 29 set. 2025, 00:36:07
    Author     : efrai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="modal_editar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="titulo_modal"></h1>
      </div>
      <div class="modal-body">
            <form id="form_modal">
                <input type="hidden" name="idmaterial" id="idMaterial">
                <div>
                    <label>Nombre del Producto*</label>
                    <input type="text" class="form-control" name="nombre" id="nom_producto_editar" required>
                </div>
                <div>
                    <label>Cantidad del Producto*</label>
                    <input type="number" class="form-control" name="cantidad" id="cant_producto_editar" required>
                </div>
                <div>
                    <label>Categooria*</label>
                    <select  class="form-select" name="categoria" id="cat_producto_editar">
                      <option value="">------Seleccione------</option>
                      <c:forEach var="cat" items="${listaCategoria}">
                          <option value="${cat.idCategoria}">${cat.nombre}</option>
                      </c:forEach>
                    </select>

                </div>            
                <div class="modal-footer w-100">
                    <div class="row w-100">
                      <div class="col-6">
                        <button type="button" class="btn btn-outline-danger w-100" data-bs-dismiss="modal">Cerrar</button>       
                      </div>
                      <div class="col-6">
                          <button type="submit" class="btn btn-outline-dark w-100" >Actualizar</button>                  
                      </div>
                    </div>
                </div>
            </form>
      </div>

    </div>
  </div>
</div>