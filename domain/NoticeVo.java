package com.example.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVo {
	
	private int num;
	private String id;
	private String subject;
	private String content;
	private Timestamp regDate;
	private int reRef;
	private int reLev;
	private int reSeq;
	private Timestamp updateDate;
	
	private List<AttachVo> attachList;
}
