package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import java.util.*;
import com.sist.vo.*;

@Repository
public class searchDAO {
	@Autowired
	private SearchMapper mapper;
	
	public List<clubVO> recipeFindData(Map map)
	   {
		   return mapper.recipeFindData(map);
	   }
	   public int recipeFindTotalPage(String fd)
	   {
		   return mapper.recipeFindTotalPage(fd);
	   }
	   
	   public List<clubVO> searchFindData(Map map)
	   {
		   return mapper.searchFindData(map);
	   }
	   
	   public int searchTotalPage(String ss)
	   {
		   return mapper.searchTotalPage(ss);
	   }
	   

}
