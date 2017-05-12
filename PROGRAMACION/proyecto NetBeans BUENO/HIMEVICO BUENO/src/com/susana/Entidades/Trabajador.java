/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.Entidades;

import com.susana.GUI.Login;
import com.susana.DAO.ConexionTest;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public abstract class Trabajador {

    private String usuario;
    private String contrasena;
    private String dni;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String calle;
    private String portal;
    private String piso;
    private String mano;
    private String categoria;
    private Integer centro;
    private String telefonoEmpresa;
    private String telefonoPersonal;
    private double salario;
    private java.util.Date fecha;
    
    private Login login;
    private ArrayList<Aviso>avisos;
    private CentrosHime centrosHimes;
    
    //METODO CAMBIO CONTRASEÑA: PARÁMETROS DE ENTRADA, USUARIO, CONTRASEÑA NUEVA, CONSTRASEÑA A CAMBIAR
    
    public static boolean cambioContrase (String usu, String contraNuev, String contraViej) throws SQLException{
        try {
            ConexionTest.conectar();
            String sql = ("UPDATE TRABAJADOR SET CONTRASENA = ? WHERE USUARIO = ? AND CONTRASENA = ?");
            PreparedStatement ps = ConexionTest.getConexion().prepareStatement(sql);
            ps.setString(1, contraNuev);
            ps.setString(2, usu);
            ps.setString(3, contraViej);
            ps.executeUpdate();
          ConexionTest.desconectar();
          return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Trabajador.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
     
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Integer getCentro() {
        return centro;
    }

    public void setCentro(Integer centro) {
        this.centro = centro;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getPortal() {
        return portal;
    }

    public void setPortal(String portal) {
        this.portal = portal;
    }

    public String getPiso() {
        return piso;
    }

    public void setPiso(String piso) {
        this.piso = piso;
    }

    public String getMano() {
        return mano;
    }

    public void setMano(String mano) {
        this.mano = mano;
    }

    public String getTelefonoEmpresa() {
        return telefonoEmpresa;
    }

    public void setTelefonoEmpresa(String telefonoEmpresa) {
        this.telefonoEmpresa = telefonoEmpresa;
    }

    public String getTelefonoPersonal() {
        return telefonoPersonal;
    }

    public void setTelefonoPersonal(String telefonoPersonal) {
        this.telefonoPersonal = telefonoPersonal;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

}
