package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.domain.StoreVo;

public interface StoreMapper {
	
	void insertStore(StoreVo storeVo );
	
	@Select("SELECT * FROM store WHERE num = #{num}")
	StoreVo getStoreByNum(int num);
	
	int getCountBySearch(
			@Param("category") String category,
			@Param("search") String search);
	
	List<StoreVo> getStoresBySearch(
			@Param("startRow") int startRow,
			@Param("pageSize") int pageSize,
			@Param("category") String category,
			@Param("search") String search);
	
}
