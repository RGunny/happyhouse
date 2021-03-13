package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.CoronaInfoDto;
import com.ssafy.happyhouse.dto.HospitalInfoDto;
import com.ssafy.happyhouse.dto.NearShopDto;
import com.ssafy.happyhouse.mapper.CoronaMapper;
import com.ssafy.happyhouse.mapper.NearShopMapper;

@Service
public class NearShopService {
	@Autowired
	private SqlSession sqlSession;
	
	public List<NearShopDto> getNearShop(String dongName, String largeCate){
		return sqlSession.getMapper(NearShopMapper.class).getNearShop(dongName, largeCate);
	}
	public List<NearShopDto> getNearShopDetail(String lat, String lng, String name){
		return sqlSession.getMapper(NearShopMapper.class).getNearShopDetail(lat, lng, name);
	}
}
