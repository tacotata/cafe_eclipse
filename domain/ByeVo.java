package com.example.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ByeVo {
	
	private int num; 	
	private String reason;
	private Timestamp byeDate;
}
