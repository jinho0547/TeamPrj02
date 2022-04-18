package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.GalendarPuzzleVO;

public interface GalendarMapper {
	// 갤린더 리스트 페이지
	@Select("SELECT p_no,p_loc,p_date,p_title,cl_no "
			+ "FROM puzzle "
			+ "WHERE cl_no=#{cl_no}")
	public List<GalendarPuzzleVO> galendarListData(int cl_no);
	
	// 클릭한 모임 상세페이지
	@Select("SELECT * FROM puzzle WHERE p_no=#{p_no} AND cl_no=#{cl_no}")
	public GalendarPuzzleVO galendarDetailData(Map map);
	
	// 지역을 통한 통계 이용
	@Select("SELECT COUNT(p_loc) FROM puzzle WHERE cl_no=#{cl_no} AND p_loc=#{p_loc}")
	public int galendarCount(Map map);
	
	@Select("SELECT DISTINCT(p_loc) FROM puzzle WHERE cl_no=#{cl_no}")
	public List<String> galendarLoc(int cl_no);
	
	// 모임 인원 체크
	@Select("SELECT COUNT(*) FROM puzzlejoin WHERE p_no=#{p_no} AND rownum<=#{p_head}")
	public int galendarPuzzleCount(Map map);
	
	// 모임 id 체크
	@Select("SELECT COUNT(*) FROM puzzlejoin WHERE id=#{id} AND p_no=#{p_no}")
	public int galendarPuzzleId(Map map);
	
	// 모임 insert
	@Insert("INSERT INTO puzzlejoin VALUES(#{id},#{p_no})")
	public void galendarPuzzleInsert(Map map);
	
	@Select("SELECT * FROM (SELECT * from puzzle WHERE p_date>SYSDATE) "
			+ "WHERE rownum<=6 AND cl_no=#{cl_no} order by p_date asc")
	public List<GalendarPuzzleVO> galendarMainListData(int cl_no);
}
