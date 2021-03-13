package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseInfoDto;

public interface HouseInfoMapper {
	public HouseInfoDto selectHouse(int houseId);
	public int pickHouse(String userId, int houseId) throws Exception;
	public List<HouseInfoDto> selectListPick(String userId);
	public int deletePick(String userId, int houseId);
	public List<HouseInfoDto> selectBestHouse();

}
