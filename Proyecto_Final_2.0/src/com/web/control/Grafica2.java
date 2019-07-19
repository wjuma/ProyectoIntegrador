package com.web.control;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import org.primefaces.model.chart.PieChartModel;

@ManagedBean(name = "graficaa")
public class Grafica2 {

	private PieChartModel graf2;
	private PieChartModel segundo;

	public PieChartModel getGraf2() {
		return graf2;
	}

	public PieChartModel getSegundo() {
		return segundo;
	}

	@PostConstruct
	public void init() {
		cre();
		seg();
	}

	private void cre() {
		graf2 = new PieChartModel();
		graf2.set("uno", 152);
		graf2.set("dos", 252);
		graf2.set("tres", 352);
		graf2.setTitle("trimestre año 2016");
		graf2.setLegendPosition("e");
		graf2.setFill(false);
		graf2.setShowDataLabels(true);
		graf2.setDiameter(150);
		graf2.setShadow(false);
	}

	private void seg() {
		segundo = new PieChartModel();
		segundo.set("uno", 152);
		segundo.set("dos", 252);
		segundo.set("tres", 352);
		segundo.setTitle("trimestre año 2016");
		segundo.setLegendPosition("e");
		segundo.setFill(false);
		segundo.setShowDataLabels(true);
		segundo.setDiameter(150);
		segundo.setShadow(false);
	}

}
