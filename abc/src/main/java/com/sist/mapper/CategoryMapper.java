package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.categoryVO;
public interface CategoryMapper {
  @Select("SELECT c_no,type "
		 +"FROM category")
  public List<categoryVO> categoryListData();
  
  @Select("SELECT type "
		  +"FROM category "
		  +"WHERE c_no=#{c_no}")
   public categoryVO categoryInfoData(int c_no);
  
  
}
