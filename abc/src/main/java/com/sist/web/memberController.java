package com.sist.web;
import com.sist.dao.*;

import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class memberController {
	@Autowired
	private memberDAO dao;
	
	@GetMapping(value="member/memberInsert.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String memberInsert(memberVO vo) {	
//		System.out.println(vo.getAddr1());
//		System.out.println(vo.getAddr2());
//		System.out.println(vo.getAdmin());
//		System.out.println(vo.getBirth());
//		System.out.println(vo.getEmail());
//		System.out.println(vo.getId());
//		System.out.println(vo.getName());
//		System.out.println(vo.getNic());
//		System.out.println(vo.getPost());
//		System.out.println(vo.getPwd());
//		System.out.println(vo.getSex());
//		System.out.println(vo.getTel());
		dao.memberInsert(vo);
		return "redirect:log_in.do";
		/*
		 * 다른폴더에 이동하려면 ../main/main.do 이런식으로 앞에 붙이기!!!
		 */
	}
	
	@GetMapping("member/sign_up.do")
	public String signupmoving() {
		return "member/sign_up";
	}
	
	@GetMapping("member/log_in_move.do")
	public String loginmoving() {
		return "member/log_in";
	}
	
	@GetMapping("member/log_in_ok.do")
	public String loginokMoving() {
		return "redirect:../main/main.do";
	}
	
	@GetMapping("member/log_out.do")
	public String logoutDoing(HttpSession session) {
		session.invalidate();
		return "redirect:../main/main.do";
	}
	
	@GetMapping("member/movefind_pwd.do")
	public String goFindPwd() {
		return "member/find_pwd";
	}
	
	@GetMapping("member/movefind_id.do")
	public String goFindId() {
		return "member/find_id";
	}
}
