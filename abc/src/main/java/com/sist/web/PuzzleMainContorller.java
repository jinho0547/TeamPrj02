package com.sist.web;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.memberDAO;
import com.sist.service.PuzzleMainServiceImpl;
import com.sist.vo.Board2VO;
import com.sist.vo.GalendarPuzzleVO;
import com.sist.vo.clubVO;

@Controller
public class PuzzleMainContorller {

	@Autowired
	memberDAO dao;
	@Autowired
	private PuzzleMainServiceImpl service;

	@GetMapping("puzzle/{cl}/main.do")
	public String puzzle_main(Model m, HttpSession session, @PathVariable int cl) {
		int grade = dao.ismember(session, cl);
		// 동아리에 대한 정보 출력
		clubVO cvo = service.puzzleMainInfoData(cl);
		// 모임 리스트 출력
		List<GalendarPuzzleVO> glist = service.galendarMainListData(cl);
		for (GalendarPuzzleVO vo : glist) {
			String title = vo.getP_title();
			if (title.length() > 15) {
				title = title.substring(0, 15) + "...";
			}
			vo.setP_title(title);
		}
		// 게시판 리스트 출력
		List<Board2VO> blist = service.BoardMainListData(cl);
		for (Board2VO vo : blist) {
			String title = vo.getB_title();
			if (title.length() > 20) {
				title = title.substring(0, 20) + "...";
			}
			vo.setB_title(title);
		}

		// 이미지 리스트 출력
		List<Board2VO> gblist = service.galleryMainListData(cl);

		List<String> fList = new ArrayList<String>(); // 파일명
		List<String> iList = new ArrayList<String>(); // 리얼패스에 저장된 이미지 출력
		for (Board2VO vo : gblist) {
			String ss = vo.getB_filename();
			if (vo.getB_filecount() != 0) {

				StringTokenizer st = new StringTokenizer(ss, ",");
				while (st.hasMoreTokens()) {
					String fn = st.nextToken();
					fList.add(fn);
					iList.add("/resources/uploadFileImages/" + fn);
					System.out.println("iList=" + iList);
				}
			}
		}
		
		int count=service.puzzleMainHeadCount(cl);

		m.addAttribute("grade", grade);
		m.addAttribute("cl", cl);
		m.addAttribute("cvo", cvo);
		m.addAttribute("glist", glist);
		m.addAttribute("blist", blist);
		m.addAttribute("iList", iList);
		m.addAttribute("count", count);

		return "puzzle";
	}

	@GetMapping("/puzzle/{cl}/join.do")
	public String join(Model m, HttpSession session ,@PathVariable int cl) {
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		return "board/join";
	}
	
	@PostMapping("/puzzle/{cl}/dojoin.do")
	public String dojoin(Model m, HttpSession session ,@PathVariable int cl, String g_msg) {
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		dao.clubJoin(session,cl,g_msg);
		return "redirect:/puzzle/"+cl+"/main.do";
	}
	
	@GetMapping("/puzzle/{cl}/canceljoin.do")
	public String canceljoin(Model m, HttpSession session ,@PathVariable int cl) {
		int grade =dao.ismember(session, cl);
		m.addAttribute("grade",grade);
		m.addAttribute("cl",cl);
		
		dao.cancelJoin(session,cl);
		return "redirect:/puzzle/"+cl+"/main.do";
	}
	
	@GetMapping("/puzzle/{cl}/chat/chat.do")
	public String puzzleChat(Model m, HttpSession session, @PathVariable int cl) {
		int grade = dao.ismember(session, cl);
		String id=(String)session.getAttribute("id");
		
		m.addAttribute("grade", grade);
		m.addAttribute("cl", cl);
		m.addAttribute("id", id);

		return "chat/chat";
	}

}
