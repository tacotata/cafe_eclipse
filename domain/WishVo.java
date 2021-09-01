package com.example.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WishVo {
	
	private int num;
	private String memberId;
	private int menuNum;	
	private Timestamp regDate;
	
}
