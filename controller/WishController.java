package com.example.controller;


import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.WishVo;
import com.example.service.MenuService;
import com.example.service.WishService;

@Controller
@RequestMapping("/user/*")
public class WishController {
	
	@Autowired
	private WishService wishService;
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("/wish")
	public ResponseEntity<String> wish(WishVo wishVo) throws Exception {
		
		//나만의 음료 중복체크 
		int wishCheck = wishService.wishDupCheck(wishVo.getMemberId(), wishVo.getMenuNum());
		
		
		
		if(wishCheck == 1 ) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");		
			
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("alert('이미 등록한 메뉴 입니다.');");
			sb.append("history.back();");
			sb.append("</script>");
			
			return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
		}else {

			wishVo.setRegDate(new Timestamp(System.currentTimeMillis()));
			wishService.wish(wishVo);
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("location", "/cafe/menu");
		
				
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	}
	

}
