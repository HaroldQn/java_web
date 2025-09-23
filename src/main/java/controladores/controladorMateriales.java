/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.MaterialDAO;
import modelo.dto.Categoria;
import modelo.dto.Material;

/**
 *
 * @author LAB-USR-LNORTE
 */
@WebServlet(name = "controladorMateriales", urlPatterns = {"/controladorMateriales"})
@MultipartConfig
public class controladorMateriales extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controladorMateriales</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controladorMateriales at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");

            List<Material> listMat = new MaterialDAO().getListMateriales();
            String json = new Gson().toJson(listMat);

            try (PrintWriter out = response.getWriter()) {
                out.print(json);
            }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("application/json;charset=UTF-8");
        
            String nombre = request.getParameter("nombre");
            String cantidadStr = request.getParameter("cantidad");
            String categoriaStr = request.getParameter("categoria");
            
            System.out.println("Nombre: " + nombre);
            System.out.println("Cantidad (string): " + cantidadStr);
            System.out.println("Categoria (string): " + categoriaStr);
            
            int cantidad = Integer.parseInt(cantidadStr);
            int idCategoria = Integer.parseInt(categoriaStr);
            
            Material nuevo = new Material();
            nuevo.setNombre(nombre);
            nuevo.setCantidad(cantidad);
            nuevo.setCategoria(new Categoria(idCategoria, null));

            boolean exito = new MaterialDAO().registrarMaterial(nuevo);
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("success", exito);
            
            String json = new Gson().toJson(resultado);
            
            try (PrintWriter out = response.getWriter()) {
                out.print(json);
            }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
