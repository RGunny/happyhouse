package com.ssafy.happyhouse.dto;

public class NearShopDto {
	private String no;
	private String name;
	private String largeCateName;
	private String middleCateName;
	private String sidoName;
	private String gugunName;
	private String dongName;
	private String address;
	private String lat;
	private String lng;
	private String oldpostcode;
	private String postcode;
	private String jibun;
	private String sidoCode;
	private String gugunCode;
	private String dongCode;
	private String jibuaddress;

	public NearShopDto() {}
	
	public NearShopDto(String no, String name, String largeCateName, String middleCateName, String sidoName,
			String gugunName, String dongName, String jibun) {
		this.no = no;
		this.name = name;
		this.largeCateName = largeCateName;
		this.middleCateName = middleCateName;
		this.sidoName = sidoName;
		this.gugunName = gugunName;
		this.dongName = dongName;
		this.jibun = jibun;
	}

	public NearShopDto(String no, String name, String largeCateName, String middleCateName, String sidoName,
			String gugunName, String dongName, String address, String jibuaddress, String oldpostcode, String postcode,
			String lat, String lng, String jibun, String sidoCode, String gugunCode, String dongCode) {
		this.no = no;
		this.name = name;
		this.largeCateName = largeCateName;
		this.middleCateName = middleCateName;
		this.sidoName = sidoName;
		this.gugunName = gugunName;
		this.dongName = dongName;
		this.address = address;
		this.jibuaddress = jibuaddress;
		this.oldpostcode = oldpostcode;
		this.postcode = postcode;
		this.lat = lat;
		this.lng = lng;
		this.jibun = jibun;
		this.sidoCode = sidoCode;
		this.gugunCode = gugunCode;
		this.dongCode = dongCode;
	}

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLargeCateName() {
		return largeCateName;
	}
	public void setLargeCateName(String largeCateName) {
		this.largeCateName = largeCateName;
	}
	public String getMiddleCateName() {
		return middleCateName;
	}
	public void setMiddleCateName(String middleCateName) {
		this.middleCateName = middleCateName;
	}
	public String getSidoCode() {
		return sidoCode;
	}
	public void setSidoCode(String sidoCode) {
		this.sidoCode = sidoCode;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getGugunCode() {
		return gugunCode;
	}
	public void setGugunCode(String gugunCode) {
		this.gugunCode = gugunCode;
	}
	public String getGugunName() {
		return gugunName;
	}
	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}
	public String getDongCode() {
		return dongCode;
	}
	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}
	public String getDongName() {
		return dongName;
	}
	public void setDongName(String dongName) {
		this.dongName = dongName;
	}
	public String getJibun() {
		return jibun;
	}
	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJibuaddress() {
		return jibuaddress;
	}

	public void setJibuaddress(String jibuaddress) {
		this.jibuaddress = jibuaddress;
	}

	public String getOldpostcode() {
		return oldpostcode;
	}

	public void setOldpostcode(String oldpostcode) {
		this.oldpostcode = oldpostcode;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
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
	
}
