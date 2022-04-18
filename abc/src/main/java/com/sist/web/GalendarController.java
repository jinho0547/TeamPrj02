package com.sist.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.GalendarDAO;
import com.sist.dao.memberDAO;
import com.sist.vo.GalendarPuzzleVO;
import com.sist.vo.KeywordVO;

@Controller
@RequestMapping("/puzzle/{cl}/galendar/")
public class GalendarController {
	@Autowired
	private GalendarDAO dao;
	@Autowired
	private memberDAO member;

	@GetMapping("list.do")
	public String galendar_list(Model model, HttpServletRequest request, @PathVariable int cl, HttpSession session) {
		int grade = member.ismember(session, cl);
		model.addAttribute("grade", grade);
		model.addAttribute("cl", cl);

		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");
		String strDay = request.getParameter("day");


		List<GalendarPuzzleVO> pList = dao.galendarListData(cl);

		for (GalendarPuzzleVO vo : pList) {
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-M-d");
			String puzzle = sdf2.format(vo.getP_date());

			StringTokenizer st = new StringTokenizer(puzzle, "-");
			String sy = st.nextToken();
			String sm = st.nextToken();
			String sd = st.nextToken();

			System.out.println("모임 날짜" + sd);

			String ti = vo.getP_title();
			if (ti.length() > 8) {
				ti = ti.substring(0, 8) + "...";
			}
			vo.setP_title(ti);
			vo.setDbday(sd);
		}

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");

		String today = sdf.format(date);

		StringTokenizer st = new StringTokenizer(today, "-");
		String sy = st.nextToken();
		String sm = st.nextToken();
		String sd = st.nextToken();

		// default설정
		if (strYear == null)
			strYear = sy;
		if (strMonth == null)
			strMonth = sm;
		if (strDay == null)
			strDay = sd;
		System.out.println("오늘날짜=" + strDay);

		// 정수형 변환
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(sd);

		// 1월 1일부터 ~ 전년도까지의 총합
		int total = (year - 1) * 365 + (year - 1) / 4 - (year - 1) / 100 + (year - 1) / 400;
		// 1월 1일 - 전달까지의 합
		int[] lastday = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
			lastday[1] = 29; // 윤년이면
		} else {
			lastday[1] = 28; // 윤년이 아니면
		}

		for (int i = 0; i < month - 1; i++) {
			total += lastday[i];
		}
		total++;
		int week = total % 7;

		String[] strWeek = { "일", "월", "화", "수", "목", "금", "토" };
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("week", week);
		model.addAttribute("lastday", lastday[month - 1]);
		model.addAttribute("strWeek", strWeek);
		model.addAttribute("pList", pList);
		model.addAttribute("strDay", strDay);

		return "galendar/list";
	}

	@GetMapping("puzzle.do")
	public String galendar_puzzle(int p_no, int cl_no, Model model, @PathVariable int cl, HttpSession session) {

		int grade = member.ismember(session, cl);
		model.addAttribute("grade", grade);
		model.addAttribute("cl", cl);

		Map map = new HashMap();
		map.put("p_no", p_no);
		map.put("cl_no", cl);

		// 상세페이지
		GalendarPuzzleVO pvo = dao.galendarDetailData(map);

		// 날짜 변환
		Date date = pvo.getP_date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		String dbdate = sdf.format(date);

		// 지역 통계
		List<String> wl = dao.galendarLoc(cl);
		List<KeywordVO> list = new ArrayList<KeywordVO>();
		for (String s : wl) {
			Map map2 = new HashMap();
			map2.put("cl_no", cl);
			map2.put("p_loc", s);
			int count = dao.galendarCount(map2);

			KeywordVO kvo = new KeywordVO();
			kvo.setWord(s);
			kvo.setCount(count);

			list.add(kvo);
		}

		Map map3 = new HashMap();
		map3.put("p_no", p_no);
		map3.put("p_head", pvo.getP_head());

		// 모집 총 인원수
		int puzzlecount = dao.galendarPuzzleCount(map3);

		model.addAttribute("pvo", pvo);
		model.addAttribute("dbdate", dbdate);
		model.addAttribute("list", list);
		model.addAttribute("puzzlecount", puzzlecount);

		return "galendar/puzzle/ajax";
	}

	@PostMapping(value = "puzzle_insert.do")
	@ResponseBody
	public String galendat_puzzle_insert(Model model, int p_no, HttpSession session, @PathVariable int cl) {

		int grade = member.ismember(session, cl);
		model.addAttribute("grade", grade);
		model.addAttribute("cl", cl);

		String result = "";

		String id = (String) session.getAttribute("id");

		Map map = new HashMap();
		map.put("id", id);
		map.put("p_no", p_no);

		int idCheck = dao.galendarPuzzleId(map);
		if (idCheck != 0) {
			// 모임에 가입된 상태
			result = "ON";
			System.out.println(result);
		} else {
			// 모임에 가입 안된 상태
			result = "OFF";
			System.out.println(result);
			dao.galendarPuzzleInsert(map);
		}

		return result;
	}
}
