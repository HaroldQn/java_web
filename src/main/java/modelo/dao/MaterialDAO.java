/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.Categoria;
import servicios.conectaDB;
import modelo.dto.Material;

/**
 *
 * @author efrai
 */
public class MaterialDAO {
    private Connection cnx;

    public MaterialDAO() {
        cnx = conectaDB.getConection();
    }
    
    public List<Material> getListMateriales(){
        PreparedStatement ps;
        ResultSet rs;

        String cadSQL = "select m.idmaterial, m.nombre,m.cantidad,c.idcategoria,c.nombre as 'categoria' " +
                        "from material m inner join categorias c on m.idcategoria = c.idcategoria order by m.idmaterial;";

        List<Material> lista = new ArrayList<>();

        try {
            ps = cnx.prepareStatement(cadSQL);
            rs = ps.executeQuery();
            while(rs.next()){
                Material m = new Material(
                    rs.getInt("idmaterial"),
                    rs.getString("nombre"),
                    rs.getInt("cantidad"),
                    new Categoria(rs.getInt("idcategoria"), rs.getString("categoria")));
                lista.add(m);
            }
            rs.close();
        } catch (Exception e) {}
        return lista;
    }
    
    public boolean registrarMaterial(Material material) {
        boolean resultado = false;

        String cadSQL = "INSERT INTO material(nombre, cantidad, idcategoria) VALUES (?, ?, ?)";

        try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
            ps.setString(1, material.getNombre());
            ps.setInt(2, material.getCantidad());

            if (material.getCategoria() != null) {
                ps.setInt(3, material.getCategoria().getIdCategoria());
            } else {
                ps.setNull(3, java.sql.Types.INTEGER);
            }

            int filas = ps.executeUpdate();
            resultado = (filas > 0);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultado;
    }
    
    public boolean editarMaterial(Material material) {
        boolean resultado = false;

        String cadSQL = "UPDATE material SET nombre = ?, cantidad = ?, idcategoria = ? WHERE idmaterial = ?";

        try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
            ps.setString(1, material.getNombre());
            ps.setInt(2, material.getCantidad());
            ps.setInt(3, material.getCategoria().getIdCategoria());
            ps.setInt(4, material.getIdMaterial());

            int filas = ps.executeUpdate();
            resultado = (filas > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultado;
    }
    
    public boolean eliminarMaterial(int idMaterial) {
        String sql = "DELETE FROM material WHERE idmaterial = ?";
        try (PreparedStatement ps = cnx.prepareStatement(sql)) {
            ps.setInt(1, idMaterial);
            int filas = ps.executeUpdate();
            return filas > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }





    
}
