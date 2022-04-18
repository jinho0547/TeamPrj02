package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;


public interface PmemberMapper {

	@Select("SELECT * "
			+ "FROM grade "
			+ "WHERE cl_rank=4 "
			+ "AND cl_no=#{cl_no}")
	public List<PmemberVO> pmember(int cl_no);
	
	@Select("SELECT * "
			+ "FROM grade "
			+ "WHERE cl_no=#{cl_no} AND cl_rank BETWEEN 2 AND 3 "
			+ "ORDER BY cl_rank ASC")
	public List<PmemberVO> all_pmember(int cl_no);
	
	@Select("SELECT cl_rank "
			+ "FROM grade "
			+ "WHERE cl_no=#{cl_no} AND cl_rank=1" )
	public Integer membergrade(int cl_no);
	
	
	@Update("UPDATE grade SET cl_rank=3 "
			+ "WHERE cl_no=#{cl_no} AND id=#{id}")
	public void member_rankup(Map map);
	
	@Delete("DELETE FROM grade "
			+ "WHERE cl_no=#{cl_no} AND id=#{id}")
	public void member_refuse(Map map);
	
	@Update("UPDATE grade SET cl_rank=2 "
			+ "WHERE cl_no=#{cl_no} AND id=#{id}")
	public void member_doublerankup(Map map);
	
	@Update("UPDATE grade SET cl_rank=3 "
			+ "WHERE cl_no=#{cl_no} AND id=#{id}")
	public void member_rankdown(Map map);
	
	@Select("SELECT id "
			+ "FROM grade "
			+ "WHERE cl_no=#{cl_no)")
	public List<PmemberVO> find_name(int cl_no);
	
	/*@Select("SELECT f_no,f_poster,f_title,num "
			+ "FROM(SELECT f_no,f_poster,f_title,rownum as num "
			+ "FROM(SELECT + INDEX_ASC(food food_f_no_pk)f_no,f_poster,f_title "
			+ "FROM food "
			+ "WHERE f_address LIKE '%'||#{address}||'%')) "*/
			

}
