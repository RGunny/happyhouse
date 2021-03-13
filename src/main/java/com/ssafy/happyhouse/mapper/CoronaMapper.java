package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.CoronaInfoDto;
import com.ssafy.happyhouse.dto.HospitalInfoDto;

// Corona, Hospital 관련
public interface CoronaMapper {
	
	// 안전 병원
	List<HospitalInfoDto> getHospital() throws Exception;
	List<HospitalInfoDto> getHospitalByGugun(String gugunName) throws Exception;
	List<HospitalInfoDto> getHospitalDetail(String hospital_name);
	
	// 코로나 진료소
	List<CoronaInfoDto> getCorona() throws Exception;
	List<CoronaInfoDto> getCoronaByGugun(String gugunName) throws Exception;
	List<CoronaInfoDto> getCoronaDetail(String corona_name);
}
