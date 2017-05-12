/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.LogicaNegocio;

import com.susana.DAO.*;
import com.susana.Entidades.Parte;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author acer
 */
//GESTIONA TODO LO REFERENTE A LINEA DE NEGOCIO DE VIAJES, SEPARANDO EL CÓDIGO POR RESPONSABILIDADES
//TODO: VIAJES
public class ViajesLN {
    ViajesDAO vdao =new ViajesDAO();
    
  /*  public void insertarDatos (Viaje v){
        vdao.insertarDatos(v);    
    }
    public void actualizarDatos (Viaje v){
        vdao.actualizarDatos(v);
    }
    public void borrarDatos (Viaje v){
        vdao.borrarDatos(v);
    }
    public void listarDatos (Viaje v){
        vdao.listarDatos(v);
    }    
*/
   /* public String getSumaHorasViajes(String fechaParte) {
        Date fp=Date.valueOf(fechaParte);
        Time t=vdao.sumarHoras(fp);
        return t.toString();
    }
    */
    
}
