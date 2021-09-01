package com.example.mapper;

import java.util.List;

import com.example.domain.CartVo;
import com.example.domain.MenuVo;

public interface CartMapper {
	
	void cart(CartVo cartVo);
	
	int cartDupCheck(String memberId, int menuNum);
	
	int getCountCartById(String memberId);
	
	List<MenuVo> getCartList(String memberId);
	
	void deleteCart(CartVo cartVo);
}
