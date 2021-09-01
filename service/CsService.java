package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.CsVo;
import com.example.domain.MemberVo;
import com.example.mapper.CsMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CsService {
	
	@Autowired
	private CsMapper csMapper;
	
	public void addCs(CsVo csVo) {
		csMapper.addCs(csVo);
	}
	
	
}
