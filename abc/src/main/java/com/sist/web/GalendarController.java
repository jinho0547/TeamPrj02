package com.sist.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GalendarController {
	@GetMapping("galendar/list.do")
	public String galendar_list(Model model, HttpServletRequest request) {
		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");

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

		return "galendar/list";
	}
}
