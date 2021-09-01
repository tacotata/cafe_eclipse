package com.example.domain;

import lombok.Data;

@Data
public class MenuVo {
	
	private int num; 
	private String itemImg;
	private String sort;
	private String itemNameKo;
	private String itemNameEn;
	private String itemKcal;
	private String itemFat;
	private String itemProtein;
	private String itemSalt;
	private String itemSugar;
	private String itemCaffeine;	
	private String itemDes;
	private int orderCount;
	private int reserveCount;
	private int price;
	
}
