package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.example.domain.MenuVo;
import com.example.domain.NoticeVo;
import com.example.domain.WishVo;

public interface WishMapper {
	
	//나만음료 등록 
	void wish(WishVo wishVo);
	

	//나만의 음료 중복확인
	int wishDupCheck(String memberId, int menuNum);
	
	//한 아이디당 나만의 음료 개수 구하기
	int getCountWishById(String memberId);
	
	//찜한 리스트 가져오기 
	List<MenuVo> getWishList(String memberId);
	
	//나만의 음료 삭제 
	void deleteWish(WishVo wishVo);
	
	@Delete("DELETE FROM wish WHERE num =#{num}")
	void deleteWishByNum(int num);
	
	
	@Select("SELECT * FROM wish WHERE num = #{num}")
	WishVo getWishByNum(int num);
	
	List<WishVo> getWishVo(WishVo wishVo);
}
