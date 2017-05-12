/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.Entidades;

import com.susana.Entidades.Parte;
import java.time.LocalTime;
import java.time.LocalDate;

public class Viaje {

    private String usuario;
    private int idViaje;
    private LocalTime horaSalida;
    private LocalTime horaLlegada;
    private LocalTime totalHorasViaje;
    private String matricula;
    private LocalDate fecha;
    private int numParte;

    /*
 * Constructor de clase VACIO     
     */
    public Viaje() {
    }

    /*
 * Constructor de clase con todos los atributos     
     */
    public Viaje(String usuario, int idViaje, LocalTime horaSalida, LocalTime horaLlegada, LocalTime totalHorasViaje, String matricula, LocalDate fecha, int numParte) {
        this.usuario = usuario;
        this.idViaje = idViaje;
        this.horaSalida = horaSalida;
        this.horaLlegada = horaLlegada;
        this.totalHorasViaje = totalHorasViaje;
        this.matricula = matricula;
        this.fecha = fecha;
        this.numParte = numParte;
    }

  
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
    }

    public LocalTime getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(LocalTime horaSalida) {
        this.horaSalida = horaSalida;
    }

    public LocalTime getHoraLlegada() {
        return horaLlegada;
    }

    public void setHoraLlegada(LocalTime horaLlegada) {
        this.horaLlegada = horaLlegada;
    }

    public LocalTime getTotalHorasViaje() {
        return totalHorasViaje;
    }

    public void setTotalHorasViaje(LocalTime totalHorasViaje) {
        this.totalHorasViaje = totalHorasViaje;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public int getNumParte() {
        return numParte;
    }

    public void setNumParte(int numParte) {
        this.numParte = numParte;
    }

}
