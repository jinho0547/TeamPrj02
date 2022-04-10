package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;

public interface FoodMapper {
@Select("SELECT f_no,f_poster,f_title,num "
		+ "FROM(SELECT f_no,f_poster,f_title,rownum as num "
		+ "FROM(SELECT /*+ INDEX_ASC(food food_f_no_pk)*/f_no,f_poster,f_title "
		+ "FROM food "
		+ "WHERE f_address LIKE '%'||#{address}||'%')) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FoodVO> foodFindData(Map map);
	
@Select("SELECT CEIL(COUNT(*)/5.0) FROM food "
		  +"WHERE f_address LIKE '%'||#{address}||'%'")
 public int foodFindTotalpage(String address);

@Select("SELECT f_no,f_poster,f_title,f_address,f_tel,f_kind, "
		  +"f_time,f_menu "
		  +"FROM ${table_name} "
		  +"WHERE f_no=#{no}")
 public FoodVO foodDetailData(Map map);
}
