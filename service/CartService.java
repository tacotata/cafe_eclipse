package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.domain.CartVo;
import com.example.domain.MenuVo;
import com.example.mapper.CartMapper;

@Service
public class CartService {
	private CartMapper cartMapper;
	
	public void cart(CartVo cartVo) {
		cartMapper.cart(cartVo);
	}
	
	public int cartDupCheck(String memberId, int menuNum) {
		return cartMapper.cartDupCheck(memberId, menuNum);
	}

	public int getCountCartById(String memberId) {
		return cartMapper.getCountCartById(memberId);
	}
	
	public List<MenuVo> getCartList (String memberId) {
		return cartMapper.getCartList(memberId);
	}

	public void deleteCart( CartVo cartVo) {
		cartMapper.deleteCart(cartVo);
	}
}

