package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	private SqlSession sqlSession;
	
	public MemberDto selectWithIdAndPw(String userid, String userpwd) {
		return sqlSession.getMapper(MemberMapper.class).selectWithIdAndPw(userid, userpwd);
	}
	public boolean insertMember(MemberDto dto) {
		if(sqlSession.getMapper(MemberMapper.class).insertMember(dto) == 1) {
			return true;
		}
		return false;
	}
	public MemberDto searchUser(String userid) {
		return sqlSession.getMapper(MemberMapper.class).searchUser(userid);
	}
	public boolean modifyUserInfo(MemberDto dto) {
		if(sqlSession.getMapper(MemberMapper.class).modifyUserInfo(dto) == 1) {
			return true;
		}
		return false;
	}
	public boolean deleteUser(String userId) {
		if(sqlSession.getMapper(MemberMapper.class).deleteUser(userId) == 1) {
			return true;
		}
		return false;
	}
	
	public MemberDto login(MemberDto memberDto) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).login(memberDto);
	}

	public String getServerInfo() {
		return "사용자에게 전달하고 싶은 중요정보";
	}
	public List<MemberDto> findUserIdUseEmail(String userEmail) {
		return sqlSession.getMapper(MemberMapper.class).findUserIdUseEmail(userEmail);
	}
	public String findUserPwUseUserId(String userId) {
		return sqlSession.getMapper(MemberMapper.class).findUserPwUseUserId(userId);
	}

}
