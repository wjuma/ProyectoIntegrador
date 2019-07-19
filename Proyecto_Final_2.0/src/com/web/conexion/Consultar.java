package com.web.conexion;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Consultar {

	public String nombre;
	public int duracion;
	public byte cartelera;
	public Conexion conexion = new Conexion();

	public byte getCartelera() {
		return cartelera;
	}

	public void setCartelera(byte cartelera) {
		this.cartelera = cartelera;
	}

	public String Ingresarpelicula() {

		String sql = "INSERT INTO tb_pelicula id_pel,nombre_pel,duracion_pel,cartelera_pel" + "values("
				+ this.getNombre() + "'," + this.getDuracion() + "," + this.getCartelera() + ")";

		return sql;
	}

	public String consultartodas() {
		Conexion conexion = new Conexion();

		String sql = "SELECT nombre_pel FROM tb_pelicula";
		String tabla = "<table>";
		ResultSet rs = null;
		try {
			// si falla el error esta aqui
			while (rs.next()) {
				tabla += "<tr><td>" + rs.getString(1) + "</td></tr>";
			}
			tabla += "</table>";

		} catch (SQLException e) {
			System.out.println("ERROR DE CONSULTA " + e.getMessage());
		}
		return tabla;
	}

	public String consultarporcategoria(String idCategoria) {
		Conexion conexion = new Conexion();
		ResultSet rs = null;
		String sql = "SELECT nombre_pel FROM tb_peliucla where id_cat=" + idCategoria;
		String tabla = "<table>";
		try {
			//rs = conexion.Consulta(sql);
			while (rs.next()) {
				tabla += "<tr><td>" + rs.getString(1) + "</td></tr>";
			}
			tabla += "</table>";

		} catch (SQLException e) {
			System.out.println("error en la consulta " + e.getMessage());
		}
		return tabla;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getDuracion() {
		return duracion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

}
