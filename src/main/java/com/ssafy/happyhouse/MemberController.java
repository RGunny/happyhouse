package com.ssafy.happyhouse;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.MemberService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/mypage")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/userinfo")
	public MemberDto userInfo(@RequestParam("userId")String userId) {
		MemberDto result = service.searchUser(userId);
		System.out.println(result);
		return result;
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@PostMapping("/modify")
	public String modify(@RequestBody MemberDto dto) {
		if(service.modifyUserInfo(dto)) {
			return "회원 정보 수정 성공!";
		}
		return "회원 정보 수정 실패!";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("userId") String userId) {
		if(service.deleteUser(userId)) {
			return "회원 탈퇴 성공!";
		}
		return "회원 탈퇴 실패!";
	}
	@PostMapping("/join")
	public String join(@RequestBody MemberDto dto) {
		if(service.insertMember(dto)) {
			return "회원가입 성공!";
		}
		return "회원가입 실패!";
	}
	@GetMapping("/findid")
	public List<MemberDto> findId(@RequestParam("userEmail")String userEmail){
		return service.findUserIdUseEmail(userEmail);
	}
	
	@GetMapping("/findpw")
	public String findPw(@RequestParam("userId")String userId) {
		return service.findUserPwUseUserId(userId);
	}
}
