package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.example.domain.MenuVo;
import com.example.domain.pageDto;
import com.example.service.MenuService;
import com.example.service.MySqlService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/cafe/*")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MySqlService mySqlService;
	
	
	@GetMapping("/menu")
	public String menu(
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String category,
			@RequestParam(defaultValue = "") String search,
			Model model) {
		
		int menuCount = menuService.getCountBySearch(category, search);
		int bestCount = 5;
		int pageSize = 100;
		
		int startRow = (pageNum - 1) * pageSize;
		
		List<MenuVo> menuAll = null; 
		if (menuCount > 0 ) {
			menuAll = menuService.getListBySearch( category, search);
			
		}
		
	
		
		log.info("전체 메뉴 갯수" + menuCount);
		
		pageDto pageDto = new pageDto();
		
		pageDto.setCategory(category);
		pageDto.setSearch(search);
		pageDto.setCount(menuCount);
		/*
		 * pageDto.setPageCount(pageCount); pageDto.setStartPage(startPage);
		 * pageDto.setEndPage(endPage);
		 */
		
		
		model.addAttribute("menuAll", menuAll);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("pageNum", pageNum);
		
		
		return "cafe/menu";
	}
	
	//메뉴 등록 페이지 이동 
	@GetMapping("/insertMenu")
	public String insertMenu() {
		return "cafe/insertMenu";
	}
	
	//메뉴 등록
	@PostMapping("/insertMenu")
	public String insert(MenuVo menuVo, HttpServletRequest request, @RequestParam("file") MultipartFile multipartFile ) throws IOException {
		
		int num = mySqlService.getNextNum("menu");
		menuVo.setNum(num);
		
		
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/");
		
		File dir = new File(realPath + "/upload");
		
		if(!dir.exists()) {
			dir.mkdir();
		}
		
		String filename = multipartFile.getOriginalFilename();
		
		File saveFile = new File(dir, filename);
		
		multipartFile.transferTo(saveFile);
		
		menuVo.setItemImg(filename);
		
		menuService.insertMenu(menuVo);
		
		return "redirect:/cafe/menu";
	}
	

	@GetMapping("/new")
	public String menuNew(@RequestParam(defaultValue = "1")int num, Model model, MenuVo menuVo) {
		
	int count = menuService.getCountByNewMenus(num);
//		
	pageDto pageDto = new pageDto();
//		
//		int pageSize = 3;
//		int startRow =(pageNum -1 ) * pageSize;
//		
		List<MenuVo> menuAll = null; 
		if (count > 0 ) {
			menuAll = menuService.getListByNewMenus(menuVo);
			
			pageDto.setCount(count);
			
			
			model.addAttribute("menuAll", menuAll);
//			model.addAttribute("pageDto", pageDto);
//			model.addAttribute("pageNum", pageNum);
//			
		}
		return "cafe/new";
	}
	
	@GetMapping("/best")
	public String best(MenuVo menuVo , Model model) {
		
		List<MenuVo> menuAll = null; 
		menuAll = menuService.getBestMenus(menuVo);
		
		model.addAttribute("menuAll", menuAll);
		return "cafe/best";
	}
	
	@GetMapping("/menuDetail")
	public String menuDetail(int num, String pageNum, Model model) {
		
		MenuVo menuVo = menuService.getMenuByNum(num);
		
		if(menuVo.getItemDes() != null) {
			String content = menuVo.getItemDes().replace("\n", "<br>");
			menuVo.setItemDes(content);
		}
		
		model.addAttribute("menuVo", menuVo);
		model.addAttribute("pageNum", pageNum);
		
		return "cafe/menuDetail";
	}
}
