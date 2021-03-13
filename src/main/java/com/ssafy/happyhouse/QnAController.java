package com.ssafy.happyhouse;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.dto.QnADto;
import com.ssafy.happyhouse.service.QnAService;

@CrossOrigin(origins = "*")
@RestController()
@RequestMapping("/qna")
public class QnAController {
	@Autowired
	private QnAService service;
	
	@GetMapping("/list")
	public List<QnADto> list(){
		return service.selectAll();
	}
	
	@GetMapping("/search/bno")
	public List<QnADto> searchNo(@RequestParam("option") int bno) {
		return service.selectQnANo(bno);
	}
	@GetMapping("/search/title")
	public List<QnADto> searchTitle(@RequestParam("option")String btitle){
		return service.selectQnATitle(btitle);
	}
	@GetMapping("/search/writer")
	public List<QnADto> searchWriter(@RequestParam("option")String bwriter){
		return service.selectQnAWriter(bwriter);
	}
	
	@PostMapping("/insert")
	public String add(@RequestBody QnADto dto) {
		if(service.insertQnA(dto)) {
			return "글 작성 완료!";
		}
		return "글 작성 실패!";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno) {
		if(service.deleteQnA(bno)) {
			return "글 삭제 완료!";
		}
		return "글 삭제 실패!";
	}
	@PostMapping("/modify")
	public String modify(@RequestBody QnADto dto) {
		if(service.updateQnA(dto)) {
			return "글 수정 완료!";
		}
		return "글 수정 실패!";
	}

	@GetMapping("/detail")
	public QnADto detailNo(@RequestParam("option") int bno) {
		QnADto qna = service.detailQnANo(bno);
		qna.setBreadCnt(qna.getBreadCnt()+1);
		service.updateQnA(qna);
		return qna;
	}
}
