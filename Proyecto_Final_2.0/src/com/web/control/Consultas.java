package com.web.control;

import javax.faces.bean.ManagedBean;

@ManagedBean(name = "consultas")
public class Consultas {

	public String tablaJSF() {
		String tabla = "";
		tabla += "<table>" + "<tr>" + "<th>Primera</th><th>Segunda</th>" + "</tr>" + "<tr>"
				+ "<td>Kevin</td><td>Ramirez</td>" + "</tr>" + "</tabla>";
		return tabla;
	}
	
	
	

}
