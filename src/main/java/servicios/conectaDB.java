/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servicios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LAB-USR-LNORTE
 */
public class conectaDB {
    
    public static Connection getConection(){
        Connection cnx = null;
        
    
        String url = "jdbc:mysql://localhost:3306/bddnegocio?useTimeZone=true&"
                + "serverTimezone=UTC&autoReconnect=true";

        String user = "root";
        String clave = "";
        String Driver = "com.mysql.cj.jdbc.Driver";
        
    
        try {
            Class.forName(Driver);
            cnx = DriverManager.getConnection(url, user, clave);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(conectaDB.class.getName()).log(Level.SEVERE, null, ex);
        }catch (SQLException ex) {
            Logger.getLogger(conectaDB.class.getName()).log(Level.SEVERE, "Error en la conexión", ex);
        }
        
        return cnx;

    }
    
    public static void main(String[] args){
        Connection cx = conectaDB.getConection();
        try{
            System.out.println("EXISTOSO BRO"+ cx.getCatalog());
        }
        catch (SQLException ex) {
            Logger.getLogger(conectaDB.class.getName()).log(Level.SEVERE, "Error en la conexión", ex);
        }

        
        
    }
    
}
