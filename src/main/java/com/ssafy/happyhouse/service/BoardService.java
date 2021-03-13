package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.BoardDto;
import com.ssafy.happyhouse.mapper.BoardMapper;

@Service
public class BoardService {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDto> selectAll(){
		return sqlSession.getMapper(BoardMapper.class).selectAll();
	}
	public List<BoardDto> selectBnum(int bnum){
		return sqlSession.getMapper(BoardMapper.class).selectBnum(bnum);
	}
	public List<BoardDto> selectBtitle(String btitle){
		StringBuffer sb = new StringBuffer();
		sb.append("%"+btitle+"%");
		return sqlSession.getMapper(BoardMapper.class).selectBtitle(sb.toString());
	}
	public BoardDto detailBoard(int bnum) {
		return sqlSession.getMapper(BoardMapper.class).detailBoard(bnum);
	}
	public boolean updateBoard(BoardDto dto) {
		if(sqlSession.getMapper(BoardMapper.class).updateBoard(dto)==1) {
			return true;
		}
		return false;
	}
	public boolean deleteBoard(int bno) {
		if(sqlSession.getMapper(BoardMapper.class).deleteBoard(bno)==1) {
			return true;
		}
		return false;
	}
	public boolean insertBoard(BoardDto dto) {
		if(sqlSession.getMapper(BoardMapper.class).insertBoard(dto)==1) {
			return true;
		}
		return false;
	}
	

}
