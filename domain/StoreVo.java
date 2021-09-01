package com.example.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class StoreVo {
	
	private int num; 
	private String storeImg;
	private String storeName;
	private String storeAddress;
	private String storeTel;
	private String storeTime;
	private String storeService;
	private Timestamp regDate;
	private String area;
	
}
