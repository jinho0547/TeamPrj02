package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
public interface MainMainMapper {
	
	//찜 추가
	@Insert("INSERT INTO wish(w_no,cl_no,id) VALUES(#{w_no},#{cl_no},#{id}")
	public void InsertWishClub(Map map);
	
	//관심카테고리 숫자
	@Select("SELECT COUNT(category) FROM member WHERE id=#{id}")
	public int countMyCategory(String id);
	
	//관심카테고리 불러오기
	@Select("SELECT category FROM member WHERE id=#{id}")
	public String callMyCategory(String id);
	
	//관심카테고리 동아리 추천1
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category,rownum FROM club WHERE cl_category LIKE #{cl_category1} AND rownum=1")
	public clubVO recommendClub1(String cl_category1);
	//관심카테고리 동아리 추천2
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category,rownum FROM club WHERE cl_category LIKE #{cl_category2} AND rownum=1")
	public clubVO recommendClub2(String cl_category2);
	//관심카테고리 동아리 추천3
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category,rownum FROM club WHERE cl_category LIKE #{cl_category3} AND rownum=1")
	public clubVO recommendClub3(String cl_category3);
	//관심카테고리 동아리 추천4
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category,rownum FROM club WHERE cl_category LIKE #{cl_category4} AND rownum=1")
	public clubVO recommendClub4(String cl_category4);
	//관심카테고리 동아리 추천5
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category,rownum FROM club WHERE cl_category LIKE #{cl_category5} AND rownum=1")
	public clubVO recommendClub5(String cl_category5);
	
	//움직이는 메인 동아리
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category FROM club WHERE cl_no=85")
	public clubVO mainMovingClub1();
	//움직이는 메인 동아리
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category FROM club WHERE cl_no=86")
	public clubVO mainMovingClub2();
	//움직이는 메인 동아리
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category FROM club WHERE cl_no=87")
	public clubVO mainMovingClub3();
	//움직이는 메인 동아리
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category FROM club WHERE cl_no=88")
	public clubVO mainMovingClub4();
	//움직이는 메인 동아리
	@Select("SELECT cl_no,cl_poster,cl_name,cl_head,cl_loc,cl_category FROM club WHERE cl_no=89")
	public clubVO mainMovingClub5();
	
}
