package com.sist.web;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.dao.*;

@RestController
@RequestMapping("/puzzle/{cl}/")
public class FoodRestController {
	@Autowired
	private FoodDAO dao;
	
	//음식 검색리스트
	  @GetMapping(value="food/find_vue.do",produces = "text/plain;charset=utf-8")
	   public String find_vue(int page,String ss)
	   {
		   int curpage=page;
		   Map map=new HashMap();
		   int rowSize=5;
		   int start=(rowSize*curpage)-(rowSize-1); // rownum = 1
		   // MySql => 0    limit ?,?  => JPA => 0, 갯수
		   int end=(rowSize*curpage);
		   map.put("start", start);
		   map.put("end", end);
		   map.put("address", ss);
		   List<FoodVO> list=dao.foodFindData(map);
		   int totalpage=dao.foodFindTotalpage(ss);
		   //JSON => Spring-Boot => return list => 자동으로 JSON변경 
		   JSONArray arr=new JSONArray(); //[]
		   int i=0;
		   for(FoodVO vo:list)
		   {
			   JSONObject obj=new JSONObject();
			   obj.put("no", vo.getF_no()); // link => 상세보기 
			   obj.put("title", vo.getF_title());
			   obj.put("poster", vo.getF_poster());
			   if(i==0)
			   {
				   obj.put("curpage", curpage);
				   obj.put("totalpage", totalpage);
			   }
			   arr.add(obj); // 배열에 추가 [{},{},{},{}....]
			   i++;
		   }
		   System.out.println(arr.toJSONString());
		   return arr.toJSONString();
	   }
	  
	  //음식 클릭 후 상세
	  @GetMapping(value="food/detail_vue.do",produces ="text/plain;charset=utf-8")
	   public String food_detail(int no)
	   {
		   // 오라클에 읽기 => JSON변경 => 자바와 자바스크립트 매칭 
		   Map map=new HashMap();
		   map.put("no", no);
		   map.put("table_name","food");
		   FoodVO vo=dao.foodDetailData(map);
		 
		   JSONObject obj=new JSONObject();
		   obj.put("no", vo.getF_no());//obj.put("no", 1); {no:1 ,name:''....
		   obj.put("poster", vo.getF_poster());
		   obj.put("title", vo.getF_title());
		   obj.put("address", vo.getF_address());
		   obj.put("tel", vo.getF_tel());
		   obj.put("kind", vo.getF_kind());
		   obj.put("time", vo.getF_time());
		   obj.put("menu", vo.getF_menu());
		   return obj.toJSONString();
	   }
		/*
		 * @GetMapping("food/food_find.do") public String find_result(int gu,Model
		 * model) { String[] guList_1 = { "전체", "강서구", "양천구", "구로구", "마포구", "영등포구",
		 * "금천구", "은평구", "서대문구", "동작구", "관악구", "종로구", "중구", "용산구", "서초구", "강북구", "성북구",
		 * "도봉구", "동대문구", "성동구", "강남구", "노원구", "중랑구", "광진구", "송파구", "강동구" }; //DB 연동
		 * List<FoodVO> list=dao.foodFindData(guList_1[gu]); model.addAttribute("list",
		 * list); model.addAttribute("gu", guList_1[gu]); return
		 * "food/food_find_result/ajax"; }
		 */
}
