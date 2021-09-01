package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
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

import com.example.domain.StoreVo;
import com.example.domain.pageDto;
import com.example.service.MySqlService;
import com.example.service.StoreService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/cafe/*")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MySqlService mysqlService;
	
	
	
	@GetMapping("/store")
	public String store(
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String category,
			@RequestParam(defaultValue = "") String search,
			Model model) {
		
		int count = storeService.getCountBySearch(category, search);
		
		int pageSize= 10;
		
		int startRow = (pageNum -1) * pageSize;
		
		List<StoreVo> storeList = null;
		
		if(count > 0 ) {
			storeList = storeService.getStoresBySearch(startRow, pageSize, category, search);
		}
		
		pageDto pageDto = new pageDto();
		
		if(count > 0 ) {
			int pageCount = (count/pageSize) + (count % pageSize == 0 ? 0:1);
			
			int pageBlock = 5;
			
			int startPage = ((pageNum/pageBlock) - (pageNum % pageBlock == 0? 1 : 0)) * pageBlock + 1;
		
			int endPage = startPage + pageBlock -1; 
			if(endPage > pageCount) {
				endPage = pageCount; 
			}
			
			pageDto.setCategory(category);
			pageDto.setSearch(search);
			pageDto.setCount(pageCount);
			pageDto.setPageCount(pageCount);
			pageDto.setPageBlock(pageBlock);
			pageDto.setStartPage(startPage);
			pageDto.setEndPage(endPage);
		}
		
		model.addAttribute("storeList", storeList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("pageNum", pageNum);
		
		return "cafe/store";
	}
	
	@GetMapping("/storeDetail")
	public String storeDetail( int num, String pageNum, Model model) {
		
		StoreVo storeVo = storeService.getStoreByNum(num);
		
		if(storeVo.getStoreAddress() != null) {
			String address = storeVo.getStoreAddress().replace("\n", "<br>");
			storeVo.setStoreAddress(address);
		}
		
		model.addAttribute("storeVo", storeVo);
		model.addAttribute("pageNum", pageNum);
		
		return "cafe/storeDetail";
	}
	
	@GetMapping("/insertStore")
	public String insertStore() {
		return "cafe/insertStore";
	}
	
	@PostMapping("insertStore")
	public String insertStore(StoreVo storeVo, HttpServletRequest request, @RequestParam("file") MultipartFile multipartFile ) throws IOException{
		
		storeVo.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		int num = mysqlService.getNextNum("notice");
		storeVo.setNum(num);
		
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/");
		
		File dir = new File(realPath + "/upload");
		
		if(!dir.exists()) {
			dir.mkdir();
		}
		
		String filename = multipartFile.getOriginalFilename();
		
		File saveFile = new File(dir, filename);
		
		multipartFile.transferTo(saveFile);
		
		storeVo.setStoreImg(filename);
		
		storeService.insertStore(storeVo);
		
		return "redirect:/cafe/store";
	}
}
