package kr.or.ddit.vo;

import java.util.List;

public class SensorVO {
	
	private String sensor_no;
	private String sensor_tmprt;
	private String sensor_hd;
	private String sensor_pblmrl;
	private String sensor_co2;
	private String sensor_ulfptc;
	private String farm_id;
	private List<SensorFileItemVO> items;
	
	
	public List<SensorFileItemVO> getItems() {
		return items;
	}
	public void setItems(List<SensorFileItemVO> items) {
		this.items = items;
	}
	public String getSensor_no() {
		return sensor_no;
	}
	public void setSensor_no(String sensor_no) {
		this.sensor_no = sensor_no;
	}
	public String getSensor_tmprt() {
		return sensor_tmprt;
	}
	public void setSensor_tmprt(String sensor_tmprt) {
		this.sensor_tmprt = sensor_tmprt;
	}
	public String getSensor_hd() {
		return sensor_hd;
	}
	public void setSensor_hd(String sensor_hd) {
		this.sensor_hd = sensor_hd;
	}
	public String getSensor_pblmrl() {
		return sensor_pblmrl;
	}
	public void setSensor_pblmrl(String sensor_pblmrl) {
		this.sensor_pblmrl = sensor_pblmrl;
	}
	public String getSensor_co2() {
		return sensor_co2;
	}
	public void setSensor_co2(String sensor_co2) {
		this.sensor_co2 = sensor_co2;
	}
	public String getSensor_ulfptc() {
		return sensor_ulfptc;
	}
	public void setSensor_ulfptc(String sensor_ulfptc) {
		this.sensor_ulfptc = sensor_ulfptc;
	}
	public String getFarm_id() {
		return farm_id;
	}
	public void setFarm_id(String farm_id) {
		this.farm_id = farm_id;
	}
	
}
