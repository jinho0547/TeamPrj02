package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import  java.util.*;
import com.sist.mapper.CategoryMapper;
import com.sist.vo.*;
@Repository
public class categoryDAO {
   @Autowired  // 인터페이스를 구현한 클래스의 주소값을 주입 (자동 주입)
   private CategoryMapper mapper;
   
   public List<categoryVO> categoryListData()
   {
	   return mapper.categoryListData();
   }
   public categoryVO categoryInfoData(int c_no)
   {
	   return mapper.categoryInfoData(c_no);
   }
}
