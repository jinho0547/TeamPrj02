package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.MyPageDAO;
import com.sist.vo.MyPuzzleVO;
import com.sist.vo.clubVO;
import com.sist.vo.memberVO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageDAO dao;

	private HttpSession session;

	public void commonData(Model model, String id) {
		List<clubVO> list = dao.myClubListData(id);
		model.addAttribute("list", list);
	}

	// 마이페이지 이동
	@GetMapping("mypage/mypage_go.do")
	public String moveToMyPage(HttpSession session, Model model) {
		this.session = session;
		String id = (String) session.getAttribute("id");
		List<clubVO> list = dao.myClubListData(id);
		System.out.println(list);
		String category = dao.readMyFavCategory(id);
		commonData(model, id);
		model.addAttribute("category", category);
//		memberVO vo = dao.readMyInfo(id);
//		List<ClubVO> list = dao.myClubListData(id);
//		model.addAttribute("nic",vo.getNic());
//		model.addAttribute("list",list);
		return "mypage";
	}

	// 관심카테고리 이동
	@GetMapping("mypage/mycategory_go.do")
	public String moveToMyCategory(Model model, HttpSession session) {
		this.session = session;
		String id = (String) session.getAttribute("id");
		List<clubVO> list = dao.myClubListData(id);
		String category = dao.readMyFavCategory(id);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
//		List<ClubVO> vo = dao.myClubListData(id);
//		model.addAttribute("vo",vo);
//		String[]list = {"요리 / 제조","아웃도어 / 여행","운동 / 스포츠","인문학 / 책 / 글","업무 / 직무",
//				"외국 / 언어","문화 / 공연 / 축제","음악 / 악기","공예 / 만들기","댄스 / 무용","봉사활동",
//				"사교 / 인맥","차 / 오토바이","사진 / 영상","게임 / 오락","반려동물"};
//		model.addAttribute("list",list);
		return "mypage/mycategory";
	}
	// 관심 카테고리 저장

	// 찜한동아리리스트 이동
	@GetMapping("mypage/wishclub_go.do")
	public String moveToWishClub(Model model, HttpSession session) {
		this.session = session;
		String id = (String) session.getAttribute("id");
		commonData(model, id);

		List<MyPuzzleVO> list2 = dao.myPuzzleListData(id);
		for (MyPuzzleVO vo : list2) {
			String title = vo.getP_title();
			if (title.length() > 7) {
				title = title.substring(0, 7) + "...";
			}
			vo.setP_title(title);

			String loc = vo.getP_dloc();
			if (loc.length() > 5) {
				loc = loc.substring(0, 5) + "...";
			}
			vo.setP_dloc(loc);
		}

		model.addAttribute("list2", list2);

		return "mypage/wish";
	}

	// 내 정보 수정 이동
	@GetMapping("mypage/fixMyInfo_go.do")
	public String moveToFixMyInfo(HttpSession session, Model model) {
		this.session = session;
		String id = (String) session.getAttribute("id");
		memberVO vo = dao.readMyInfo(id);
		commonData(model, id);

		String category = dao.readMyFavCategory(id);

		model.addAttribute("category", category);
		/*
		 * obj.put("id", vo.getId()); obj.put("pwd", vo.getPwd()); obj.put("nic",
		 * vo.getNic()); obj.put("name",vo.getName()); obj.put("addr1", vo.getAddr1());
		 * obj.put("addr2", vo.getAddr2()); obj.put("email", vo.getEmail());
		 * obj.put("tel", vo.getTel()); obj.put("sex", vo.getSex()); obj.put("post",
		 * vo.getPost()); obj.put("birth", vo.getBirth()); obj.put("category",
		 * vo.getCategory()); obj.put("admin", vo.getAdmin());
		 */
//		model.addAttribute("id",vo.getId());
//		model.addAttribute("pwd", vo.getPwd());
//		model.addAttribute("nic", vo.getNic());
//		model.addAttribute("name",vo.getName());
//		model.addAttribute("addr1", vo.getAddr1());
//		model.addAttribute("addr2", vo.getAddr2());
//		model.addAttribute("email", vo.getEmail());
//		model.addAttribute("tel", vo.getTel());
//		model.addAttribute("sex", vo.getSex());
//		model.addAttribute("post", vo.getPost());
//		model.addAttribute("birth", vo.getBirth());
//		model.addAttribute("category", vo.getCategory());
//		model.addAttribute("admin", vo.getAdmin());
		model.addAttribute("vo", vo);
		return "mypage/fix_myinfo";
	}

	// 개인정보 읽기 이동
	@GetMapping("mypage/myInfo.do")
	public String readMyInfo(String id, Model model) {
		memberVO vo = dao.readMyInfo(id);
		commonData(model, id);
		model.addAttribute("vo", vo);
		return "mypage/fix_myinfo";
	}

	// 수정개인정보 서브밋
	@PostMapping("mypage/myInfoUpdate.do")
	public String UpdateMyInfo(memberVO vo, Model model, HttpSession session) {
		System.out.println("ddddddd");
		System.out.println("rrr" + vo.getId());
		String id = (String) session.getAttribute("id");
		commonData(model, id);
		Map map = new HashMap();
		map.put("id", vo.getId());
		map.put("pwd", vo.getPwd());
		map.put("nic", vo.getNic());
		map.put("name", vo.getName());
		map.put("addr1", vo.getAddr1());
		map.put("addr2", vo.getAddr2());
		map.put("email", vo.getEmail());
		map.put("tel", vo.getTel());
		map.put("sex", vo.getSex());
		map.put("post", vo.getPost());
		map.put("birth", vo.getBirth());
		map.put("category", vo.getCategory());
		map.put("admin", vo.getAdmin());
		dao.changeMyInfo(map);
		return "redirect:/mypage/myInfo.do?id=" + vo.getId();
	}

//	//관심 카테고리 저장
//	@GetMapping(value="mypage/favCategory.do",produces = "text/plain;charset=utf-8")
//	public String myFavCategoryList(HttpSession session,String category) {
//		this.session=session;
//		String id = (String)session.getAttribute("id");
//		dao.InsertFavCategory(category,id);
//		return "redirect:../mypage/mycategory_go.do";		
//	}

//	//찜한 모임
//	@GetMapping("mypage/wishClub.do")
//	public String myWishClub(String id,Model model){
//		List<ClubVO> vo = dao.myWishClubData(id);
//		model.addAttribute("vo",vo);
//		return "mypage/wish";
//	}
}
