package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.dto.MemberDto;

public interface MemberMapper {
	public MemberDto selectWithIdAndPw(@Param("userId")String userId, @Param("userPw")String userPw);
	public int insertMember(MemberDto dto);
	public MemberDto searchUser(@Param("userId")String userId);
	public int modifyUserInfo(MemberDto dto);
	public int deleteUser(String userId);
	public MemberDto login(MemberDto memberDto) throws SQLException;
	public List<MemberDto> findUserIdUseEmail(String userEmail);
	public String findUserPwUseUserId(String userId);
}
