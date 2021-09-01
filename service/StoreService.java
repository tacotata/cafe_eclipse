package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.StoreVo;
import com.example.mapper.NoticeMapper;
import com.example.mapper.StoreMapper;

@Service
public class StoreService {
	
	@Autowired
	private StoreMapper storeMapper;
	
	public void insertStore (StoreVo storeVo ) {
		storeMapper.insertStore(storeVo);
	}
	
	public StoreVo getStoreByNum(int num) {
		StoreVo storeVo = storeMapper.getStoreByNum(num);
		return storeVo;
	}
	
	public int getCountBySearch(String category, String search) {
		int count = storeMapper.getCountBySearch(category, search);
		return count;
	}
	
	public List<StoreVo> getStoresBySearch(int startRow, int pageSize, String category, String search){
		return storeMapper.getStoresBySearch(startRow, pageSize, category, search);
	}
}
