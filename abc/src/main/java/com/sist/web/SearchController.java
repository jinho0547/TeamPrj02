package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.sist.dao.*;


import com.sist.vo.clubVO;

@Controller

public class SearchController {
	@Autowired
	private searchDAO dao;
	@GetMapping("search/search_find.do")
	  public String search_find(String page,String[] fs,String ss,Model model)
	  {
		System.out.println(ss);
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		map.put("fsArr", fs);
		map.put("ss", ss);
		List<clubVO> list=dao.searchFindData(map);
		
		int totalpage=dao.searchTotalPage(ss);
		final int BLOCK=12;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  if(endPage>totalpage)
			  endPage=totalpage;
		
		
		   model.addAttribute("list", list);
		   model.addAttribute("curpage", curpage);
		   model.addAttribute("totalpage", totalpage);
		   model.addAttribute("BLOCK", BLOCK);
		   model.addAttribute("startPage", startPage);
		   model.addAttribute("endPage", endPage);
		   model.addAttribute("ss",ss);
		
		  return "search/search_find";
	  }
}
