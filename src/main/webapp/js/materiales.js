import { toast, Preguntar } from "./exports/sweet.js";
import { enviarPeticionPost } from "./exports/post_component.js";

const form = document.getElementById("formMateriales");
const form_modal = document.getElementById("form_modal");

const tbody = document.getElementById("tb_material");
const modalEditar = new bootstrap.Modal(document.getElementById("modal_editar"));
const URL = "http://localhost:8082/ProyectoPROGWEB/controladorMateriales";

// Inputs Modal editar
const idMaterial = document.getElementById("idMaterial");
const tituloModal = document.getElementById("titulo_modal");
const nomProductoEditar = document.getElementById("nom_producto_editar");
const cantProductoEditar = document.getElementById("cant_producto_editar");
const catProductoEditar = document.getElementById("cat_producto_editar");

async function registrarMaterial(formulario_enviar){
    const success = await enviarPeticionPost(formulario_enviar, "registrar", URL);
    success ? 
        (toast("success", "Registrado Correctamente"), listarMateriales(), form.reset()) :
        toast("warning", "Error al registrar");
    
}

async function editarProducto(formulario_enviar){
    const success = await enviarPeticionPost(formulario_enviar, "editar", URL);
    success ? 
        (toast("success", "Actualizado Correctamente"), listarMateriales(), form_modal.reset()) :
        toast("warning", "Error al actualizar");
}

async function listarMateriales(){
    const res = await fetch(URL);
    const data = await res.json();
    
    tbody.innerHTML = "";
    const render = data.map(({ idMaterial, nombre, cantidad, categoria }, i) => `
            <tr>
                <td>${i + 1}</td>
                <td>${nombre}</td>
                <td>${cantidad}</td>
                <td data-id="${categoria.idCategoria}" >${categoria.nombre}</td>
                <td>
                    <button data-accion="editar" class="btn btn-warning btn-sm">Editar</button>
                    <button data-accion="eliminar"  class="btn btn-danger btn-sm">Eliminar</button>
                </td>
            </tr>
        `).join("");
    tbody.innerHTML = render;
}

async function eliminarMaterial(idMaterial) {
  const formT = new FormData();
  formT.append("idMaterial", idMaterial);

  const success = await enviarPeticionPost(formT, "eliminar", URL);
  success
    ? (toast("success", "Eliminado correctamente"), listarMateriales())
    : toast("warning", "Error al eliminar");
}


function abrirModalEditar(fila) {
  const celdas = fila.querySelectorAll("td");
  const id = celdas[0].innerText;
  const nombre = celdas[1].innerText;
  const cantidad = celdas[2].innerText;
  const categoria = celdas[3].dataset.id;

  tituloModal.innerText = "Editar producto: " + nombre;
  idMaterial.value = id;
  nomProductoEditar.value = nombre;
  cantProductoEditar.value = cantidad;
  catProductoEditar.value = categoria;
  modalEditar.show();
}

form.addEventListener("submit", async (e)=>{
    e.preventDefault();
    await registrarMaterial(form);
});
form_modal.addEventListener("submit", async (e)=>{
    e.preventDefault();
    await editarProducto(form_modal);
    modalEditar.hide();
});


tbody.addEventListener("click", (e) => {
  const accion = e.target.dataset.accion;
  if (!accion) return;

  const fila = e.target.closest("tr");

  if (accion === "editar") abrirModalEditar(fila);
  if (accion === "eliminar"){
        const id = fila.querySelector("td").innerText;
        Preguntar(
                ()=>eliminarMaterial(id),
                "¿Deseas eliminar el producto?",
                "question"
        );
  };
});


