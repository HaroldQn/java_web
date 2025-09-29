<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-4">
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre Producto</th>
                <th>Cantidad</th>
                <th>Categor�a</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody id="tb_material">
            <c:forEach var="m" items="${listaMateriales}" varStatus="status">
                <tr>
                    <td data-idmaterial="${m.idMaterial}" >${status.index + 1}</td>
                    <td>${m.nombre}</td>
                    <td class="text-end" >${m.cantidad}</td>
                    <td data-id="${m.categoria.idCategoria}">${m.categoria.nombre}</td>
                    <td class="text-center">
                        <button data-accion="editar"  class="btn btn-warning btn-sm"><i class="bi bi-pencil-fill"></i></button>
                        <button data-accion="eliminar" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></button>
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
