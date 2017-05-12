/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.Entidades;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author acer
 */
public class Parte {
   private double kmPrincipio;
   private double kmFinal;
   private Date fecha;
   private String estado;
   private double gastoGasoil;
   private double gastoAutopista;
   private double gastoDietas;
   private double gastosVarios;
   private String incidencias;
   private String validar;
   private double totalHoras;
   private String usuario;
   private int numParte;
   
   private Aviso aviso;
   private ArrayList<Viaje> viajes;
   private Transportista transportista;

      /*
 * Constructor de clase vacio     
 */
    public Parte() {
    }

       /*
 * Constructor de clase con todos los atributos     
 */
    public Parte(int numParte, double kmPrincipio, double kmFinal, Date fecha, String estado, double gastoGasoil, double gastoAutopista, double gastoDietas, double gastosVarios, String incidencias, String validar, double totalHoras, String usuario, Aviso aviso, Transportista transportista) {
        this.kmPrincipio = kmPrincipio;
        this.kmFinal = kmFinal;
        this.fecha = fecha;
        this.estado = estado;
        this.gastoGasoil = gastoGasoil;
        this.gastoAutopista = gastoAutopista;
        this.gastoDietas = gastoDietas;
        this.gastosVarios = gastosVarios;
        this.incidencias = incidencias;
        this.validar = validar;
        this.totalHoras = totalHoras;
        this.usuario = usuario;
        this.aviso = aviso;
        this.transportista = transportista;
        this.numParte = numParte;
    }

    public ArrayList<Viaje> getViajes() {
        return viajes;
    }

    public void setViajes(ArrayList<Viaje> viajes) {
        this.viajes = viajes;
    }

    public int getNumParte() {
        return numParte;
    }

    public void setNumParte(int numParte) {
        this.numParte = numParte;
    }

    public double getKmPrincipio() {
        return kmPrincipio;
    }

    public void setKmPrincipio(double kmPrincipio) {
        this.kmPrincipio = kmPrincipio;
    }

    public double getKmFinal() {
        return kmFinal;
    }

    public void setKmFinal(double kmFinal) {
        this.kmFinal = kmFinal;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getGastoGasoil() {
        return gastoGasoil;
    }

    public void setGastoGasoil(double gastoGasoil) {
        this.gastoGasoil = gastoGasoil;
    }

    public double getGastoAutopista() {
        return gastoAutopista;
    }

    public void setGastoAutopista(double gastoAutopista) {
        this.gastoAutopista = gastoAutopista;
    }

    public double getGastoDietas() {
        return gastoDietas;
    }

    public void setGastoDietas(double gastoDietas) {
        this.gastoDietas = gastoDietas;
    }

    public double getGastosVarios() {
        return gastosVarios;
    }

    public void setGastosVarios(double gastosVarios) {
        this.gastosVarios = gastosVarios;
    }

    public String getIncidencias() {
        return incidencias;
    }

    public void setIncidencias(String incidencias) {
        this.incidencias = incidencias;
    }

    public String getValidar() {
        return validar;
    }

    public void setValidar(String validar) {
        this.validar = validar;
    }

    public double gettotalHoras() {
        return totalHoras;
    }

    public void settotalHoras(double totalHoras) {
        this.totalHoras = totalHoras;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public Aviso getAviso() {
        return aviso;
    }

    public void setAviso(Aviso aviso) {
        this.aviso = aviso;
    }

    public Transportista getTransportista() {
        return transportista;
    }

    public void setTransportista(Transportista transportista) {
        this.transportista = transportista;
    }

    @Override
    public String toString() {
        return "Parte{" + "kmPrincipio=" + kmPrincipio + ", kmFinal=" + kmFinal + ", fecha=" + fecha + ", estado=" + estado + ", gastoGasoil=" + gastoGasoil + ", gastoAutopista=" + gastoAutopista + ", gastoDietas=" + gastoDietas + ", gastosVarios=" + gastosVarios + ", incidencias=" + incidencias + ", validar=" + validar + ", totalHoras=" + totalHoras + ", usuario=" + usuario + ", numParte=" + numParte + '}';
    }

    public Object get(int index) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
}
