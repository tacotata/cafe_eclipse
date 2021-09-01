package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.NoticeVo;
import com.example.mapper.NoticeMapper;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	public void addNotice(NoticeVo noticeVo) {
		noticeMapper.addNotice(noticeVo);
	}
	
	public NoticeVo getNoticeByNum(int num) {
		NoticeVo noticeVo =  noticeMapper.getNoticeByNum(num);
		return noticeVo;
	}
	
	public int getCountAll() {
		int count = noticeMapper.getCountAll();
		return count;
	}
	
	public void updateBoard(NoticeVo noticeVo) {
		noticeMapper.updateBoard(noticeVo);
	}
	
	public List<NoticeVo> getNotices(int startRow, int pageSize) {
		List<NoticeVo> list = noticeMapper.getNotices(startRow, pageSize);
		return list;
	}
	
	public void deleteNoticeByNum(int num) {
		noticeMapper.deleteNoticeByNum(num);
	}
	
	public void deleteAll() {
		noticeMapper.deleteAll();
	}
	
	public int getCountBySearch(String category, String search) {
		int count = noticeMapper.getCountBySearch(category, search);
		return count;
	}
	
	public List<NoticeVo> getNoticesBySearch(int startRow, int pageSize, String category, String search){
		return noticeMapper.getNoticesBySearch(startRow, pageSize, category, search);
	}
}
