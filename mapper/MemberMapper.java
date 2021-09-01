package com.example.mapper;

import java.util.List;

import com.example.domain.ByeVo;
import com.example.domain.MemberVo;

public interface MemberMapper {
	
	//회원가입 
	void addMember(MemberVo memberVo);
	
	//아이디 중복 체크 
	int getCountById(String id);
	
	//로그인시 아이디 패스워드 일치 여부
	String userCheck(String id);
	
	//탈퇴
	void deleteMember();
	
	//아이디 찾기	
	MemberVo selectByUser(MemberVo memberVo);
	
	//비밀번호 찾기
	MemberVo selectByPw(MemberVo memberVo);
	
	//비밀번호 변경	
	void updatePw(MemberVo memberVo);
	
	//memberVo가져오기 
	List<MemberVo> readMember(MemberVo memberVo);
	//탈퇴 이유 등록
	void insertBye(ByeVo byeVo);
	
	//탈퇴
	int deleteMember(String id);
	
}
