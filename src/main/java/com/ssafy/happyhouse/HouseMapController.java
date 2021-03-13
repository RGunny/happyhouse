package com.ssafy.happyhouse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.HouseInfoDto;
import com.ssafy.happyhouse.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.service.HouseMapService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/house")
public class HouseMapController {
	@Autowired
	private HouseMapService service;

	@GetMapping("/sido")
	public ResponseEntity<List<SidoGugunCodeDto>> getSido() throws Exception {
//        logger.debug("getSido - 호출");
		return new ResponseEntity<List<SidoGugunCodeDto>>(service.getSido(), HttpStatus.OK);
	}

	@GetMapping("/gugun")
	public ResponseEntity<List<SidoGugunCodeDto>> getGugun(@RequestParam String sidoCode) throws Exception {
//        logger.debug("getGugunInSido - 호출");   
		return new ResponseEntity<List<SidoGugunCodeDto>>(service.getGugunInSido(sidoCode), HttpStatus.OK);
	}

	@GetMapping("/dong")
	public ResponseEntity<List<HouseInfoDto>> getDong(@RequestParam String gugunCode) throws Exception {
//        logger.debug("getDongInGugun - 호출");
		return new ResponseEntity<List<HouseInfoDto>>(service.getDongInGugun(gugunCode), HttpStatus.OK);
	}

	@GetMapping("/apt")
	public ResponseEntity<List<HouseInfoDto>> getHosList(@RequestParam String dongName) throws Exception {
//        logger.debug("getAptDealInfo - 호출");
		return new ResponseEntity<List<HouseInfoDto>>(service.getAptInDong(dongName), HttpStatus.OK);
	}

	@GetMapping("/aptDetail")
	public ResponseEntity<List<HouseInfoDto>> getAptDealInfo(@RequestParam String aptName) throws Exception {
//        logger.debug("getAptDealInfo - 호출");
		return new ResponseEntity<List<HouseInfoDto>>(service.getAptDealInfo(aptName), HttpStatus.OK);
	}
	@GetMapping("/sidogugun")
	public SidoGugunCodeDto getSidoGugun(@RequestParam("dong") String dong) {
		SidoGugunCodeDto result =service.getSidiGugun(dong);
		return result;
	}
	@GetMapping("/houseDetail")
	public HouseInfoDto getHouseDetail(@RequestParam("houseId")int houseId) {
		return service.getHouseDetail(houseId);
	}
	@GetMapping("/pick")
	public String pickHouse(@RequestParam("userId")String userId, @RequestParam("houseId")int houseId) throws Exception {
		if(service.pickHouse(userId, houseId)) {
			return "찜 추가 성공!";
		}else {
			return "찜 추가 실패!";
		}
	}

	@GetMapping("/picklist")
	public List<HouseInfoDto> pickList(@RequestParam("userId")String userId){
		return service.selectListPick(userId);
	}
	@GetMapping("/deletepick")
	public String deletePick(@RequestParam("userId")String userId, @RequestParam("houseId")int houseId) {
		if(service.deletePick(userId, houseId)) {
			return "찜 매물 삭제 성공!";
		}
		return "찜 매물 삭제 실패!";
	}
	@GetMapping("/besthouse")
	public List<HouseInfoDto> bestHouse(){
		return service.selectBestHouse();
	}

}
