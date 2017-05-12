/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.LogicaNegocio;

import com.susana.DAO.*;
import com.susana.Entidades.Parte;
import java.util.ArrayList;

/**
 *
 * @author acer
 */
//GESTIONA TODO LO REFERENTE A LINEA DE NEGOCIO DE PARTES, SEPARANDO EL CÓDIGO POR RESPONSABILIDADES

public class PartesLN {
    PartesDAO pdao =new PartesDAO();
    
    public Integer insertarDatos (Parte p){
        return pdao.insertarDatos(p);    
    }
    public void actualizarDatos (Parte p){
        pdao.actualizarDatos(p);
    }
    public void borrarDatos (Parte p){
        pdao.borrarDatos(p);
    }
    public ArrayList<Parte> listarDatos (Parte p){
        return pdao.listarDatos(p);
    }    

  /*  public String getSumaHorasViajes(String fechaParte) {
        ViajesLN vln= new ViajesLN();
        return vln.getSumaHorasViajes(fechaParte);
    }
    */

    public Parte listarParteAbierto(Parte p) {
       return pdao.listarParteAbierto(p);
    }
}
