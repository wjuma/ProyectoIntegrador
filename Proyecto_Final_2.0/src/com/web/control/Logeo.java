package com.web.control;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.faces.bean.ManagedBean;
import javax.servlet.http.HttpSession;

import com.web.conexion.Conexion;
import com.web.modelo.Usuario;

@ManagedBean

public class Logeo extends Usuario {// funciona
	private ResultSet resultSet = null;

	public boolean valida() {
		boolean estado = false;
		Conexion.conectar();
		String sql = "select * from usuarios";
		// String sql = "select * from usuarios";
		Conexion.consultar(sql);
		resultSet = Conexion.getResultSet();
		// System.out.println("Metodo valida dentro");
		try {
			while (resultSet.next()) {
				System.out.println("dentro del try");
				System.out.println(resultSet.getObject(2) + ":" + resultSet.getObject(3));
				if (getCorreo().equals(resultSet.getObject(2)) && getClave().equals(resultSet.getObject(3))) {
					System.out.println("El usuario si esta");
					HttpSession sesion = ControladorSession.getSession();
					sesion.setAttribute("Usuario", getCorreo());
					sesion.setAttribute("NombreU", resultSet.getObject(4));
					System.out.println(getCorreo());
					estado = true;
					break;
				} else {
					System.out.println("No esta");
					estado = false;
				}
				// System.out.println(resultSet.getObject(1) + " " + resultSet.getObject(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Conexion.cerrar();
		return estado;
	}

	public String redi() {
		this.valida();
		System.out.println("metodo valida");
		String jj = "";
		System.out.println(valida());
		if (valida()) {
			jj = "MenuBusqueda.xhtml";
		} else {
			jj = "ErrorLogin.xhtml";
		}
		return jj;
	}
}
