package com.sist.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

@Controller
public class MainController {
	@Autowired
	private clubDAO dao;
	@Autowired
	private MainMainDAO dao2;
	
	private HttpSession session;
	
	@GetMapping("main/main.do")
	public String main_main(HttpSession session,Model model,HttpServletRequest request) {
		int[] com=new int[16];
		List<clubVO> list=new ArrayList<clubVO>();
		Map map=new HashMap();
		String id1 =(String)session.getAttribute("id");
		map.put("id1", id1);
		List<clubgradeVO> list2=dao.clubgradeMainData(map);
		List<clubpuzzleVO> list3=dao.clubpuzzleMainData();
		getRand(com);
		for(int i=0;i<16;i++)
		{
			clubVO vo=dao.clubMainData(com[i]);
			list.add(vo);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2); 
		model.addAttribute("list3", list3);
		
		
		clubVO vo_1=dao2.mainMovingClub1();
		clubVO vo_2=dao2.mainMovingClub2();
		clubVO vo_3=dao2.mainMovingClub3();
		clubVO vo_4=dao2.mainMovingClub4();
		clubVO vo_5=dao2.mainMovingClub5();

		String id = (String)session.getAttribute("id");
		
		
		if(id==null) {
			
			model.addAttribute("vo1",vo_1);
			model.addAttribute("vo2",vo_2);
			model.addAttribute("vo3",vo_3);
			model.addAttribute("vo4",vo_4);
			model.addAttribute("vo5",vo_5);
			System.out.println(vo_1.getCl_no());
			
		}
		
		else {
			if(dao2.countMyCategory(id)==0) {
			
			model.addAttribute("vo1",vo_1);
			model.addAttribute("vo2",vo_2);
			model.addAttribute("vo3",vo_3);
			model.addAttribute("vo4",vo_4);
			model.addAttribute("vo5",vo_5);
			System.out.println(vo_1.getCl_no());
			}
			else if(dao2.countMyCategory(id)==1) {
				String category = dao2.callMyCategory(id);
				category.replaceAll(" ", "");
				System.out.println(category);
				StringTokenizer st = new StringTokenizer(category,",");
				clubVO vo1 = dao2.recommendClub1(st.nextToken());
				clubVO vo2 = dao2.recommendClub1(st.nextToken());
				clubVO vo3 = dao2.recommendClub1(st.nextToken());
				clubVO vo4 = dao2.recommendClub1(st.nextToken());
				clubVO vo5 = dao2.recommendClub1(st.nextToken());
				System.out.println(vo1);
				System.out.println(vo2);
				System.out.println(vo3);
				System.out.println(vo4);
				System.out.println(vo5);
				
				model.addAttribute("vo1",vo1);
				model.addAttribute("vo2",vo2);
				model.addAttribute("vo3",vo3);
				model.addAttribute("vo4",vo4);
				model.addAttribute("vo5",vo5);
			}
			
		}
		
		return "main";
	}


	public void getRand(int[] com) {
		// TODO Auto-generated method stub
		int su=0;
		boolean bCheck=false;
		for(int i=0;i<16;i++)
		{
			bCheck=true;
			while(bCheck)
			{
				su=(int)(Math.random()*90)+1;
				bCheck=false;
				for(int j=0;j<i;j++)
				{
					if(com[j]==su)
					{
						bCheck=true;
						break;
					}
				}
			}
			com[i]=su;
		}
		
	}
	
	
}
