package com.web.control;

import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.servlet.http.HttpSession;

@ManagedBean(name = "bitacora")
public class Bitacora {

	public void accion() {
		this.CerrarCecion();
	}

	public String CerrarCecion() {
		HttpSession se = ControladorSession.getSession();
		String nombre = (String) se.getAttribute("Usuario");
		System.out.println(nombre);

		String nombreU = (String) se.getAttribute("NombreU");
		System.out.println(nombreU);
		Date cre = new Date(se.getCreationTime());
		// String Feingreso = (cre + "<br>");
		System.out.println(cre);
		// *****************************
		Date acc = new Date(se.getLastAccessedTime());
		// String Fesalida = (acc + "<br>");
		System.out.println(acc);
		// *****************************
		long duracion = se.getLastAccessedTime() - se.getCreationTime();
		Date dur = new Date(duracion);
		String Tduracion = ("" + dur.getMinutes() + ":" + dur.getSeconds() + "");
		System.out.print(Tduracion);
		se.invalidate();
		return "logeo.xhtml";

	}
}
