package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.CoronaInfoDto;
import com.ssafy.happyhouse.dto.HospitalInfoDto;
import com.ssafy.happyhouse.mapper.CoronaMapper;

//Corona, Hospital 관련
@Service
public class CoronaService {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 안전 병원
	// 전체 검색
	public List<HospitalInfoDto> getHospital() throws Exception {
		return sqlSession.getMapper(CoronaMapper.class).getHospital();
	}
	public List<HospitalInfoDto> getHospitalByGugun(String gugunName) throws Exception {
		return sqlSession.getMapper(CoronaMapper.class).getHospitalByGugun(gugunName);
	}
	public List<HospitalInfoDto> getHospitalDetail(String hospital_name){
		return sqlSession.getMapper(CoronaMapper.class).getHospitalDetail(hospital_name);
	}
	
	// 코로나 진료소
	// 전체 검색
	public List<CoronaInfoDto> getCorona() throws Exception {
		return sqlSession.getMapper(CoronaMapper.class).getCorona();
	}
	public List<CoronaInfoDto> getCoronaByGugun(String gugunName) throws Exception {
		return sqlSession.getMapper(CoronaMapper.class).getCoronaByGugun(gugunName);
	}
	public List<CoronaInfoDto> getCoronaDetail(String corona_name){
		return sqlSession.getMapper(CoronaMapper.class).getCoronaDetail(corona_name);
	}
}
