package com.example.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CsVo {
	
	private  int num; 
	private String csId;
	private String csEmail;
	private String csTitle; 
	private String csContent;
	private String csImg;
	private Timestamp regDate;
}
