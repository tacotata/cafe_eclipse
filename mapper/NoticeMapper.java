package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.domain.NoticeVo;

public interface NoticeMapper {
	
	void addNotice(NoticeVo noticeVo);
	
	@Select("SELECT * FROM notice WHERE num = #{num}")
	NoticeVo getNoticeByNum(int num);
	
	void updateBoard(NoticeVo noticeVo);
	
	int getCountAll();
	
	List<NoticeVo> getNotices(@Param("startRow") int startRow, @Param("pageSize") int pageSize);
	
	@Delete("DELETE FROM notice WHERE num =#{num}")
	void deleteNoticeByNum(int num);
	
	@Delete("DELETE FROM notice")
	void deleteAll();
	
	int getCountBySearch(
			@Param("category") String category,
			@Param("search") String search);
	
	List<NoticeVo> getNoticesBySearch(
			@Param("startRow") int startRow,			
			@Param("pageSize") int pageSize,
			@Param("category") String category,
			@Param("search") String search);
	
	List<NoticeVo> getNoticesByNums(@Param("numList") List<Integer> numList);
}
