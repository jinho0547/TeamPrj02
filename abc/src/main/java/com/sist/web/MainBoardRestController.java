package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class MainBoardRestController {
	@Autowired
	private MainBoardDAO dao;
	
	@GetMapping(value="mainboard/list_vue.do",produces = "text/plain;charset=utf-8")
	public String mainboardList_vue(String page) {
		String result="";
		try {
			if(page==null) page="1";
			int curpage=Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize=10;
			int start = (rowSize*curpage)-(rowSize-1);
			int end = rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			
			List<MainBoardVO> list = dao.mainboardListData(map);
			
			int totalPage = dao.mainboardTotalPage();
			
			JSONArray arr = new JSONArray();
			int i = 0;
			for(MainBoardVO vo:list) {
				JSONObject obj = new JSONObject();
				obj.put("b_title", vo.getB_title());
				obj.put("b_hit", vo.getB_hit());
				obj.put("id", vo.getId());
				obj.put("b_regdate", vo.getB_regdate());
				
				if(i==0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalPage);
				}
				arr.add(obj);
				i++;
						
			}
			result=arr.toJSONString();
			System.out.println(result);
		}catch(Exception e) {}
		return result;
	}
}
