package com.sist.dao;
import com.sist.mapper.*;
import com.sist.vo.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainMainDAO {
	@Autowired
	private MainMainMapper mapper;
	
	public int countMyCategory(String id) {
		int num = mapper.countMyCategory(id);
		return num;
	}
	
	public String callMyCategory(String id) {
		String category = mapper.callMyCategory(id);
		return category;
	}
	
	public clubVO recommendClub1(String cl_category1) {
		clubVO vo1 = mapper.recommendClub1(cl_category1);
		return vo1;
	}
	public clubVO recommendClub2(String cl_category2) {
		clubVO vo2 = mapper.recommendClub1(cl_category2);
		return vo2;
	}
	public clubVO recommendClub3(String cl_category3) {
		clubVO vo3 = mapper.recommendClub3(cl_category3);
		return vo3;
	}
	public clubVO recommendClub4(String cl_category4) {
		clubVO vo4 = mapper.recommendClub4(cl_category4);
		return vo4;
	}
	public clubVO recommendClub5(String cl_category5) {
		clubVO vo5 = mapper.recommendClub5(cl_category5);
		return vo5;
	}
	public clubVO mainMovingClub1(){
		clubVO vo = mapper.mainMovingClub1();
		return vo;
	}
	public clubVO mainMovingClub2(){
		clubVO vo = mapper.mainMovingClub2();
		return vo;
	}
	public clubVO mainMovingClub3(){
		clubVO vo = mapper.mainMovingClub3();
		return vo;
	}
	public clubVO mainMovingClub4(){
		clubVO vo = mapper.mainMovingClub4();
		return vo;
	}
	public clubVO mainMovingClub5(){
		clubVO vo = mapper.mainMovingClub5();
		return vo;
	}
}
