package com.sist.web;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class MyPageRestController {
	@Autowired
	private MyPageDAO dao;
	
	private HttpSession session;
	
	//
//	@GetMapping("mypage/mypage_go_vue.do")
//	public String mypageStarting(HttpSession session) {
//		this.session=session;
//		JSONObject obj=new JSONObject();
//		String id = (String)session.getAttribute("id");
//		System.out.println(id);
//		memberVO vo = dao.readMyInfo(id);
////		obj.put("nic", vo.getNic());
////		System.out.println(vo.getNic());
////		List<ClubVO> list = dao.myClubListData(id);
////		model.addAttribute("list",list);
////		System.out.println(obj.toJSONString());
//		return obj.toJSONString();
//	}
//	
//	@GetMapping(value="mypage/go_fix_myinfo_vue.do",produces = "text/plain;charset=utf-8")
//	public String movingToFixMyInfo(String id) {
////		this.session=session;
//		String result = "";
//		JSONObject obj=new JSONObject();
////		String id = (String)session.getAttribute("id");
//		System.out.println(id);
//		memberVO vo = dao.readMyInfo(id);
//		obj.put("id", vo.getId());
//		obj.put("pwd", vo.getPwd());
//		obj.put("nic", vo.getNic());
//		obj.put("name",vo.getName());
//		obj.put("addr1", vo.getAddr1());
//		obj.put("addr2", vo.getAddr2());
//		obj.put("email", vo.getEmail());
//		obj.put("tel", vo.getTel());
//		obj.put("sex", vo.getSex());
//		obj.put("post", vo.getPost());
//		obj.put("birth", vo.getBirth());
//		obj.put("category", vo.getCategory());
//		obj.put("admin", vo.getAdmin());
//		result=obj.toJSONString();
//		System.out.println(result);
//		
//		return result;
//	}
	@GetMapping(value="/mypage/favCategory.do",produces = "text/plain;charset=utf-8")
	public void myFavCategoryList(HttpSession session,String category) {
		System.out.println(category);
		this.session=session;
		String id = (String)session.getAttribute("id");
		Map map = new HashMap();
		map.put("category", category);
		map.put("id", id);
		dao.InsertFavCategory(map);		
	}
	
	//관심 카테고리 저장
//	@GetMapping(value="mypage/favCategory_vue.do",produces = "text/plain;charset=utf-8")
//	public String myFavCategoryList(HttpSession session, String category) {
//		String id = (String)session.getAttribute("id");
//		dao.InsertFavCategory(category);
//		return "redirect:../mypage/mycategory";
//		
//	}
}
