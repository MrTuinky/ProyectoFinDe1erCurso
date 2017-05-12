/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.susana.GUI;

import com.susana.Entidades.Trabajador;
import static java.lang.reflect.Array.set;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
public class Login extends javax.swing.JFrame {

    private Trabajador trabajador;

    /**
     * Creates new form Login
     */
    
    //FOCO USUARIO
    //POSICIONAMIENTO DE LA PANTALLA
    public Login() {
        initComponents();
        jTextField2usuario.requestFocus();
        this.setLocationRelativeTo(null);

    }
//VACIAR CASILLAS DE TEXTO
    void limpiar() {
        jTextField2usuario.setText("");
        jPasswordField1.setText("");

    }

    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        bindingGroup = new org.jdesktop.beansbinding.BindingGroup();

        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jTextField2usuario = new javax.swing.JTextField();
        jButton1Salir = new javax.swing.JButton();
        jPasswordField1 = new javax.swing.JPasswordField();
        jButton2Sesion = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jLabel1fond = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setIconImage(getIconImage());
        setIconImages(getIconImages());
        setUndecorated(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel2.setBackground(new java.awt.Color(204, 204, 204));
        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Contraseña");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 210, 110, 40));

        jLabel4.setBackground(new java.awt.Color(204, 204, 204));
        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Usuario");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 100, 110, 40));

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 36)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(0, 204, 204));
        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel3.setText("H  I  M  E  V  I  C  O");

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, jLabel3, org.jdesktop.beansbinding.ELProperty.create("${text}"), jLabel3, org.jdesktop.beansbinding.BeanProperty.create("toolTipText"));
        bindingGroup.addBinding(binding);

        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 10, 550, 50));

        jTextField2usuario.setBackground(new java.awt.Color(0, 204, 255));
        jTextField2usuario.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jTextField2usuario.setCaretColor(new java.awt.Color(0, 153, 153));
        jTextField2usuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField2usuarioActionPerformed(evt);
            }
        });
        getContentPane().add(jTextField2usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 140, 230, 40));

        jButton1Salir.setBackground(new java.awt.Color(0, 0, 153));
        jButton1Salir.setFont(new java.awt.Font("Tahoma", 1, 10)); // NOI18N
        jButton1Salir.setForeground(new java.awt.Color(255, 255, 255));
        jButton1Salir.setText("Salir");
        jButton1Salir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1SalirActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1Salir, new org.netbeans.lib.awtextra.AbsoluteConstraints(400, 330, -1, -1));

        jPasswordField1.setBackground(new java.awt.Color(0, 204, 204));
        jPasswordField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jPasswordField1ActionPerformed(evt);
            }
        });
        getContentPane().add(jPasswordField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 250, 230, 40));

        jButton2Sesion.setBackground(new java.awt.Color(0, 0, 153));
        jButton2Sesion.setFont(new java.awt.Font("Tahoma", 1, 10)); // NOI18N
        jButton2Sesion.setForeground(new java.awt.Color(255, 255, 255));
        jButton2Sesion.setText("Inicio sesión");
        jButton2Sesion.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton2SesionMouseClicked(evt);
            }
        });
        jButton2Sesion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2SesionActionPerformed(evt);
            }
        });
        getContentPane().add(jButton2Sesion, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 330, 100, -1));

        jButton1.setText("Cambio contraseña");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(430, 80, -1, -1));

        jLabel1fond.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/imagenes/46374.jpg"))); // NOI18N
        getContentPane().add(jLabel1fond, new org.netbeans.lib.awtextra.AbsoluteConstraints(3, 0, 600, 371));

        jLabel1.setText("jLabel1");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 0, 440, 50));

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1SalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1SalirActionPerformed
System.exit(0);System.exit(0);    }//GEN-LAST:event_jButton1SalirActionPerformed

    private void jTextField2usuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField2usuarioActionPerformed
    }//GEN-LAST:event_jTextField2usuarioActionPerformed

    /*

   DEPENDIENDO DE LA CATEGORÍA DEL USUARIO Y SI USUARIO Y CONTRASEÑA
    SON CORRECTOS SE ACCEDERÁ A LAS VENTANAS A QUE CADA CATEGORÍA TENGA ACCESO

     */
    private void jButton2SesionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2SesionActionPerformed
        String usuario = jTextField2usuario.getText(); //este usuario y contraseña tendrán que coincidir con los de cada uno de la base de datos
        char[] contr = jPasswordField1.getPassword();
        try {
            Class.forName("java.sql.DriverManager");
            Connection conexion = DriverManager.getConnection("jdbc:oracle:thin:@10.10.10.9:1521:db12102", "system", "oracle");

            jTextField2usuario.getText();
            String sql = "SELECT CATEGORIA FROM TRABAJADOR WHERE USUARIO = ? and CONTRASENA = ?";
            PreparedStatement sentencia = conexion.prepareStatement(sql);
            sentencia.setString(1, usuario);
            sentencia.setString(2, new String(contr));

            ResultSet resul = sentencia.executeQuery();
            if (resul == null) {
                JOptionPane.showMessageDialog(this, "Usuario o contraseña erroneos");
            } else {
                resul.next();

                if ("TRANSPORTISTA".equalsIgnoreCase(resul.getString(1))) {
                    VentanaCrearParteLogistica vtr = new VentanaCrearParteLogistica();
                    vtr.prepararParteAbierto(usuario);
                    vtr.setVisible(true);
                    dispose();
                    JOptionPane.showMessageDialog(this, "Bienvenido, accede a opciones de categoría TRANSPORTISTA");


                } else if ("ADMINISTRATIVO".equalsIgnoreCase(resul.getString(1))) {
                    VentanaAdministrador vadmin = new VentanaAdministrador();
                    vadmin.setVisible(true);
                    dispose();
                    JOptionPane.showMessageDialog(this, "Bienvenido, accede a opciones de categoría ADMINISTRATIVO");

                } else {
                    JOptionPane.showMessageDialog(this, "Usuario sin indicación de categoría profesional");

                }

                resul.close();
            }
            sentencia.close();
            conexion.close();
        } catch (ClassNotFoundException cn) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, cn);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

      

    }//GEN-LAST:event_jButton2SesionActionPerformed

    private void jButton2SesionMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton2SesionMouseClicked
       
    }//GEN-LAST:event_jButton2SesionMouseClicked

    private void jPasswordField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jPasswordField1ActionPerformed
       
    }//GEN-LAST:event_jPasswordField1ActionPerformed

    
   // * Accede a la ventana cambio de contraseña
    
    
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        VentanaCambioContras vcc = new VentanaCambioContras();
        vcc.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton1ActionPerformed

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
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Login().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton1Salir;
    private javax.swing.JButton jButton2Sesion;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel1fond;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPasswordField jPasswordField1;
    private javax.swing.JTextField jTextField2usuario;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
}
