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

/**
 *
 * @author LAB-USR-LNORTE
 */
public class CategoriaDAO{
    private Connection cnx;

    public CategoriaDAO() {
        cnx = conectaDB.getConection();
    }
    
    public List<Categoria> getList(){
        PreparedStatement ps;
        ResultSet rs;
        String cadSQL = "SELECT * FROM categorias;";
        List<Categoria> lista = null;
        try {
            ps = cnx.prepareStatement(cadSQL);
            rs = ps.executeQuery();
            lista = new ArrayList<>();
            System.out.println("test");
            while (rs.next()){
                Categoria c = new Categoria(
                        rs.getInt("idcategoria"),
                        rs.getString("nombre")
                );
                lista.add(c);
            }
            rs.close();
        } catch (Exception e) {
        }
        return lista;
    }
}
