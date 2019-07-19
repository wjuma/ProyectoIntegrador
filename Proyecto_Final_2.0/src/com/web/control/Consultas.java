package com.web.control;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.faces.bean.ManagedBean;

import com.web.conexion.Conexion;

//@ManagedBean(name = "consultas")
public class Consultas {

	public Consultas() {
		super();
	}

	private ResultSet resultSet = null;

	public String tablaJSF() {
		String tabla = "";
		tabla += "<table>" + "<tr>" + "<th>Primera</th><th>Segunda</th>" + "</tr>" + "<tr>"
				+ "<td>Kevin</td><td>Ramirez</td>" + "</tr>" + "</tabla>";
		return tabla;
	}

	public void prueba() {
		Conexion.conectar();
		String sql = "select * from prueba_usuarios";
		// String sql = "select * from usuarios";
		Conexion.consultar(sql);
		resultSet = Conexion.getResultSet();
		// System.out.println("Metodo valida dentro");
		try {
			while (resultSet.next()) {
				System.out.println(resultSet.getObject(2));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Consultas c = new Consultas();
		c.prueba();

	}

}
