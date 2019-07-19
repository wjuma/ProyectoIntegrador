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

	public int valida() {
		int estado = 3;
		Conexion.conectar();
		String sql = "select * from prueba_usuarios";
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
					// int perfil=resultSet.getObject(5);
					if ((int) resultSet.getObject(5) == 1) {
						sesion.setAttribute("perfil", "Administrador");
						estado = 1;
						System.out.println(estado);
						// break;
					} else {
						sesion.setAttribute("perfil", "Invitado");
						estado = 2;
						System.out.println(estado);
						// break;
					}
					// System.out.println(getCorreo());
				} else {
					System.out.println("No esta");
					estado = 3;
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
		if (valida() == 1) {
			jj = "verBitacora.xhtml";
		} else if (valida() == 2) {
			jj = "MenuBusqueda.xhtml";

		} else {
			jj = "ErrorLogin.xhtml";
		}
		return jj;
	}
}
