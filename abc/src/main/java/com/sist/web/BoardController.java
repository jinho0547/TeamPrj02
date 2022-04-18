package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.dao.BoardDAO;
import com.sist.dao.memberDAO;
import com.sist.vo.ReplyVO;

@Controller
@RequestMapping("/puzzle/{cl}/board/")
public class BoardController {
	
	@Autowired
	private BoardDAO board;
	
	@Autowired
	private memberDAO dao;
	
	@GetMapping("list.do")
	public String boardList(HttpSession session,@PathVariable int cl,Model m, @RequestParam(defaultValue ="1", required = true) int p,@RequestParam(defaultValue ="", required = true)String t,@RequestParam(defaultValue ="b_title", required = true) String q) {
		
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		m.addAttribute("list",board.getList(p,q,t,cl));
		m.addAttribute("total",board.getCount(q,t,cl));
		m.addAttribute("q",q);
		m.addAttribute("t",t);
		return "board/list";
	}
	
	@GetMapping("write.do")
	public String write(@PathVariable int cl,HttpSession session,Model m) {
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		return "board/write";
	}
	@PostMapping("dowrite.do")
	public String dowrite(String b_title, String b_content,@PathVariable int cl,HttpSession session, Model m) {
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		board.dowrite(b_title,b_content,session,cl);
		return "redirect:/puzzle/"+cl+"/board/list.do";
	}
	
	@GetMapping("detail.do")
	@Transactional(rollbackFor = Exception.class)
	public String detail(int id, Model m,@PathVariable int cl,HttpSession session) {
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		board.uphit(id);
		m.addAttribute("detail",board.detail(id));
		m.addAttribute("vo",new ReplyVO());
		return "board/detail";
	}
	
	@GetMapping("update.do")
	public String update(Model m,int id,@PathVariable int cl,HttpSession session) {
		m.addAttribute("detail",board.detail(id));
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		return "board/update";
	}
	
	@PostMapping("doupdate.do")
	public String update(Model m,int b_no, String b_title, String b_content,@PathVariable int cl,HttpSession session) {
		board.update(b_title, b_content, b_no);
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		return "redirect:/puzzle/"+cl+"/board/detail.do?id="+b_no;
	}
	
	@GetMapping("delete.do")
	public String delete(@PathVariable int cl, int id) {
		board.delete(id);
		
		return "redirect:/puzzle/"+cl+"/board/list.do";
	}
	

}
