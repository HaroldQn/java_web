import { toast } from "./exports/sweet.js";

const form = document.getElementById("formMateriales");
const tbody = document.getElementById("tb_material");
let btn_editar = document.querySelectorAll(".btn-editar");
const URL = "http://localhost:8082/ProyectoPROGWEB/controladorMateriales";

async function registrarMaterial(){
    const parametros = new URLSearchParams(new FormData(form));

    const res = await fetch(URL, { 
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: parametros.toString() 
    });

    const data = await res.json();
    const { success } = data;
    success ? 
        (toast("success", "Registrado Correctamente"), listarMateriales(), form.reset()) :
        toast("warning", "Error al registrar");
}

async function listarMateriales(){
    const res = await fetch(URL);
    const data = await res.json();
    
    tbody.innerHTML = "";
    const render = data.map(({ idMaterial, nombre, cantidad, categoria }) => `
            <tr>
                <td>${idMaterial}</td>
                <td>${nombre}</td>
                <td>${cantidad}</td>
                <td>${categoria.nombre}</td>
                <td>
                    <a href="" class="btn btn-warning btn-sm">Editar</a>
                    <a href="" class="btn btn-danger btn-sm">Eliminar</a>
                </td>
            </tr>
        `).join("");
    tbody.innerHTML = render;
}

form.addEventListener("submit", async (e)=>{
    e.preventDefault();
    await registrarMaterial();
});

tbody.addEventListener("click", (e) => {
  e.preventDefault(); // evita que el <a href=""> recargue la página
  
  const boton = e.target.closest("a"); // busca si el click vino de un <a>
  if (!boton) return; // si no fue un <a>, no hacemos nada

  // Caso: Editar
  if (boton.classList.contains("btn-warning")) {
    const fila = boton.closest("tr");  
    const celdas = fila.querySelectorAll("td");

    const id = celdas[0].innerText;       // idMaterial
    const nombre = celdas[1].innerText;   // nombre
    const cantidad = celdas[2].innerText; // cantidad
    const categoria = celdas[3].innerText;// nombre de categoría

    document.getElementById("id_producto").value = id;
    document.getElementById("nombre_producto").value = nombre;
    document.getElementById("cantidad_producto").value = cantidad;
    document.getElementById("categoria_producto").value = categoria;

    toast("info", `Editando material ${nombre}`);
  }

  // Caso: Eliminar
  if (boton.classList.contains("btn-danger")) {
    const fila = boton.closest("tr");
    const id = fila.querySelector("td").innerText;

    if (confirm(`¿Seguro que quieres eliminar el material con ID ${id}?`)) {
      eliminarMaterial(id);
    }
  }
});


