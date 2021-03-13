package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseInfoDto;
import com.ssafy.happyhouse.dto.SidoGugunCodeDto;

public interface HouseMapMapper {
	List<SidoGugunCodeDto> getSido();
	List<SidoGugunCodeDto> getGugunInSido(String sido);
	List<HouseInfoDto> getDongInGugun(String gugun);
	List<HouseInfoDto> getAptInDong(String dong);
	List<HouseInfoDto> getAptDealInfo(String aptName);
	SidoGugunCodeDto getSidoGugun(String dong);

}
