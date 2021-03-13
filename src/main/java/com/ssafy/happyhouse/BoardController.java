package com.ssafy.happyhouse;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.ssafy.happyhouse.dto.BoardDto;
import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.dto.QnADto;
import com.ssafy.happyhouse.service.BoardService;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/notice")
public class BoardController {
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/list")
	public List<BoardDto> boardList() {
		return service.selectAll();
	}
	
	@GetMapping("/search/bnum")
	public List<BoardDto> searchNo(@RequestParam("option") int bnum) {
		return service.selectBnum(bnum);
	}
	@GetMapping("/search/title")
	public List<BoardDto> searchTitle(@RequestParam("option")String btitle){
		return service.selectBtitle(btitle);
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno")int bno) {
		if(service.deleteBoard(bno)) {
			return "글 삭제 성공!";
		}
		return "글 삭제 실패!";
	}
	
	@PostMapping("/insert")
	public String write(@RequestBody BoardDto dto) {
		if(service.insertBoard(dto)) {
			return "글 추가 성공!";
		}
		return "글 추가 실패!";
	}
	@GetMapping("/detail")
	public BoardDto detailNo(@RequestParam("option") int bno) {
		BoardDto dto = service.detailBoard(bno);
		dto.setBreadCnt(dto.getBreadCnt()+1);
		service.updateBoard(dto);
		return dto;
	}
	@PostMapping("/modify")
	public String modify(@RequestBody BoardDto dto) {
		if(service.updateBoard(dto)) {
			return "글 수정 완료!";
		}
		return "글 수정 실패!";
	}
	

}
