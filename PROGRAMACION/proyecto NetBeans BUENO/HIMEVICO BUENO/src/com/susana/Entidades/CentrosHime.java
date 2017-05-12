/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.Entidades;
import com.susana.Entidades.Trabajador;
import java.util.ArrayList;

/**
 *
 * @author acer
 */
public class CentrosHime {
    private String nombre;
    private String calle;
    private String numero;
    private String codigoPostal;
    private String telefono;
    private String ciudad;
    private String provincia;
    private Integer idCentro;  //ojo esto se hace con una secuencia al hacer el insert en la base de datos

    private ArrayList<Trabajador>trabajadores;
    
    /**
 * Constructor de clase vacio     
 */
    public CentrosHime() {
    }

    /*
 * Constructor de clase con todos los atributos     
 */
    public CentrosHime(String nombre, String calle, String numero, String codigoPostal, String telefono, String ciudad, String provincia, Integer idCentro) {
        this.nombre = nombre;
        this.calle = calle;
        this.numero = numero;
        this.codigoPostal = codigoPostal;
        this.telefono = telefono;
        this.ciudad = ciudad;
        this.provincia = provincia;
        this.idCentro = idCentro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public Integer getIdCentro() {
        return idCentro;
    }

    public void setIdCentro(Integer idCentro) {
        this.idCentro = idCentro;
    }

    
}
