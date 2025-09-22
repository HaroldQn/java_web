/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import java.sql.Connection;
import servicios.conectaDB;

/**
 *
 * @author efrai
 */
public class MaterialDAO {
    private Connection cnx;

    public MaterialDAO() {
        cnx = conectaDB.getConection();
    }
    
}
