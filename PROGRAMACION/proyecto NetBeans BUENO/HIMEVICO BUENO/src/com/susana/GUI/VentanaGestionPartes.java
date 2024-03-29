/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.GUI;

import com.susana.DAO.ConexionTest;
import com.susana.Entidades.Parte;
import com.susana.LogicaNegocio.PartesLN;
import com.susana.Entidades.Transportista;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.DefaultTableColumnModel;
import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.ListSelectionModel;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author acer
 */
public class VentanaGestionPartes extends javax.swing.JFrame {

    PartesLN partes;
    Transportista tr;
    Parte pr;
    private DefaultTableModel modeloDeTabla;

    /**
     * Creates new form GestionPartes
     */
    public VentanaGestionPartes() {
        initComponents();
        partes = new PartesLN();
        ListarTabla();
        this.setLocationRelativeTo(null);
    }

    private void ListarTabla() {
        // List<Parte> lista = partes.listarDatos();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPopupMenu1 = new javax.swing.JPopupMenu();
        bgEstadoParte = new javax.swing.ButtonGroup();
        jButton1VerPartes = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jButton2EliminarParte = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTextPane1ListPartes = new javax.swing.JTextPane();
        jButton5FiltrarPorFechasUsuario = new javax.swing.JButton();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jButton4FiltrarPorFechas1 = new javax.swing.JButton();
        jLabel10 = new javax.swing.JLabel();
        jTextField1ParaFiltrarPorUsuario = new javax.swing.JTextField();
        jRadioButton1Todos = new javax.swing.JRadioButton();
        jRadioButton2Abiertos = new javax.swing.JRadioButton();
        jRadioButton3Cerrados = new javax.swing.JRadioButton();
        jLabel1 = new javax.swing.JLabel();
        jTextField1UsuarioParte = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jTextField2NumParte = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jTextField3HorasParte = new javax.swing.JTextField();
        jCheckBox1 = new javax.swing.JCheckBox();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jDateChooser1FechaFin = new com.toedter.calendar.JDateChooser();
        jDateChooser1FechaInicio1 = new com.toedter.calendar.JDateChooser();
        jButton3 = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jTextField3HorasParte1 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jButton1VerPartes.setBackground(new java.awt.Color(153, 255, 255));
        jButton1VerPartes.setText("VER PARTES");
        jButton1VerPartes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1VerPartesActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1VerPartes, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 1050, 40));

        jButton1.setText("Salir");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(990, 490, 70, 30));

        jButton2EliminarParte.setText("Eliminar");
        jButton2EliminarParte.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2EliminarParteActionPerformed(evt);
            }
        });
        getContentPane().add(jButton2EliminarParte, new org.netbeans.lib.awtextra.AbsoluteConstraints(630, 450, -1, -1));

        jButton2.setText("Volver");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(900, 490, 70, 30));

        jScrollPane2.setViewportView(jTextPane1ListPartes);

        getContentPane().add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 80, 828, 0));

        jButton5FiltrarPorFechasUsuario.setText("Filtrar por usuario y  fechas");
        jButton5FiltrarPorFechasUsuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5FiltrarPorFechasUsuarioActionPerformed(evt);
            }
        });
        getContentPane().add(jButton5FiltrarPorFechasUsuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 100, 190, 20));

        jLabel6.setText("FECHA ORIGEN");
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(640, 70, 110, 20));

        jLabel7.setText("FECHA FIN");
        getContentPane().add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(810, 70, 120, 20));

        jButton4FiltrarPorFechas1.setText("Filtrar por fechas");
        jButton4FiltrarPorFechas1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4FiltrarPorFechas1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton4FiltrarPorFechas1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 100, 200, 20));

        jLabel10.setText("USUARIO");
        getContentPane().add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 70, 60, 20));
        getContentPane().add(jTextField1ParaFiltrarPorUsuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 90, 140, 30));

        bgEstadoParte.add(jRadioButton1Todos);
        jRadioButton1Todos.setSelected(true);
        jRadioButton1Todos.setText("Todos");
        getContentPane().add(jRadioButton1Todos, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 70, -1, -1));

        bgEstadoParte.add(jRadioButton2Abiertos);
        jRadioButton2Abiertos.setText("Abiertos");
        getContentPane().add(jRadioButton2Abiertos, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 70, -1, -1));

        bgEstadoParte.add(jRadioButton3Cerrados);
        jRadioButton3Cerrados.setText("Cerrados");
        jRadioButton3Cerrados.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButton3CerradosActionPerformed(evt);
            }
        });
        getContentPane().add(jRadioButton3Cerrados, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 70, -1, -1));

        jLabel1.setText("Usuario");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 440, -1, -1));

        jTextField1UsuarioParte.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1UsuarioParteActionPerformed(evt);
            }
        });
        getContentPane().add(jTextField1UsuarioParte, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 460, 110, -1));

        jLabel2.setText("NUM PARTE");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 440, -1, -1));
        getContentPane().add(jTextField2NumParte, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 460, 130, -1));

        jLabel3.setText("HORAS TOTALES");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 440, -1, -1));

        jTextField3HorasParte.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField3HorasParteActionPerformed(evt);
            }
        });
        getContentPane().add(jTextField3HorasParte, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 460, 120, -1));

        jCheckBox1.setText("VALIDAR");
        jCheckBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCheckBox1ActionPerformed(evt);
            }
        });
        getContentPane().add(jCheckBox1, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 460, -1, -1));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "NUM PARTE", "USUARIO", "FECHA", "ESTADO", "KM PRINCIPIO", "KM FINAL", "G. GASOIL", "G. AUTOPISTA", "G. DIETAS", "G. VARIOS", "INCIDENCIAS", "VALIDADO", "TOTAL HORAS"
            }
        ));
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 140, 1060, 280));
        getContentPane().add(jDateChooser1FechaFin, new org.netbeans.lib.awtextra.AbsoluteConstraints(810, 90, 150, 30));
        getContentPane().add(jDateChooser1FechaInicio1, new org.netbeans.lib.awtextra.AbsoluteConstraints(640, 90, 140, 30));

        jButton3.setText("Detalle Viajes");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(900, 430, 160, 40));

        jLabel4.setText("HORAS EXCESO");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(430, 440, -1, -1));

        jTextField3HorasParte1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField3HorasParte1ActionPerformed(evt);
            }
        });
        getContentPane().add(jTextField3HorasParte1, new org.netbeans.lib.awtextra.AbsoluteConstraints(430, 460, 120, -1));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1VerPartesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1VerPartesActionPerformed
        modeloDeTabla = (DefaultTableModel) jTable1.getModel();

        try {
            Class.forName("java.sql.DriverManager");
            Connection conexion = DriverManager.getConnection("jdbc:oracle:thin:@10.10.10.9:1521:db12102", "system", "oracle");

            Statement sentencia = conexion.createStatement();

            CallableStatement sql = null;
            jDateChooser1FechaInicio1.setDate(null);
            jDateChooser1FechaFin.setDate(null);
            for (int i = 0; i < modeloDeTabla.getRowCount(); i++) {
                modeloDeTabla.removeRow(i);
                i -= 1;
            }
            if (jRadioButton1Todos.isSelected()) {
                sql = conexion.prepareCall("{call LISTARPARTES(?)}");
            } else if (jRadioButton2Abiertos.isSelected()) {
                sql = conexion.prepareCall("{call LISTAPARTESABIERTOS(?)}");
            } else if (jRadioButton3Cerrados.isSelected()) {
                sql = conexion.prepareCall("{call LISTAPARTESCERRADOS(?)}");
            }

            sql.registerOutParameter(1, OracleTypes.CURSOR);
            sql.execute();

            ResultSet resul = (ResultSet) sql.getObject(1);
            Document otroDocumento = jTextPane1ListPartes.getStyledDocument();

            otroDocumento.remove(0, otroDocumento.getLength());
            while (resul.next()) {

                try {
                    pr = new Parte();
                    pr.setUsuario(resul.getString(12));
                    pr.setFecha(resul.getDate(4));
                    pr.setEstado(resul.getString(5));
                    pr.setKmPrincipio(Double.parseDouble(resul.getString(2)));
                    pr.setKmFinal(Double.parseDouble(resul.getString(3)));
                    pr.setGastoGasoil(Double.parseDouble(resul.getString(6)));
                    pr.setGastoAutopista(Double.parseDouble(resul.getString(7)));
                    pr.setGastoDietas(Double.parseDouble(resul.getString(8)));
                    pr.setGastosVarios(Double.parseDouble(resul.getString(9)));
                    pr.setIncidencias(resul.getString(10));
                    pr.setValidar(resul.getString(11));
                    pr.settotalHoras(Double.parseDouble(resul.getString(13)));
                    pr.setNumParte(Integer.parseInt(resul.getString(1)));

                    modeloDeTabla.insertRow(modeloDeTabla.getRowCount(),
                            new Object[]{pr.getNumParte(), pr.getUsuario(), pr.getFecha(), pr.getEstado(),
                                pr.getKmPrincipio(), pr.getKmFinal(), pr.getGastoGasoil(), pr.getGastoAutopista(),
                                pr.getGastoDietas(), pr.getGastosVarios(), pr.getIncidencias(), pr.getValidar(), pr.gettotalHoras()});

                    otroDocumento.insertString(otroDocumento.getLength(),
                            "NUM. PARTE: " + pr.getNumParte() + "   /   USUARIO: " + pr.getUsuario()
                            + "   /   FECHA: " + pr.getFecha() + "   /   ESTADO: " + pr.getEstado()
                            + "   /   KM PRINCIPIO: " + pr.getKmPrincipio() + "   /   KM FINAL: " + pr.getKmFinal()
                            + "   /   GASTO GASOIL: " + pr.getGastoGasoil() + "   /   GASTO AUTOPISTA: " + pr.getGastoAutopista()
                            + "   /   DIETAS: " + pr.getGastoDietas() + "   /   GASTOS VARIOS: " + pr.getGastosVarios()
                            + "   /   INCIDENCIAS: " + pr.getIncidencias() + "   /   VALIDADO: " + pr.getValidar()
                            + "   /   TOTAL_HORAS: " + pr.gettotalHoras() + "\n" + "\n", null);
                    if (modeloDeTabla.getRowCount() == 0) {
                        JOptionPane.showMessageDialog(this, "Parte inexistente con los datos indicados");
                    }

                } catch (BadLocationException ble) {
                    ble.printStackTrace();
                }
            }
            if (modeloDeTabla.getRowCount() == 0) {
                JOptionPane.showMessageDialog(this, "Parte inexistente con los datos indicados");
            }
            resul.close();
            sentencia.close();
            conexion.close();

        } catch (ClassNotFoundException cn) {
            cn.printStackTrace();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (BadLocationException ex) {
            Logger.getLogger(VentanaGestionPartes.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


    /*  
    }//GEN-LAST:event_jButton1VerPartesActionPerformed
*/
    //OPCIÓN SALIR
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        System.exit(0);
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2EliminarParteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2EliminarParteActionPerformed

    }//GEN-LAST:event_jButton2EliminarParteActionPerformed
//OPCION VOLVER A VENTANA ADMINISTRADOR
    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        VentanaAdministrador va = new VentanaAdministrador();
        va.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton2ActionPerformed

//OPCION ACCIONAR FILTRAR PARTES POR FECHA Y USUARIO DESPUES DE HABER INTRODUCIDO DATOS EN SUS CORRESPONDIENTES CASILLAS

    private void jButton5FiltrarPorFechasUsuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5FiltrarPorFechasUsuarioActionPerformed
        modeloDeTabla = (DefaultTableModel) jTable1.getModel();

        try {
            Class.forName("java.sql.DriverManager");
            Connection conexion = DriverManager.getConnection("jdbc:oracle:thin:@10.10.10.9:1521:db12102", "system", "oracle");

            Statement sentencia = conexion.createStatement();

            String usu = jTextField1ParaFiltrarPorUsuario.getText();
            /*
            jDateChooser1FechaInicio1.setDate(null);
            jDateChooser1FechaFin.setDate(null);
             */

            java.util.Date fecha1 = jDateChooser1FechaInicio1.getDate();
            java.sql.Date fech1 = new java.sql.Date(fecha1.getTime());

            java.util.Date fecha2 = jDateChooser1FechaFin.getDate();
            java.sql.Date fech2 = new java.sql.Date(fecha2.getTime());

            CallableStatement sql = null;
            for (int i = 0; i < modeloDeTabla.getRowCount(); i++) {
                modeloDeTabla.removeRow(i);
                i -= 1;
            }
            if (jRadioButton1Todos.isSelected()) {
                sql = conexion.prepareCall("{call LISPARTESPORTRABAJADORYRANGO(?, ?, ?, ?)}");
            } else if (jRadioButton2Abiertos.isSelected()) {
                sql = conexion.prepareCall("{call LISPARTESTRABAJADORYRANGOABI(?, ?, ?, ?)}");
            } else if (jRadioButton3Cerrados.isSelected()) {
                sql = conexion.prepareCall("{call LISPARTESTRABAJADORYRANGOCER(?, ?, ?, ?)}");
            }

            sql.registerOutParameter(4, OracleTypes.CURSOR);
            sql.setString(1, usu);
            sql.setDate(2, fech1);
            sql.setDate(3, fech2);
            sql.execute();

            ResultSet resul = (ResultSet) sql.getObject(4);
            Document otroDocumento = jTextPane1ListPartes.getStyledDocument();

            otroDocumento.remove(0, otroDocumento.getLength());
            while (resul.next()) {

                try {
                    pr = new Parte();
                    pr.setUsuario(resul.getString(2));
                    pr.setFecha(resul.getDate(3));
                    pr.setEstado(resul.getString(4));
                    pr.setKmPrincipio(Double.parseDouble(resul.getString(5)));
                    pr.setKmFinal(Double.parseDouble(resul.getString(6)));
                    pr.setGastoGasoil(Double.parseDouble(resul.getString(7)));
                    pr.setGastoAutopista(Double.parseDouble(resul.getString(8)));
                    pr.setGastoDietas(Double.parseDouble(resul.getString(9)));
                    pr.setGastosVarios(Double.parseDouble(resul.getString(10)));
                    pr.setIncidencias(resul.getString(11));
                    pr.setValidar(resul.getString(12));
                    pr.settotalHoras(Double.parseDouble(resul.getString(13)));
                    pr.setNumParte(Integer.parseInt(resul.getString(1)));
//LISTADO EN JTABLE
                    modeloDeTabla.insertRow(modeloDeTabla.getRowCount(),
                            new Object[]{pr.getNumParte(), pr.getUsuario(), pr.getFecha(), pr.getEstado(),
                                pr.getKmPrincipio(), pr.getKmFinal(), pr.getGastoGasoil(), pr.getGastoAutopista(),
                                pr.getGastoDietas(), pr.getGastosVarios(), pr.getIncidencias(), pr.getValidar(), pr.gettotalHoras()});
//LISTADO EN JTEXPANE (OPCIONAL, DE MOMENTO DEBAJO DEL CONTAINER)
                    otroDocumento.insertString(otroDocumento.getLength(),
                            "NUM. PARTE: " + pr.getNumParte() + "   /   USUARIO: " + pr.getUsuario()
                            + "   /   FECHA: " + pr.getFecha() + "   /   ESTADO: " + pr.getEstado()
                            + "   /   KM PRINCIPIO: " + pr.getKmPrincipio() + "   /   KM FINAL: " + pr.getKmFinal()
                            + "   /   GASTO GASOIL: " + pr.getGastoGasoil() + "   /   GASTO AUTOPISTA: " + pr.getGastoAutopista()
                            + "   /   DIETAS: " + pr.getGastoDietas() + "   /   GASTOS VARIOS: " + pr.getGastosVarios()
                            + "   /   INCIDENCIAS: " + pr.getIncidencias() + "   /   VALIDADO: " + pr.getValidar()
                            + "   /   TOTAL_HORAS: " + pr.gettotalHoras() + "\n" + "\n", null);

                } catch (BadLocationException ble) {
                    ble.printStackTrace();
                }
            }
            if (modeloDeTabla.getRowCount() == 0) {
                JOptionPane.showMessageDialog(this, "Parte inexistente con los datos indicados");
            }

            resul.close();
            sentencia.close();
            conexion.close();

        } catch (ClassNotFoundException cn) {
            cn.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (BadLocationException ex) {
            Logger.getLogger(VentanaGestionPartes.class.getName()).log(Level.SEVERE, null, ex);
        }

    }//GEN-LAST:event_jButton5FiltrarPorFechasUsuarioActionPerformed

    //OPCION ACCIONAR FILTRAR PARTES POR FECHA  DESPUES DE HABER INTRODUCIDO DATOS EN SUS CORRESPONDIENTES CASILLAS

    private void jButton4FiltrarPorFechas1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4FiltrarPorFechas1ActionPerformed
        modeloDeTabla = (DefaultTableModel) jTable1.getModel();

        try {
            Class.forName("java.sql.DriverManager");
            Connection conexion = DriverManager.getConnection("jdbc:oracle:thin:@10.10.10.9:1521:db12102", "system", "oracle");

            Statement sentencia = conexion.createStatement();

            java.util.Date fecha1 = jDateChooser1FechaInicio1.getDate();
            java.sql.Date fech1 = new java.sql.Date(fecha1.getTime());

            java.util.Date fecha2 = jDateChooser1FechaFin.getDate();
            java.sql.Date fech2 = new java.sql.Date(fecha2.getTime());

            CallableStatement sql = null;
            for (int i = 0; i < modeloDeTabla.getRowCount(); i++) {
                modeloDeTabla.removeRow(i);
                i -= 1;
            }
            if (jRadioButton1Todos.isSelected()) {
                sql = conexion.prepareCall("{call LISPARTESPORRANGO(?, ?, ?)}");
            } else if (jRadioButton2Abiertos.isSelected()) {
                sql = conexion.prepareCall("{call LISPARTESPORRANGOABIERTOS(?, ?, ?)}");
            } else if (jRadioButton3Cerrados.isSelected()) {
                sql = conexion.prepareCall("{call LISPARTESPORRANGOCERRADOS(?, ?, ?)}");
            }

            sql.registerOutParameter(3, OracleTypes.CURSOR);
            sql.setDate(1, fech1);
            sql.setDate(2, fech2);
            sql.execute();

            ResultSet resul = (ResultSet) sql.getObject(3);
            Document otroDocumento = jTextPane1ListPartes.getStyledDocument();

            otroDocumento.remove(0, otroDocumento.getLength());
            while (resul.next()) {

                try {
                    pr = new Parte();
                    pr.setUsuario(resul.getString(2));
                    pr.setFecha(resul.getDate(3));
                    pr.setEstado(resul.getString(4));
                    pr.setKmPrincipio(Double.parseDouble(resul.getString(5)));
                    pr.setKmFinal(Double.parseDouble(resul.getString(6)));
                    pr.setGastoGasoil(Double.parseDouble(resul.getString(7)));
                    pr.setGastoAutopista(Double.parseDouble(resul.getString(8)));
                    pr.setGastoDietas(Double.parseDouble(resul.getString(9)));
                    pr.setGastosVarios(Double.parseDouble(resul.getString(10)));
                    pr.setIncidencias(resul.getString(11));
                    pr.setValidar(resul.getString(12));
                    pr.settotalHoras(Double.parseDouble(resul.getString(13)));
                    pr.setNumParte(Integer.parseInt(resul.getString(1)));

                    modeloDeTabla.insertRow(modeloDeTabla.getRowCount(),
                            new Object[]{pr.getNumParte(), pr.getUsuario(), pr.getFecha(), pr.getEstado(),
                                pr.getKmPrincipio(), pr.getKmFinal(), pr.getGastoGasoil(), pr.getGastoAutopista(),
                                pr.getGastoDietas(), pr.getGastosVarios(), pr.getIncidencias(), pr.getValidar(), pr.gettotalHoras()});

                    otroDocumento.insertString(otroDocumento.getLength(),
                            "NUM. PARTE: " + pr.getNumParte() + "   /   USUARIO: " + pr.getUsuario()
                            + "   /   FECHA: " + pr.getFecha() + "   /   ESTADO: " + pr.getEstado()
                            + "   /   KM PRINCIPIO: " + pr.getKmPrincipio() + "   /   KM FINAL: " + pr.getKmFinal()
                            + "   /   GASTO GASOIL: " + pr.getGastoGasoil() + "   /   GASTO AUTOPISTA: " + pr.getGastoAutopista()
                            + "   /   DIETAS: " + pr.getGastoDietas() + "   /   GASTOS VARIOS: " + pr.getGastosVarios()
                            + "   /   INCIDENCIAS: " + pr.getIncidencias() + "   /   VALIDADO: " + pr.getValidar()
                            + "   /   TOTAL_HORAS: " + pr.gettotalHoras() + "\n" + "\n", null);

                } catch (BadLocationException ble) {
                    ble.printStackTrace();
                }
            }
            if (modeloDeTabla.getRowCount() == 0) {
                JOptionPane.showMessageDialog(this, "Parte inexistente con los datos indicados");
            }

            resul.close();
            sentencia.close();
            conexion.close();

        } catch (ClassNotFoundException cn) {
            cn.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (BadLocationException ex) {
            Logger.getLogger(VentanaGestionPartes.class.getName()).log(Level.SEVERE, null, ex);
        }


    }//GEN-LAST:event_jButton4FiltrarPorFechas1ActionPerformed

    private void jCheckBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCheckBox1ActionPerformed
        modeloDeTabla = (DefaultTableModel) jTable1.getModel();
        int selectedRowIndex = jTable1.getSelectedRow();

        /*    jCheckBox1.
          TODO: SI HOPRAS TOTALES > 8
         */ JOptionPane.showMessageDialog(this, "");

    }//GEN-LAST:event_jCheckBox1ActionPerformed

    private void jRadioButton3CerradosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton3CerradosActionPerformed

    }//GEN-LAST:event_jRadioButton3CerradosActionPerformed

    //SELECCION DE VARIOS CAMPOS DE LA TABLA Y MOSTRARLOS ESPECIFICAMENTE EN TRES CASILLAS
    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        modeloDeTabla = (DefaultTableModel) jTable1.getModel();
        int selectedRowIndex = jTable1.getSelectedRow();

        jTextField1UsuarioParte.setText(modeloDeTabla.getValueAt(selectedRowIndex, 1).toString());
        jTextField2NumParte.setText(modeloDeTabla.getValueAt(selectedRowIndex, 0).toString());
        jTextField3HorasParte.setText(modeloDeTabla.getValueAt(selectedRowIndex, 12).toString());//aqui tiene que salir las horas totales

        //TODO: MOSTRAR TOTAL_HORAS DE HORAS PARTE

    }//GEN-LAST:event_jTable1MouseClicked

    private void jTextField1UsuarioParteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1UsuarioParteActionPerformed

    }//GEN-LAST:event_jTextField1UsuarioParteActionPerformed
