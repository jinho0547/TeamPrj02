package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class FoodDAO {
	@Autowired
	private FoodMapper mapper;
	
	public List<FoodVO> foodFindData(Map map)
	{
		return mapper.foodFindData(map);
	}
	public int foodFindTotalpage(String address)
	{
		return mapper.foodFindTotalpage(address);
	}
	 public FoodVO foodDetailData(Map map)
	 {
		 return mapper.foodDetailData(map);
	 }
}
