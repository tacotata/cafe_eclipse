package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.MenuVo;
import com.example.domain.WishVo;
import com.example.mapper.WishMapper;

@Service
public class WishService {
	
	@Autowired
	private WishMapper wishMapper;
	
	//나만의 음료 등록
	public void wish(WishVo wishVo) {
		wishMapper.wish(wishVo);
	}
	
	//나만의 음료 중복 확인 
	public int wishDupCheck(String memberId, int menuNum) {
		return wishMapper.wishDupCheck(memberId, menuNum);
	}
	
	//한 아이디당 나만의 음료 개수 구하기
	public int getCountWishById(String memberId) {
		return wishMapper.getCountWishById(memberId);
	}
	
	//나만의 음료 리스트 가져오기 
	public List<MenuVo> getWishList(String memberId){
		return wishMapper.getWishList(memberId);
	}
	
	//나만의 음료 삭제하기 
	public void deleteWish(WishVo wishVo) {
		wishMapper.deleteWish(wishVo);
	}
	
	public void deleteWishByNum(int num) {
		wishMapper.deleteWishByNum(num);
	}
	
	
	public WishVo getWishByNum(int num) {
		WishVo wishVo = wishMapper.getWishByNum(num);
		return wishVo;
	}
	
	public List<WishVo> getWishVo(WishVo wishVo) {
		return wishMapper.getWishVo(wishVo);
	}
	
}
