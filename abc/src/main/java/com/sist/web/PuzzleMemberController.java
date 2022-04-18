package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;

import oracle.jdbc.proxy.annotation.Post;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.memberDAO;
import java.util.*;
@Controller
public class PuzzleMemberController {
	@Autowired
	private memberDAO member;
	@Autowired
	private PmemberDAO dao;
	//회원가입승인거절
	@GetMapping("/puzzle/{cl}/puzzlemember/pmember.do")
	public String puzzle_member(HttpSession session,@PathVariable int cl,Model m)
	{
		int grade =member.ismember(session, cl);
		
		System.out.println(cl);
		List<PmemberVO> plist = dao.pmember(cl);
	
		m.addAttribute("plist",plist);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		return "puzzlemember/pmember";
	}
	@GetMapping("/puzzle/{cl}/puzzlemember/update_ok.do")
	public String puzzle_update(HttpSession session,@PathVariable int cl,Model m,String id)
	{
		int grade =member.ismember(session, cl);
		Map map=new HashMap();
		map.put("cl_no",cl);
		map.put("id",id);
		dao.member_rankup(map);
		
		
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		return "redirect:/puzzle/"+cl+"/puzzlemember/pmember.do";
	}
	@GetMapping("/puzzle/{cl}/puzzlemember/up_ok.do")
	public String puzzle_rankup(HttpSession session,@PathVariable int cl,Model m,String id)
	{
		int grade =member.ismember(session, cl);
		Map map=new HashMap();
		map.put("cl_no",cl);
		map.put("id",id);
		dao.member_doublerankup(map);
		
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		return "redirect:/puzzle/"+cl+"/puzzlemember/pmember1.do";
	}
	@GetMapping("/puzzle/{cl}/puzzlemember/down_ok.do")
	public String puzzle_rankdown(HttpSession session,@PathVariable int cl,Model m,String id)
	{
		int grade =member.ismember(session, cl);
		Map map=new HashMap();
		map.put("cl_no",cl);
		map.put("id",id);
		dao.member_rankdown(map);
		
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		return "redirect:/puzzle/"+cl+"/puzzlemember/pmember1.do";
	}
	@GetMapping("/puzzle/{cl}/puzzlemember/delete_ok.do")
	public String puzzle_delete(HttpSession session,@PathVariable int cl,Model m,String id)
	{
		int grade =member.ismember(session, cl);
		Map map=new HashMap();
		map.put("cl_no",cl);
		map.put("id",id);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		dao.member_refuse(map);
		return "redirect:/puzzle/"+cl+"/puzzlemember/pmember.do";
	}
	
	@GetMapping("/puzzle/{cl}/puzzlemember/delete1_ok.do")
	public String puzzle_delete1(HttpSession session,@PathVariable int cl,Model m,String id)
	{
		int grade =member.ismember(session, cl);
		Map map=new HashMap();
		map.put("cl_no",cl);
		map.put("id",id);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		dao.member_refuse(map);
		return "redirect:/puzzle/"+cl+"/puzzlemember/pmember1.do";
	}
	
	//회원승진강등탈퇴
	@GetMapping("/puzzle/{cl}/puzzlemember/pmember1.do")
	public String puzzle_member1(HttpSession session,@PathVariable int cl,Model m)
	{
		int grade =dao.membergrade(cl);
		List<PmemberVO> ulist = dao.all_pmember(cl);
	
		m.addAttribute("ulist",ulist); 
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		return "puzzlemember/pmember2";
	}
	
}
