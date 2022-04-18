package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface SearchMapper {
	@Select("SELECT cl_no,cl_name,cl_poster,cl_content,cl_category,num "
		     +"FROM (SELECT cl_no,cl_name,cl_poster,cl_content,cl_category,rownum as num "
			 +"FROM (SELECT /*+ INDEX_ASC(club cl_clno_pk)*/ cl_no,cl_name,cl_poster,cl_content,cl_category "
			 +"FROM club "
			 +"WHERE cl_category LIKE '%'||#{fd}||'%')) "
			 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<clubVO> recipeFindData(Map map);
	  
	  @Select("SELECT CEIL(COUNT(*)/12.0) "
			 +"FROM club "
			 +"WHERE cl_category LIKE '%'||#{fd}||'%'")
	  public int recipeFindTotalPage(String fd);
	  
	  @Select("SELECT cl_no,cl_name,cl_poster,cl_content,cl_category,num "
			     +"FROM (SELECT cl_no,cl_name,cl_poster,cl_content,cl_category,rownum as num "
				 +"FROM (SELECT /*+ INDEX_ASC(club cl_clno_pk)*/ cl_no,cl_name,cl_poster,cl_content,cl_category "
				 +"FROM club "
				 +"WHERE cl_name LIKE '%'||#{ss}||'%')) "
				 +"WHERE num BETWEEN #{start} AND #{end}")
		  public List<clubVO> searchFindData(Map map);
	  
		  @Select("SELECT CEIL(COUNT(*)/12.0) "
					 +"FROM club "
					 +"WHERE cl_name LIKE '%'||#{ss}||'%'")
	   public int searchTotalPage(String ss);
	   
	   

}
