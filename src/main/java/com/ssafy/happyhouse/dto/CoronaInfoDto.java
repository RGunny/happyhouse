package com.ssafy.happyhouse.dto;

public class CoronaInfoDto {
	
	private int treatment_available;
	private String corona_name;
	private String sido;
	private String gugun;
	private String dong;
	private String monTofri_time;
	private String sat_time;
	private String sun_time;
	private String corona_tel;
	
	
	
	public CoronaInfoDto() {}
	
	public CoronaInfoDto(int treatment_available, String corona_name, String sido, String gugun, String dong,
			String monTofri_time, String sat_time, String sun_time, String corona_tel) {
		this.treatment_available = treatment_available;
		this.corona_name = corona_name;
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.monTofri_time = monTofri_time;
		this.sat_time = sat_time;
		this.sun_time = sun_time;
		this.corona_tel = corona_tel;
	}
	
	
	public int getTreatment_available() {
		return treatment_available;
	}

	public void setTreatment_available(int treatment_available) {
		this.treatment_available = treatment_available;
	}

	public String getCorona_name() {
		return corona_name;
	}
	public void setCorona_name(String corona_name) {
		this.corona_name = corona_name;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getMonTofri_time() {
		return monTofri_time;
	}
	public void setMonTofri_time(String monTofri_time) {
		this.monTofri_time = monTofri_time;
	}
	public String getSat_time() {
		return sat_time;
	}
	public void setSat_time(String sat_time) {
		this.sat_time = sat_time;
	}
	public String getSun_time() {
		return sun_time;
	}
	public void setSun_time(String sun_time) {
		this.sun_time = sun_time;
	}
	public String getCorona_tel() {
		return corona_tel;
	}
	public void setCorona_tel(String corona_tel) {
		this.corona_tel = corona_tel;
	}
	
	
	
	
}
