/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.Entidades;

import com.susana.Entidades.Transportista;
import java.util.ArrayList;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class Vehiculo {
    private String matricula;
    private String marca;
    private String modelo;
    
    private ArrayList<Transportista>transportistas;

       /*
 * Constructor de clase VACIO     
 */
    public Vehiculo() {
    }

       /*
 * Constructor de clase con todos los atributos     
 */
    public Vehiculo(String matricula, String marca, String modelo) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }


    
    
}
