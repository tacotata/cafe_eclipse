package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.MenuVo;
import com.example.mapper.MenuMapper;

@Service
public class MenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	
	//메뉴 등록하기
	public void insertMenu (MenuVo menuVo) {
		menuMapper.insertMenu(menuVo);
	}
	
	public MenuVo getMenuByNum(int num) {
		MenuVo menuVo = menuMapper.getMenuByNum(num);
		return menuVo;
	}
	
	public int getCountBook() {
		return menuMapper.getCountMenu();
	}
	
	public int getCountBySearch(String category, String search) {
		return menuMapper.getCountBySearch(category, search);
	}
	
	public List<MenuVo> getListBySearch ( String category, String search ) {
		return menuMapper.getListBySearch(category, search);
	}
	
	public int getCountByNewMenus(int num) {
		return menuMapper.getCountByNewMenus(num);
	}
	
	public List<MenuVo> getListByNewMenus(MenuVo menuVo){
		return menuMapper.getListByNewMenus(menuVo);
	}
	
	public List<MenuVo> getBestMenus(MenuVo menuVo) {
		return menuMapper.getBestMenus(menuVo);
	
	}
}
