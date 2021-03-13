package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseInfoDto;
import com.ssafy.happyhouse.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.mapper.HouseInfoMapper;
import com.ssafy.happyhouse.mapper.HouseMapMapper;

@Service
public class HouseMapService {
	@Autowired
	private SqlSession sqlSession;
	
	public List<SidoGugunCodeDto> getSido(){
		return sqlSession.getMapper(HouseMapMapper.class).getSido();
	}
	public List<SidoGugunCodeDto> getGugunInSido(String sido){
		return sqlSession.getMapper(HouseMapMapper.class).getGugunInSido(sido);
		
	}
	public List<HouseInfoDto> getDongInGugun(String gugun){
		return sqlSession.getMapper(HouseMapMapper.class).getDongInGugun(gugun);
		
	}
	public List<HouseInfoDto> getAptInDong(String dong){
		return sqlSession.getMapper(HouseMapMapper.class).getAptInDong(dong);
	}
	public List<HouseInfoDto> getAptDealInfo(String aptName){
		return sqlSession.getMapper(HouseMapMapper.class).getAptDealInfo(aptName);
	}
	public SidoGugunCodeDto getSidiGugun(String dong) {
		return sqlSession.getMapper(HouseMapMapper.class).getSidoGugun(dong);
	}
	public HouseInfoDto getHouseDetail(int houseId) {
		return sqlSession.getMapper(HouseInfoMapper.class).selectHouse(houseId);
	}
	public boolean pickHouse(String userId, int houseId) throws Exception {
		try {
			if(sqlSession.getMapper(HouseInfoMapper.class).pickHouse(userId,houseId) == 1) {
				return true;
			}
			return false;
		}catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
	}
	public List<HouseInfoDto> selectListPick(String userId){
		return sqlSession.getMapper(HouseInfoMapper.class).selectListPick(userId);
	}
	public boolean deletePick(String userId, int houseId) {
		if(sqlSession.getMapper(HouseInfoMapper.class).deletePick(userId, houseId) == 1) {
			return true;
		}
		return false;
	}
	public List<HouseInfoDto> selectBestHouse(){
		return sqlSession.getMapper(HouseInfoMapper.class).selectBestHouse();
	}

}
