package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.QnADto;

public interface QnAMapper {
	//글 작성
	public int insertQnA(QnADto dto);
	//글 삭제
	public int deleteQnA(int bno);
	//글 수정
	public int updateQnA(QnADto dto);
	//글 조회(글 번호)
	public List<QnADto> selectQnANo(int bno);
	//글 조회(글 제목)
	public List<QnADto> selectQnATitle(String btitle);
	//글 조회(글쓴이)
	public List<QnADto> selectQnAWriter(String bwriter);
	//전체 글 조회
	public List<QnADto> selectAll();
	
	// 상세보기(글번호)
	public QnADto detailQnANo(int bno);
}
