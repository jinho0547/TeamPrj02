package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.context.request.SessionScope;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.clubVO;
import com.sist.vo.clubgradeVO;
import com.sist.vo.clubpuzzleVO;

public interface clubMapper {
	// Insert 동아리 생성
	@Insert("INSERT INTO club VALUES(cl_no_seq.nextval,#{cl_poster},#{cl_content},#{cl_head},#{cl_loc},#{cl_category},#{cl_name})")
	public void clubInsert(clubVO vo);
	
	// Insert 회원등급 생성
	@Insert("INSERT INTO grade VALUES(1,#{id},#{cl_no},#{g_msg})")
	public void gradeInsert(Map map);
	
	@Select("SELECT MAX(cl_no) FROM CLUB")
	public int clubmax();
	
	@Select("SELECT cl_no,cl_name,cl_poster,cl_content "
			 +"FROM club "
			 +"WHERE cl_no=#{cl_no}")
	  public clubVO clubMainData(int cl_no);
	
	  
	@Select("SELECT * FROM (SELECT id,cl_no FROM grade WHERE id in(SELECT id FROM grade WHERE id=#{id1,jdbcType = VARCHAR})) v JOIN club ON v.cl_no=club.cl_no")
	public List<clubgradeVO> clubgradeMainData(Map map);
	
	/*
	 * @Select("SELECT * "
	 * +"FROM (SELECT p_no,p_cost,p_head,p_loc,p_date,p_time,p_title,p_dloc,p_content "
	 * +"FROM puzzle " +"WHERE p_date>SYSDATE order by 1 asc) " +"WHERE rownum<=12")
	 * public List<clubpuzzleVO> clubpuzzleMainData();
	 */
	
	@Select("SELECT * FROM (SELECT p_date,cl_no FROM puzzle WHERE p_date in(SELECT p_date FROM puzzle WHERE p_date>SYSDATE)) v JOIN club ON v.cl_no=club.cl_no")
	public List<clubpuzzleVO> clubpuzzleMainData();
	
	@Select("SELECT * FROM CLUB WHERE cl_no=#{cl_no}")
	public clubVO puzzleMainInfoData(int cl_no);
	
	
	 
}
