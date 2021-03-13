package com.ssafy.happyhouse.mapper;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.happyhouse.dto.BoardDto;

public interface BoardMapper {
	public List<BoardDto> selectAll();
	public List<BoardDto> selectBnum(int bnum);
	public List<BoardDto> selectBtitle(String btitle);
	public BoardDto detailBoard(int bnum);
	public int updateBoard(BoardDto dto);
	public int deleteBoard(int bnum);
	public int insertBoard(BoardDto dto);
}
