<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-4">
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre Producto</th>
                <th>Cantidad</th>
                <th>Categoría</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody id="tb_material">
            <c:forEach var="m" items="${listaMateriales}">
                <tr>
                    <td>${m.idMaterial}</td>
                    <td>${m.nombre}</td>
                    <td>${m.cantidad}</td>
                    <td>${m.categoria.nombre}</td
                    <td>
                        <a class="btn btn-warning btn-sm btn-editar" dataset="${m.categoria.idCategoria}">Editar</a>
                        <a class="btn btn-danger btn-sm btn-eliminar" dataset="${m.categoria.idCategoria}" >Eliminar</a>
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
