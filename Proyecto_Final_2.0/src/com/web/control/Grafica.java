package com.web.control;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import org.primefaces.event.ItemSelectEvent;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.BubbleChartModel;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.DonutChartModel;
import org.primefaces.model.chart.HorizontalBarChartModel;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.MeterGaugeChartModel;
import org.primefaces.model.chart.OhlcChartModel;
import org.primefaces.model.chart.PieChartModel;

@ManagedBean(name = "Grafica1")
public class Grafica implements Serializable {

	private LineChartModel lineModel2;
	private LineChartModel zoomModel;
	private CartesianChartModel combinedModel;
	private CartesianChartModel fillToZero;
	private LineChartModel areaModel;
	private BarChartModel barModel;
	private HorizontalBarChartModel horizontalBarModel;
	private PieChartModel pieModel2;
	private PieChartModel pieModel2016;
	private DonutChartModel donutModel2;
	private MeterGaugeChartModel meterGaugeModel2;
	private BubbleChartModel bubbleModel2;
	private OhlcChartModel ohlcModel;
	private OhlcChartModel ohlcModel2;
	private BarChartModel animatedModel2;
	private LineChartModel multiAxisModel;
	private LineChartModel dateModel;
	private int trimestre1;
	private int trimestre2;
	private int trimestre3;
	private int trimestre4;
	private int trimestre2016_1;
	private int trimestre2016_2;
	private int trimestre2016_3;
	private int trimestre2016_4;

	@PostConstruct
	public void init() {
		// trimestre();
		// trimestre2016();
		createPieModels();
	}

	public void itemSelect(ItemSelectEvent event) {
		FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Item selected",
				"Item Index: " + event.getItemIndex() + ", Series Index:" + event.getSeriesIndex());
		FacesContext.getCurrentInstance().addMessage(null, msg);
	}

	public LineChartModel getLineModel2() {
		return lineModel2;
	}

	public LineChartModel getZoomModel() {
		return zoomModel;
	}

	public CartesianChartModel getCombinedModel() {
		return combinedModel;
	}

	public CartesianChartModel getAreaModel() {
		return areaModel;
	}

	public PieChartModel getPieModel2016() {
		return pieModel2016;
	}

	public void setPieModel2016(PieChartModel pieModel2016) {
		this.pieModel2016 = pieModel2016;
	}

	public PieChartModel getPieModel2() {
		return pieModel2;
	}

	public MeterGaugeChartModel getMeterGaugeModel2() {
		return meterGaugeModel2;
	}

	public DonutChartModel getDonutModel2() {
		return donutModel2;
	}

	public CartesianChartModel getFillToZero() {
		return fillToZero;
	}

	public BubbleChartModel getBubbleModel2() {
		return bubbleModel2;
	}

	public OhlcChartModel getOhlcModel() {
		return ohlcModel;
	}

	public OhlcChartModel getOhlcModel2() {
		return ohlcModel2;
	}

	public BarChartModel getBarModel() {
		return barModel;
	}

	public HorizontalBarChartModel getHorizontalBarModel() {
		return horizontalBarModel;
	}

	public BarChartModel getAnimatedModel2() {
		return animatedModel2;
	}

	public LineChartModel getMultiAxisModel() {
		return multiAxisModel;
	}

	public LineChartModel getDateModel() {
		return dateModel;
	}

	public int getTrimestre2016_1() {
		return trimestre2016_1;
	}

	public void setTrimestre2016_1(int trimestre2016_1) {
		this.trimestre2016_1 = trimestre2016_1;
	}

	public int getTrimestre2016_2() {
		return trimestre2016_2;
	}

	public void setTrimestre2016_2(int trimestre2016_2) {
		this.trimestre2016_2 = trimestre2016_2;
	}

	public int getTrimestre2016_3() {
		return trimestre2016_3;
	}

	public void setTrimestre2016_3(int trimestre2016_3) {
		this.trimestre2016_3 = trimestre2016_3;
	}

	public int getTrimestre2016_4() {
		return trimestre2016_4;
	}

	public void setTrimestre2016_4(int trimestre2016_4) {
		this.trimestre2016_4 = trimestre2016_4;
	}

	public int getTrimestre1() {
		return trimestre1;
	}

	public void setTrimestre1(int trimestre1) {
		this.trimestre1 = trimestre1;
	}

	public int getTrimestre2() {
		return trimestre2;
	}

	public void setTrimestre2(int trimestre2) {
		this.trimestre2 = trimestre2;
	}

	public int getTrimestre3() {
		return trimestre3;
	}

	public void setTrimestre3(int trimestre3) {
		this.trimestre3 = trimestre3;
	}

	public int getTrimestre4() {
		return trimestre4;
	}

	public void setTrimestre4(int trimestre4) {
		this.trimestre4 = trimestre4;
	}

	private void createPieModels() {
		createPieModel2();
		createPieModel2016();
	}

	private void createPieModel2() {
		pieModel2 = new PieChartModel();
		pieModel2.set("Trimestre 1", 105);
		pieModel2.set("Trimestre 2", 400);
		// pieModel2.set("Trimestre 3", getTrimestre3());
		// pieModel2.set("Trimestre 4", getTrimestre4());
		pieModel2.setTitle("trimestre año 2015");
		pieModel2.setLegendPosition("e");
		pieModel2.setFill(false);
		pieModel2.setShowDataLabels(true);
		pieModel2.setDiameter(150);
		pieModel2.setShadow(false);
	}

	private void createPieModel2016() {
		pieModel2016 = new PieChartModel();
		pieModel2016.set("Trimestre 1", 500);
		// pieModel2016.set("Trimestre 2",getTrimestre2016_2() );
		// pieModel2016.set("Trimestre 3", getTrimestre2016_3() );
		// pieModel2016.set("Trimestre 4",getTrimestre2016_4() );
		pieModel2016.setTitle("trimestre año 2016");
		pieModel2016.setLegendPosition("e");
		pieModel2016.setFill(false);
		pieModel2016.setShowDataLabels(true);
		pieModel2016.setDiameter(150);
		pieModel2016.setShadow(false);
	}

}
