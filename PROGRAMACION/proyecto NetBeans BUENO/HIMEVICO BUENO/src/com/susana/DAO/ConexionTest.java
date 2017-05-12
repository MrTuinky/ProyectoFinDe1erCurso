package com.susana.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

//* Conecta java con la base de datos
public class ConexionTest {

    private static Connection conexion;

    public static void conectar() throws ClassNotFoundException {
        try {
            Class.forName("java.sql.DriverManager");
            conexion = DriverManager.getConnection("jdbc:oracle:thin:@10.10.10.9:1521:db12102", "system", "oracle");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection getConexion() {
        return conexion;
    }

    public static void desconectar() throws SQLException {
        conexion.close();
    }

}
