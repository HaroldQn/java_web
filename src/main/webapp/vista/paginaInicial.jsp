<%-- 
    Document   : paginaPrincipal
    Created on : 1 set. 2025, 3:04:15 p. m.
    Author     : LAB-USR-LNORTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Principal</title>
    </head>
    <body>
        <h1>Pagina Pricipal!</h1>
        
        <h4>Registro de Material</h4>
            <form>
                <div class="row">
                    <div class="col-md-04"></div>
                    <div class="col-md-04">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre" placeholder="">
                        <label>Cantidad</label>
                        <input type="number" class="form-control" name="cantidad" placeholder="">
                        <label>Categoria</label>
                        <select class="form-select" name="categoria" >
                            
                            <option>SELECIONE</option>
                        </select>
                    </div>
                    <div class="col-md-04"></div>
                </div>
                
            </form>
    </body>
</html>
