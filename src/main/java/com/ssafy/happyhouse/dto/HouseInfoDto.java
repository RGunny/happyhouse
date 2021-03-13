package com.ssafy.happyhouse.dto;

public class HouseInfoDto {

	// houseDeal
	private String houseId;
	
	private String aptName;
	private String dealAmount;
	private String dong;
	private String jibun;
	private String buildYear;
	private String lat;
	private String lng;
	// null
	private String code;
	private String img;
	private String no;
	
	private String area;
	private String floor;
	private String typeName;
	
	public HouseInfoDto() {}
	
	public HouseInfoDto(String houseId,  String aptName, String dealAmount, String jibun, String dong) {
		this.houseId = houseId;
		this.aptName = aptName;
		this.dealAmount = dealAmount;
		this.jibun = jibun;
		this.dong = dong;
	}
	
	public HouseInfoDto(String aptName, String dealAmount, String dong, String jibun, String code, String buildYear,
			String lat, String lng, String img, String no) {
		this.aptName = aptName;
		this.dealAmount = dealAmount;
		this.dong = dong;
		this.jibun = jibun;
		this.code = code;
		this.buildYear = buildYear;
		this.lat = lat;
		this.lng = lng;
		this.img = img;
		this.no = no;
	}

	public HouseInfoDto(String houseId, String aptName, String dealAmount, String dong, String jibun, String code,
			String buildYear, String lat, String lng, String img, String no) {
		this.houseId = houseId;
		this.aptName = aptName;
		this.dealAmount = dealAmount;
		this.dong = dong;
		this.jibun = jibun;
		this.code = code;
		this.buildYear = buildYear;
		this.lat = lat;
		this.lng = lng;
		this.img = img;
		this.no = no;
	}

	public String getHouseId() {
		return houseId;
	}

	public void setHouseId(String houseId) {
		this.houseId = houseId;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	
}
