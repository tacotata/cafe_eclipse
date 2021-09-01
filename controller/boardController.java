package com.example.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.NoticeVo;
import com.example.domain.pageDto;
import com.example.service.MySqlService;
import com.example.service.NoticeService;

@Controller
@RequestMapping("/board/*")
public class boardController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private MySqlService mySqlService;
	
	
	@GetMapping("/notice")
	public String list(
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String category,
			@RequestParam(defaultValue = "") String search,
			Model model) {
		
		int count = noticeService.getCountBySearch(category, search);
		
		int pageSize = 10; 
		
		int startRow = (pageNum -1) * pageSize; 
		
		List<NoticeVo> noticeList = null;
		if (count > 0) {
			noticeList = noticeService.getNoticesBySearch(startRow, pageSize, category, search );
		}
		
		pageDto pageDto = new pageDto();
		
		if(count > 0) {
			int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0:1);
			
			int pageBlock = 5;
			
			int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		
			int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		
			pageDto.setCategory(category);
			pageDto.setSearch(search);
			pageDto.setCount(count);
			pageDto.setPageCount(pageCount);
			pageDto.setPageBlock(pageBlock);
			pageDto.setStartPage(startPage);
			pageDto.setEndPage(endPage);
		}
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("pageDto", pageDto);
			model.addAttribute("pageNum", pageNum);
		
		
		return "board/notice";
	}
	
	@GetMapping("/noticeContent")
	public String noticeContent(int num, String pageNum, Model model) {
		
		NoticeVo noticeVo = noticeService.getNoticeByNum(num);
		
		String content ="";
		if(noticeVo.getContent() !=null) {
			content = noticeVo.getContent().replace("\n", "<br>");
			noticeVo.setContent(content);
		}
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("pageNum", pageNum);
		
		return "board/noticeContent";
	}
	
	@GetMapping("/delete")
	public String delete(int num, String pageNum, RedirectAttributes rttr) {
		
		noticeService.deleteNoticeByNum(num);
		
		rttr.addAttribute("pageNum", pageNum);
		
		return "redirect:/board/notice";
	}
	
	@GetMapping("/modifyForm")
	public String modify(int num, @ModelAttribute("pageNum") String pageNum, Model model) {
		
		NoticeVo noticeVo = noticeService.getNoticeByNum(num);
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "board/modifyForm";
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVo noticeVo, String pageNum, RedirectAttributes rttr) {
		
		noticeService.updateBoard(noticeVo);
		
		rttr.addAttribute("num", noticeVo.getNum());
		rttr.addAttribute("pageNum", pageNum);
				
		return "redirect:/board/noticeContent";
	}
	
	@GetMapping("/noticeForm")
	public String noticeForm() {
		return "board/noticeForm";
	}
	
	@PostMapping("/noticeForm")
	public String noticeForm(String pageNum, NoticeVo noticeVo,
					HttpSession session, HttpServletRequest request) {
		
		noticeVo.setRegDate(new Timestamp(System.currentTimeMillis()));
		noticeVo.setUpdateDate(new Timestamp(System.currentTimeMillis()));
		
		int num = mySqlService.getNextNum("notice");
		
		noticeService.addNotice(noticeVo);
		
		return "redirect:/board/noticeContent?num="+ num +"&pageNum" + pageNum;
	}
	
	
}
