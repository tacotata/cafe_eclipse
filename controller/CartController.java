package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.CartVo;
import com.example.service.CartService;
import com.example.service.MenuService;

@Controller

@RequestMapping("/person/*")
public class CartController {
	
	@Autowired	
	private CartService cartService;
	
	@Autowired
	private MenuService menuService;
	

	
	
	@GetMapping("/cart")
	public ResponseEntity<String> cart(CartVo cartVo ) throws Exception {
		
		int cartCheck = cartService.cartDupCheck(cartVo.getMemberId(), cartVo.getMenuNum());
		
		int cartCount = cartService.getCountCartById(cartVo.getMemberId());
		
		if(cartCheck == 1) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");
			
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("	alert('이미 장바구니에 담겨있습니다.');");
			sb.append("	history.back();");
			sb.append("</script>");

			return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
			
		}else {
			 cartService.cart(cartVo);
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("location", "/cafe/menu");
		
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
		
	}
	
	
	@GetMapping("/cancleCart")
	public String cancleCart(CartVo cartVo) {
		
		cartService.deleteCart(cartVo);
		
		return"redirect:/cafe/order?id=" + cartVo.getMemberId();
	}
	
}
