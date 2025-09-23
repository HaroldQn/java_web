import { toast } from "./exports/sweet.js";

const form = document.getElementById("formMateriales");
const tbody = document.getElementById("tb_material");
const URL = "http://localhost:8081/ProyectoPROGWEB/controladorMateriales";

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
                <td data-id="${categoria.idCategoria}" >${categoria.nombre}</td>
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
  const button = e.target.closest("button");
  if (!button) return;

  //Editar
  if (button.classList.contains("btn-warning")) {
    const fila = button.closest("tr");  
    const celdas = fila.querySelectorAll("td");
    const id = celdas[0].innerText;
    const nombre = celdas[1].innerText;
    const cantidad = celdas[2].innerText;
    const categoria = celdas[3].dataset.id;

    console.log(id, nombre, cantidad, categoria);
  }

  // Eliminar
  /** if (boton.classList.contains("btn-danger")) {
    const fila = boton.closest("tr");
    const id = fila.querySelector("td").innerText;

    if (confirm(`¿Seguro que quieres eliminar el material con ID ${id}?`)) {
      eliminarMaterial(id);
    }
  } */
});


