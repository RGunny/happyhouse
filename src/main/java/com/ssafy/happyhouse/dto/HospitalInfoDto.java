package com.ssafy.happyhouse.dto;

public class HospitalInfoDto {
	
	private String hospital_name;	
	private String sido;
	private String gugun;
	private String dong;
	private String hospital_type;
	private String hospital_tel;
	
	public HospitalInfoDto() {}
	
	public HospitalInfoDto(String hospital_name, String sido, String gugun, String dong, String hospital_type,
			String hospital_tel) {
		this.hospital_name = hospital_name;
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.hospital_type = hospital_type;
		this.hospital_tel = hospital_tel;
	}


	public String getHospital_name() {
		return hospital_name;
	}


	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
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


	public String getHospital_type() {
		return hospital_type;
	}


	public void setHospital_type(String hospital_type) {
		this.hospital_type = hospital_type;
	}


	public String getHospital_tel() {
		return hospital_tel;
	}


	public void setHospital_tel(String hospital_tel) {
		this.hospital_tel = hospital_tel;
	}
	
	
}
