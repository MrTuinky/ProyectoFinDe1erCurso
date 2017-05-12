/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.DAO;

import com.susana.Entidades.Parte;
import com.susana.Entidades.Viaje;
import com.susana.GUI.Login;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
public class ViajesDAO {

    ConexionTest conexion = new ConexionTest();
//GESTIONA EN LA BASE DE DATOS TODO LO REFERENTE A VIAJES, SEPARANDO EL CÓDIGO POR RESPONSABILIDADES

    //TODO: VIAJES
    public void insertarDatos(Parte p) {
        Connection cxn = null;
        PreparedStatement sentencia = null;
        boolean resp = true;
        try {

            cxn = conexion.getConexion();
            String sql = "INSERT INTO  VIAJE  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            sentencia = cxn.prepareStatement(sql);
            sentencia.setString(1, null);
            sentencia.setDate(2, p.getFecha());
            sentencia.setDate(3, p.getFecha());
            sentencia.setString(4, p.getEstado());
            sentencia.setDouble(5, p.getKmPrincipio());
            sentencia.setDouble(6, p.getKmFinal());
            sentencia.setDouble(7, p.getGastoGasoil());
            sentencia.setDouble(8, p.getGastoAutopista());
            sentencia.setDouble(9, p.getGastoDietas());
            sentencia.setDouble(10, p.getGastosVarios());
            sentencia.setString(11, p.getIncidencias());
            sentencia.setString(12, p.getValidar());
            sentencia.setDouble(13, p.gettotalHoras());
            int filas = sentencia.executeUpdate();
            if (filas == 1) {
                resp = true;
            } else {
                resp = false;
            }
            sentencia.close();
            cxn.close();

        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


    /*   public void actualizarDatos(Viaje p) {
        Connection cxn = null;
        PreparedStatement sentencia = null;
        boolean resp = true;
        try {
          
            cxn = conexion.getConexion();
            String sql = "UPDATE VIAJE SET HORA_SALIDA = ?, HORA_LLEGADA = ?, MATRICULA_VEHICULO = ?, TOTAL_HORAS = ?,NUM_PARTE=?,"
                    + " GASTO_AUTOPISTA=?, GASTO_DIETAS=?, GASTOS_VARIOS=?,"
                    + " USUARIO=?, FECHA=?,  WHERE VALIDADO=?";
            sentencia = cxn.prepareStatement(sql);
            sentencia.setString(1, v.getUsuario());
            sentencia.setString(2, p.getEstado());
            sentencia.setDouble(3, p.getKmPrincipio());
            sentencia.setDouble(4, p.getKmFinal());
            sentencia.setDouble(5, p.getGastoGasoil());
            sentencia.setDouble(6, p.getGastoAutopista());
            sentencia.setDouble(7, p.getGastoDietas());
            sentencia.setDouble(8, p.getGastosVarios());
            sentencia.setString(9, p.getIncidencias());
            sentencia.setString(10, p.getValidar());
            sentencia.setDouble(11, p.gettotalHoras());
            sentencia.setString(12, "NO");
            int filas = sentencia.executeUpdate();
            if (filas == 1) {
                resp = true;
            } else {
                resp = false;
            }
            sentencia.close();
            cxn.close();

        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }*/
    //cxn.setAutoCommit(false);
    /* TODO: DATOS REALES UPDATE VIAJE  String sql = "UPDATE INTO  PARTE( TRABAJADOR_USUARIO,  FECHA,  ESTADO, "
                    + "KM_PRINCIPIO, KM_FINAL,  GASTO_GASOIL, GASTO_AUTOPISTA,"
                    + "GASTO_DIETAS, GASTOS_VARIOS,  INCIDENCIAS, VALIDADO,   EXCESO "
                    + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            sentencia = cxn.prepareStatement(sql);
            sentencia.setString(1, p.getUsuario());
            sentencia.setDate(2, p.getFecha());
            sentencia.setString(3, p.getEstado());
            sentencia.setDouble(4, p.getKmPrincipio());
            sentencia.setDouble(5, p.getKmFinal());
            sentencia.setDouble(6, p.getGastoGasoil());
            sentencia.setDouble(7, p.getGastoAutopista());
            sentencia.setDouble(8, p.getGastoDietas());
            sentencia.setDouble(9, p.getGastosVarios());
            sentencia.setString(10, p.getIncidencias());
            sentencia.setString(11, p.getValidar());
            sentencia.setDouble(12, p.getExceso());
            int filas = sentencia.executeUpdate();
            if (filas == 1) {
                resp=true;
            } else {
                resp=false;
            }
            sentencia.close();
            cxn.close();
         
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } */
    //TODO: DELETE
    /*   public void borrarDatos(Viaje p) {
        Connection cxn = null;
        PreparedStatement sentencia = null;
        boolean resp = true;
        try {
          
      
            

            cxn = conexion.getConexion();
            //cxn.setAutoCommit(false);
            String sql = "DELETE FROM VIAJE WHERE NUM_PARTE = ? AND ESTADO = ?; ";
            sentencia = cxn.prepareStatement(sql);
            sentencia.setInt(1, p.getNumParte());
            sentencia.setString(2, "CERRADO");
            sentencia.setString(2, p.getEstado());
            sentencia.setDouble(3, p.getKmPrincipio());
            sentencia.setDouble(4, p.getKmFinal());
            sentencia.setDouble(5, p.getGastoGasoil());
            sentencia.setDouble(6, p.getGastoAutopista());
            sentencia.setDouble(7, p.getGastoDietas());
            sentencia.setDouble(8, p.getGastosVarios());
            sentencia.setString(9, p.getIncidencias());
            sentencia.setString(10, p.getValidar());
            sentencia.setDouble(11, p.gettotalHoras());
            sentencia.setString(12, "NO");
            int filas = sentencia.executeUpdate();
            if (filas == 1) {
                resp = true;
            } else {
                resp = false;
            }
            sentencia.close();
            cxn.close();

        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }   
     */
 /*   public void listarDatos(Parte p) {
        Connection cxn = null;
        PreparedStatement sentencia = null;
        boolean resp = true;
        try {

            cxn = conexion.getConexion();
            //cxn.setAutoCommit(false);
            String sql = "select * from PARTE where ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            sentencia = cxn.prepareStatement(sql);
            sentencia.setString(1, ViajesDAO.get);
            sentencia.setString(2, p.getUsuario());
            sentencia.setDate(3, p.getFecha());
            sentencia.setString(4, p.getEstado());
            sentencia.setDouble(5, p.getKmPrincipio());
            sentencia.setDouble(6, p.getKmFinal());
            sentencia.setDouble(7, p.getGastoGasoil());
            sentencia.setDouble(8, p.getGastoAutopista());
            sentencia.setDouble(9, p.getGastoDietas());
            sentencia.setDouble(10, p.getGastosVarios());
            sentencia.setString(11, p.getIncidencias());
            sentencia.setString(12, p.getValidar());
            sentencia.setDouble(13, p.gettotalHoras());
            int filas = sentencia.executeUpdate();
            if (filas == 1) {
                resp = true;
            } else {
                resp = false;
            }
            sentencia.close();
            cxn.close();

        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }*/
    public ViajesDAO() {
    }

    public ConexionTest getConexion() {
        return conexion;
    }

    public void setConexion(ConexionTest conexion) {
        this.conexion = conexion;
    }

}

/* TODO: operacion suma horas, fechas

public int sumarHoras(int fechaParte) {
        Connection cxn = null;
        PreparedStatement sentencia = null;
        Time resp = null;
        try {
            conexion.conectar();
            cxn = conexion.getConexion();
            //cxn.setAutoCommit(false);
            String sql = "SELECT sum(Hora_llegada-Hora_salida) as HorasTotales from viaje where PARTE_fecha=?";

            sentencia = cxn.prepareStatement(sql);

            sentencia.setT(1, fechaParte);

            ResultSet resul = sentencia.executeQuery();
            if (resul == null) {
                System.out.println("Me devuelve nulo");
            } else {
                resul.next();
                resp = resul.getTime(1);
                System.out.println("Me devuelve" +resul.getDouble(1));
            }
            sentencia.close();
            cxn.close(); //conexion.desconectar();

        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViajesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;
    }
}
 */
