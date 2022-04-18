package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainBoardController {
	@Autowired
	private MainBoardDAO dao;
	private HttpSession session;
	
	@GetMapping("mainboard/main_go.do")
	public String moveToMainBoard(HttpSession session,String page,Model model) {
		String id = (String)session.getAttribute("id");
		if(page==null)
			   page="1"; //디폴트 페이지 (사용자가 처음에 페이지를 지정 할 수 없다)
		   // 모든 데이터는 String으로 받아 볼 수 있다 => 필요시에는 데이터형 변환 
		   int curpage=Integer.parseInt(page); 
		   Map map=new HashMap();
		   int rowSize=10;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   String nic = dao.getAdminNic();
		   map.put("start", start);
		   map.put("end", end);
		   map.put("id", id);
		   map.put("nic", nic);
		   // WHERE num BETWEEN #{start} AND #{end}
		   // 실제 데이터 DAO로부터 얻어 오기
		   List<MainBoardVO> list=dao.mainboardListData(map);
		   List<MainBoardVO> listA=dao.mainboardAdminListData(map);
		   
		   // 총페이지 읽기
		   int totalpage=dao.mainboardTotalPage();
		   // 전체 갯수 읽기 
		   int count=dao.mainBoardCount();
		   count=count-((rowSize*curpage)-rowSize);
		   // 오늘 날짜 전송 (new)
//		   String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		   
		   model.addAttribute("list", list);
		   model.addAttribute("listA", listA);
		   model.addAttribute("curpage", curpage);
		   model.addAttribute("totalpage", totalpage);
		   model.addAttribute("count", count);
//		   model.addAttribute("today", today);
		   
		   
		return "mainboard/list";
	}
	@GetMapping("mainboard/insert_go.do")
	public String moveToInsert(HttpSession session,Model model) {
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		if(id==null) {
			return "../member/log_in";
		}else {
			model.addAttribute("id",id);
		return "mainboard/insert";
		}
	}
	@PostMapping(value="mainboard/mainboardInsert.do", produces = "text/plain;charset=utf-8")
	public String mainboardInsert (MainBoardVO vo) {
		System.out.println(vo.getB_content());
		System.out.println(vo.getB_title());
		System.out.println(vo.getId());
		dao.mainboardInsert(vo);
		return "redirect:../mainboard/main_go.do";
	}
	
	//답변달기
	@PostMapping(value="mainboard/mbCommentInsert.do", produces = "text/plain;charset=utf-8")
	public String insertMBComment(MBCommentVO vo , int b_no) {
		System.out.println(vo.getR_msg());
		dao.insert_mainboardReply(vo);
		return "redirect:../mainboard/detail.do?b_no="+vo.getB_no();
	}
	
	@GetMapping("mainboard/detail.do")
	public String mainboard_detail(int b_no,Model model){
		   // 처리 
			System.out.println(b_no);
		   dao.hitIncrement(b_no);
		   MainBoardVO vo=dao.mainboardDetailData(b_no);
		   List<MBCommentVO> list = dao.getReplyData(b_no);
		   
		   // 결과값 전송 
		   model.addAttribute("vo", vo);
		   model.addAttribute("list", list);
		   System.out.println(vo.getB_title());
		   System.out.println(vo.getId());
		   System.out.println(vo.getB_content());
		   System.out.println(vo.getB_no());
		   return "mainboard/detail";
	}
	
	@GetMapping("mainboard/delete.do")
	public String deleteData(int b_no) {
		dao.deletemainboardData(b_no);
		return "redirect:../mainboard/main_go.do";
	}
	@GetMapping("mainboard/update_go.do")
	public String moveToUpdate(int b_no,Model model) {
		MainBoardVO vo=dao.mainboardDetailData(b_no);
		System.out.println(vo.getB_content());
		model.addAttribute("vo",vo);
		return "mainboard/update";
	}
	
	@PostMapping("mainboard/update.do")
	public String updateData(MainBoardVO vo) {
		dao.updateMainBoardData(vo);
		return "redirect:../mainboard/detail.do?b_no="+vo.getB_no();
	}
	
	@GetMapping("mainboard/myBoard_go.do")
	public String moveToMyBoard(HttpSession session,String page,Model model) {
		String id = (String)session.getAttribute("id");
		if(page==null)
			   page="1"; //디폴트 페이지 (사용자가 처음에 페이지를 지정 할 수 없다)
		   // 모든 데이터는 String으로 받아 볼 수 있다 => 필요시에는 데이터형 변환 
		   int curpage=Integer.parseInt(page); 

		   Map map=new HashMap();
		   int rowSize=10;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   String nic = dao.getAdminNic();
		   map.put("start", start);
		   map.put("end", end);
		   map.put("id", id);
		   map.put("nic", nic);
		   // WHERE num BETWEEN #{start} AND #{end}
		   // 실제 데이터 DAO로부터 얻어 오기
		   List<MainBoardVO> list=dao.mainboardListFilterData(map);
		   List<MainBoardVO> listA=dao.mainboardAdminListData(map);
		   
		   // 총페이지 읽기
		   int totalpage=dao.mainboardTotalPage();
		   // 전체 갯수 읽기 
		   int count=dao.mainBoardCount();
		   count=count-((rowSize*curpage)-rowSize);
		   // 오늘 날짜 전송 (new)
//		   String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		   
		   model.addAttribute("list", list);
		   model.addAttribute("listA", listA);
		   model.addAttribute("curpage", curpage);
		   model.addAttribute("totalpage", totalpage);
		   model.addAttribute("count", count);
//		   model.addAttribute("today", today);
		   
		   
		return "mainboard/filter";
	}
	
	
}