//VISUALIZAR VENTANA VIAJES, DESAPARECIENDO LA DE PARTES
    
    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        VentanaViajes va = new VentanaViajes();
        va.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jTextField3HorasParteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField3HorasParteActionPerformed

    }//GEN-LAST:event_jTextField3HorasParteActionPerformed

    private void jTextField3HorasParte1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField3HorasParte1ActionPerformed

    }//GEN-LAST:event_jTextField3HorasParte1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;

                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(VentanaGestionPartes.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(VentanaGestionPartes.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(VentanaGestionPartes.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(VentanaGestionPartes.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new VentanaGestionPartes().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup bgEstadoParte;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton1VerPartes;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton2EliminarParte;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4FiltrarPorFechas1;
    private javax.swing.JButton jButton5FiltrarPorFechasUsuario;
    private javax.swing.JCheckBox jCheckBox1;
    private com.toedter.calendar.JDateChooser jDateChooser1FechaFin;
    private com.toedter.calendar.JDateChooser jDateChooser1FechaInicio1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPopupMenu jPopupMenu1;
    private javax.swing.JRadioButton jRadioButton1Todos;
    private javax.swing.JRadioButton jRadioButton2Abiertos;
    private javax.swing.JRadioButton jRadioButton3Cerrados;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1ParaFiltrarPorUsuario;
    private javax.swing.JTextField jTextField1UsuarioParte;
    private javax.swing.JTextField jTextField2NumParte;
    private javax.swing.JTextField jTextField3HorasParte;
    private javax.swing.JTextField jTextField3HorasParte1;
    private javax.swing.JTextPane jTextPane1ListPartes;
    // End of variables declaration//GEN-END:variables
}
