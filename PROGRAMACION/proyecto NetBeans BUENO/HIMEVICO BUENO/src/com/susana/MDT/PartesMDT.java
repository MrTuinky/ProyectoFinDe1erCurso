/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.MDT;

import com.susana.Entidades.Parte;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author acer
 */
public class PartesMDT extends AbstractTableModel {

    String[] nombresColumnas = {"NUM_PARTE", "TRABAJADOR_USUARIO", "FECHA", "ESTADO", "KM_PRINCIPIO", "KM_FINAL", "GASTO_GASOIL", "GASTO_AUTOPISTA", "GASTO_DIETAS", "GASTOS_VARIOS", "INCIDENCIAS", "VALIDADO", "TOTAL_HORAS"};
    List<Parte> datos = new ArrayList<>();

    public PartesMDT(List<Parte> datos) {
        this.datos = datos;
    }

    public String getColumnName(int column) {
        return nombresColumnas[column];
    }

    @Override
    public int getRowCount() {
        return this.datos.size();
    }

    @Override
    public int getColumnCount() {
        return nombresColumnas.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Object resp = null;
        if (columnIndex == 0) {
            resp = datos.get(rowIndex).getNumParte();
        } else if (columnIndex == 1) {
            resp = datos.get(rowIndex).getUsuario();
        } else if (columnIndex == 2) {
            resp = datos.get(rowIndex).getFecha();
        } else if (columnIndex == 3) {
            resp = datos.get(rowIndex).getEstado();
        } else if (columnIndex == 4) {
            resp = datos.get(rowIndex).getKmPrincipio();
        } else if (columnIndex == 5) {
            resp = datos.get(rowIndex).getKmFinal();
        } else if (columnIndex == 6) {
            resp = datos.get(rowIndex).getGastoGasoil();
        } else if (columnIndex == 7) {
            resp = datos.get(rowIndex).getGastoAutopista();
        } else if (columnIndex == 8) {
            resp = datos.get(rowIndex).getGastoDietas();
        } else if (columnIndex == 9) {
            resp = datos.get(rowIndex).getGastosVarios();
        } else if (columnIndex == 10) {
            resp = datos.get(rowIndex).getIncidencias();
        } else if (columnIndex == 11) {
            resp = datos.get(rowIndex).getValidar();
        } else if (columnIndex == 12) {
            resp = datos.get(rowIndex).gettotalHoras();
        }
        return resp;
    }

    public Parte getParte(int fila){
        return datos.get(fila);
    }
}
