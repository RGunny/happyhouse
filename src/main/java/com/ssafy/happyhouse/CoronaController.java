package com.ssafy.happyhouse;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.CoronaInfoDto;
import com.ssafy.happyhouse.dto.HospitalInfoDto;
import com.ssafy.happyhouse.dto.HouseInfoDto;
import com.ssafy.happyhouse.dto.NearShopDto;
import com.ssafy.happyhouse.service.CoronaService;
import com.ssafy.happyhouse.service.NearShopService;

// corona, hospital 관련
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/house2")
public class CoronaController {

	@Autowired
	private CoronaService cservice;
	@Autowired
	private NearShopService nservice;
	
	@GetMapping("/hospital")
    public ResponseEntity<List<HospitalInfoDto>> getHospitalList(@RequestParam String gugunName, String gugun) throws Exception {
		if (gugun.equals("all")) {
			return new ResponseEntity<List<HospitalInfoDto>>(cservice.getHospital(), HttpStatus.OK);
		}else {
			return new ResponseEntity<List<HospitalInfoDto>>(cservice.getHospitalByGugun(gugunName), HttpStatus.OK);
		}
	}
	@GetMapping("/corona")
	public ResponseEntity<List<CoronaInfoDto>> getCoronaList(@RequestParam String gugunName, String gugun) throws Exception {
		if (gugun.equals("all")) {
			return new ResponseEntity<List<CoronaInfoDto>>(cservice.getCorona(), HttpStatus.OK);
		}else {
			return new ResponseEntity<List<CoronaInfoDto>>(cservice.getCoronaByGugun(gugunName), HttpStatus.OK);
		}
	}
	@GetMapping("/hospitalDetail")
	public ResponseEntity<List<HospitalInfoDto>> getHospitalDetail(@RequestParam String hospital_name) throws Exception {
		return new ResponseEntity<List<HospitalInfoDto>>(cservice.getHospitalDetail(hospital_name), HttpStatus.OK);   
	}
	@GetMapping("/coronaDetail")
	public ResponseEntity<List<CoronaInfoDto>> getCoronaDetail(@RequestParam String corona_name) throws Exception {
		return new ResponseEntity<List<CoronaInfoDto>>(cservice.getCoronaDetail(corona_name), HttpStatus.OK);   
	}
	
	@GetMapping("/nearshop")
	public ResponseEntity<List<NearShopDto>> getNearShopList(@RequestParam String dongName, String largeCate) throws Exception {
		System.out.println(new ResponseEntity<List<NearShopDto>>(nservice.getNearShop(dongName, largeCate), HttpStatus.OK));
        return new ResponseEntity<List<NearShopDto>>(nservice.getNearShop(dongName, largeCate), HttpStatus.OK);   
	}
	@GetMapping("/nearshopDetail")
	public ResponseEntity<List<NearShopDto>> getNearShopDetail(@RequestParam String lat, String lng, String name) throws Exception {
		System.out.println(name);
		return new ResponseEntity<List<NearShopDto>>(nservice.getNearShopDetail(lat, lng, name), HttpStatus.OK);   
	}
	
//	@GetMapping("/hospital")
//	public List<HospitalInfoDto> getHosList(HttpServletRequest request, HttpServletResponse response, String gugunName, String gugun)
//			throws Exception {
//		System.out.println(gugunName);
//		response.setCharacterEncoding("UTF-8");
//		PrintWriter out = response.getWriter();
//		List<HospitalInfoDto> list = null;
//		JSONArray arr = new JSONArray();
//		try {
//			if (gugun.equals("all")) {
//				list = cservice.getHospital();
//				for (HospitalInfoDto dto : list) {
//					JSONObject obj = new JSONObject();
//					obj.put("hospital_name", dto.getHospital_name());
//					obj.put("sido", dto.getSido());
//					obj.put("gugun", dto.getGugun());
//					obj.put("dong", dto.getDong());
//					obj.put("hospital_type", dto.getHospital_type());
//					obj.put("hospital_tel", dto.getHospital_tel());
//					arr.add(obj);
//				}
//			} else {
//				list = cservice.getHospitalByGugun(gugunName);
//				for (HospitalInfoDto dto : list) {
//					JSONObject obj = new JSONObject();
//					obj.put("hospital_name", dto.getHospital_name());
//					obj.put("sido", dto.getSido());
//					obj.put("gugun", dto.getGugun());
//					obj.put("dong", dto.getDong());
//					obj.put("hospital_type", dto.getHospital_type());
//					obj.put("hospital_tel", dto.getHospital_tel());
//					arr.add(obj);
//				}
//			}
//		} catch (Exception e) {
//			arr = new JSONArray();
//			JSONObject obj = new JSONObject();
//			obj.put("message_code", "-1");
//			arr.add(obj);
//			e.printStackTrace();
//		} finally {
//			out.print(arr.toJSONString());
//			out.close();
//		}
//		return arr;
//	}
//
//	@GetMapping("/corona")
//	public List<CoronaInfoDto> getCorList(HttpServletRequest request, HttpServletResponse response, String gugunName, String gugun)
//			throws Exception {
//		response.setCharacterEncoding("UTF-8");
//
//		PrintWriter out = response.getWriter();
//		List<CoronaInfoDto> list = null;
//		JSONArray arr = new JSONArray();
//		try {
//			if (gugun.equals("all")) {
//				list = cservice.getCorona();
//				for (CoronaInfoDto dto : list) {
//					JSONObject obj = new JSONObject();
//					obj.put("treatment_available", dto.getTreatment_available());
//					obj.put("corona_name", dto.getCorona_name());
//					obj.put("sido", dto.getSido());
//					obj.put("gugun", dto.getGugun());
//					obj.put("dong", dto.getDong());
//					obj.put("monTofri_time", dto.getMonTofri_time());
//					obj.put("sat_time", dto.getSat_time());
//					obj.put("sun_time", dto.getSun_time());
//					obj.put("corona_tel", dto.getCorona_tel());
//					arr.add(obj);
//				}
//			} else {
//				list = cservice.getCoronaByGugun(gugunName);
//				for (CoronaInfoDto dto : list) {
//					JSONObject obj = new JSONObject();
//					obj.put("treatment_available", dto.getTreatment_available());
//					obj.put("corona_name", dto.getCorona_name());
//					obj.put("sido", dto.getSido());
//					obj.put("gugun", dto.getGugun());
//					obj.put("dong", dto.getDong());
//					obj.put("monTofri_time", dto.getMonTofri_time());
//					obj.put("sat_time", dto.getSat_time());
//					obj.put("sun_time", dto.getSun_time());
//					obj.put("corona_tel", dto.getCorona_tel());
//					arr.add(obj);
//				}
//			}
//		} catch (Exception e) {
//			arr = new JSONArray();
//			JSONObject obj = new JSONObject();
//			obj.put("message_code", "-1");
//			arr.add(obj);
//			e.printStackTrace();
//		} finally {
//			out.print(arr.toJSONString());
//			out.close();
//		}
//		return arr;
//	}

}
