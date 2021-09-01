package com.example.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVo {
	
	private String id;
	private String passwd;
	private String name;
	private String birth1;
	private String birth2;
	private String birth3;
	private String email;
	private String tel;
	private Timestamp regDate;
	

}
