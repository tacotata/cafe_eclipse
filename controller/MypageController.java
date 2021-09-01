package com.example.controller;

import java.io.Console;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.MemberVo;
import com.example.domain.MenuVo;
import com.example.domain.WishVo;
import com.example.domain.pageDto;
import com.example.service.MemberService;
import com.example.service.MenuService;
import com.example.service.MySqlService;
import com.example.service.WishService;

import ch.qos.logback.classic.Logger;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MypageController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private WishService wishService;
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MySqlService mySqlService;
	
	@GetMapping("/mypage")
	public String mypage(
			 Model model , @RequestParam(defaultValue = "1")int num , WishVo wishVo, MemberVo memberVo ) {
		List<WishVo> wishAll = null;
		List<MemberVo> memberAll= null; 
		memberAll = memberService.readMember(memberVo);
//		wishVo.setRegDate(new Timestamp(System.currentTimeMillis()));
		
	 wishVo = wishService.getWishByNum(num);
	 model.addAttribute("memberAll", memberAll); 
		 model.addAttribute("wishAll", wishAll); 
		return"member/mypage";
	}
	
	@GetMapping("/myMenu")
	public String myMenu(
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam("id") String memberId, Model model, WishVo wishVo ) {
		
		int wishCount = wishService.getCountWishById(memberId);
		
		

		wishVo.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		int num = mySqlService.getNextNum("wish");
		/* WishVo wishVo = wishService.getWishByNum(num); */
			
		int pageSize= 10; 
		
		int StartRow = (pageNum -1 ) * pageSize;
		List<WishVo> wishAll = null;
		
		if(wishCount >0) {
			wishAll = wishService.getWishVo(wishVo);
		}
		
		List<MenuVo> wishList = null;
		if(wishCount >0) {
			wishList = wishService.getWishList(memberId);
		}
		
		pageDto pageDto = new pageDto();
		
		if(wishCount > 0) {
			int pageCount = (wishCount / pageSize) + (wishCount % pageSize == 0 ? 0:1);
			
			int pageBlock = 5;
			
			int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		
			int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		
		
			pageDto.setCount(wishCount);
			pageDto.setPageCount(pageCount);
			pageDto.setPageBlock(pageBlock);
			pageDto.setStartPage(startPage);
			pageDto.setEndPage(endPage);
		
		
	}
	model.addAttribute("WishVo", wishVo); 
		model.addAttribute("wishAll", wishAll);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("pageNum", pageNum);
	
		return"member/myMenu";
	}
	
	
	@GetMapping("/delet")
	public String delete(int num, String pageNum, RedirectAttributes rttr) {
		
		wishService.deleteWishByNum(num);
		
		rttr.addAttribute("pageNum", pageNum);
		
		return "redirect:/member/myMenu";
	}
	
	@GetMapping("/myCoupon")
	public String myCoupon() {
		return"member/myCoupon";
	}

	//비밀번호 변경
	 @RequestMapping(value="/updatePw", method = RequestMethod.POST)
	    public String updatePw(HttpSession session, MemberVo memberVo, RedirectAttributes rttr ) throws Exception {
		 	
	        memberService.updatePw(memberVo);
	        session.invalidate();
	        //이거 필ㅇ요없잖아 
	       // rttr.addFlashAttribute("result", "updateOK");
	        return "redirect:/";
	    }


	
	
	
}
