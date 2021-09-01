package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ByeVo;
import com.example.domain.MemberVo;
import com.example.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	
	//회원가입 
	public void addMember(MemberVo memberVo) {
		memberMapper.addMember(memberVo);
	}
	
	//아이디 중복 체크 
	public int getCountById(String id ) {
		return memberMapper.getCountById(id);
	}
	
	//로그인시 아이디 패스워드 일치 여부 
	public int userCheck(String id, String passwd) {
		int check = -1;
		
		String dbPasswd = memberMapper.userCheck(id);
		
		if(dbPasswd != null) {
			if(passwd.equals(dbPasswd)) {
				check = 1;
			} else {
				check = 0;
			}
		}else { //dbPasswd == null
			check = -1;
		}
		return check; 
	}
	
	//아이디 찾기
	public MemberVo idSearch(MemberVo memberVo) {
		
		return memberMapper.selectByUser(memberVo);
	}
	
	//비밀번호 찾기 
	public MemberVo pwdSearch(MemberVo memberVo) {
		return memberMapper.selectByPw(memberVo);
	}

	//비밀번호 변경 
	public void updatePw(MemberVo memberVo) {
		memberMapper.updatePw(memberVo);
	}
	
	//memberVo읽기 
	public List<MemberVo> readMember(MemberVo memberVo){
		return memberMapper.readMember(memberVo);
	}
	
	//탈퇴 이유 등록
	public void insertBye(ByeVo byeVo) {
		memberMapper.insertBye(byeVo);
	}
	
	//탈퇴
	public int deleteMember(String id) {
	
		return memberMapper.deleteMember(id);
	}
	 
	
}
