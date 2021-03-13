package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.CoronaInfoDto;
import com.ssafy.happyhouse.dto.HospitalInfoDto;
import com.ssafy.happyhouse.dto.NearShopDto;

public interface NearShopMapper {
	
	List<NearShopDto> getNearShop(String dongName, String largeCate);
	List<NearShopDto> getNearShopDetail(String lat, String lng, String name);
	
}
