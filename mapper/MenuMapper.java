package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.domain.MenuVo;

public interface MenuMapper {
	
	//메뉴 등록하기
	void insertMenu(MenuVo menuVo);
	
	@Select("SELECT * FROM menu WHERE num =#{num}")
	MenuVo getMenuByNum(int num);
	
	@Select("SELECT count(*) from menu")
	int getCountMenu();
	
	int getCountBySearch(
			@Param("category") String category,
			@Param("search") String search);
	
	List<MenuVo> getListBySearch (
			
			@Param("category") String category,
			@Param("search") String search);
	
	int getCountByNewMenus(int num);
	
	List<MenuVo> getListByNewMenus(
			MenuVo menuVo);
	
	List<MenuVo> getBestMenus(MenuVo menuVo);
}
