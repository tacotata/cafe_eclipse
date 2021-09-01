package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.MenuVo;
import com.example.domain.pageDto;
import com.example.service.CartService;
import com.example.service.MenuService;
import com.example.service.MySqlService;
import com.example.service.WishService;

@Controller
@RequestMapping("/cafe/*")
public class orderController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MenuService MenuService;
	
	@Autowired
	private MySqlService mySqlService;

	/*
	 * //myCafe 이동
	 * 
	 * @GetMapping("/order") public String order(
	 * 
	 * @RequestParam(defaultValue = "1") int pageNum,
	 * 
	 * @RequestParam("id") String userId, Model model) {
	 * 
	 * int cartCount = cartService.getCountCartById(userId);
	 * 
	 * 
	 * int pageSize =10;
	 * 
	 * int starRow = (pageNum - 1) * pageSize;
	 * 
	 * List<MenuVo> cartList = null; if(cartCount > 0) { cartList =
	 * cartService.getCartList(userId); }
	 * 
	 * pageDto pageDto = new pageDto();
	 * 
	 * if(cartCount > 0) { int pageCount = (cartCount /pageSize) + (cartCount %
	 * pageSize == 0 ? 0: 1);
	 * 
	 * int pageBlock = 10;
	 * 
	 * int startPage = ((pageNum /pageBlock) - (pageNum % pageBlock == 0 ? 1: 0)) *
	 * pageBlock + 1;
	 * 
	 * int endPage = startPage + pageBlock -1; if(endPage > pageCount) { endPage =
	 * pageCount; }
	 * 
	 * pageDto.setCount(cartCount); pageDto.setPageCount(pageCount);
	 * pageDto.setPageBlock(pageBlock); pageDto.setStartPage(startPage);
	 * pageDto.setEndPage(endPage);
	 * 
	 * 
	 * }
	 * 
	 * model.addAttribute("cartList", cartList); model.addAttribute("pageDto",
	 * pageDto); model.addAttribute("pageNum", pageNum);
	 * 
	 * return "cafe/order"; }
	 */
	
	@GetMapping("/order")
	public String myCoupon() {
		return"cafe/order";
	}
}
