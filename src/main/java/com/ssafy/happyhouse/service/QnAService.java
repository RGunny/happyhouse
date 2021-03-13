package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.QnADto;
import com.ssafy.happyhouse.mapper.QnAMapper;

@Service
public class QnAService {
	@Autowired
	private SqlSession sqlSession;
	
	//글 작성
	public boolean insertQnA(QnADto dto) {
		return sqlSession.getMapper(QnAMapper.class).insertQnA(dto)==1?true:false;
	}
	//글 삭제
	public boolean deleteQnA(int bno) {
		return sqlSession.getMapper(QnAMapper.class).deleteQnA(bno)==1?true:false;
	}
	//글 수정
	public boolean updateQnA(QnADto dto) {
		return sqlSession.getMapper(QnAMapper.class).updateQnA(dto)==1?true:false;
	}
	//글 조회(글 번호)
	public List<QnADto> selectQnANo(int bno) {
		return sqlSession.getMapper(QnAMapper.class).selectQnANo(bno);
	}
	//글 조회(글 제목)
	public List<QnADto> selectQnATitle(String btitle){
		StringBuffer sb = new StringBuffer();
		sb.append("%"+btitle+"%");
		return sqlSession.getMapper(QnAMapper.class).selectQnATitle(sb.toString());
	}
	//글 조회(글쓴이)
	public List<QnADto> selectQnAWriter(String bwriter){
		return sqlSession.getMapper(QnAMapper.class).selectQnAWriter(bwriter);
	}
	//전체 글 조회
	public List<QnADto> selectAll(){
		return sqlSession.getMapper(QnAMapper.class).selectAll();
	}
	//글 조회(글 번호)
	public QnADto detailQnANo(int bno) {
		return sqlSession.getMapper(QnAMapper.class).detailQnANo(bno);
	}
	

}
