package com.sist.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.vo.*;
import com.sist.dao.*;

@Controller

public class CategoryController {
	@Autowired
	private clubDAO dao;
	
	@GetMapping("club/club.do")
	public String club_main() {
		return "club/club";
	}
	
	@GetMapping("main/category.do")
	public String category_main() {
		return "category";
	}
	@GetMapping("club/club_Insert.do")
	public String club_ok_main(clubVO vo,HttpSession session) {
		String id=(String)session.getAttribute("id");
		
		dao.transaction(id, vo);
		
		return "redirect:../main/main.do";
	}
	
	
	
	@GetMapping("category/cooklist.do")
	public String cooklist_main() {
		return "category/cooklist";
	}
	@GetMapping("category/triplist.do")
	public String triplist_main() {
		return "category/triplist";
	}
	@GetMapping("category/sportslist.do")
	public String sports_main() {
		return "category/sportslist";
	}
	@GetMapping("category/humanitylist.do")
	public String humanitylist_main() {
		return "category/humanitylist";
	}
	@GetMapping("category/worklist.do")
	public String worklist_main() {
		return "category/worklist";
	}
	@GetMapping("category/languagelist.do")
	public String languagelist_main() {
		return "category/languagelist";
	}
	@GetMapping("category/culturelist.do")
	public String culturelist_main() {
		return "category/culturelist";
	}
	@GetMapping("category/musiclist.do")
	public String musiclist_main() {
		return "category/musiclist";
	}
	@GetMapping("category/makelist.do")
	public String makelist_main() {
		return "category/makelist";
	}
	@GetMapping("category/dancelist.do")
	public String dancelist_main() {
		return "category/dancelist";
	}
	@GetMapping("category/volunteerlist.do")
	public String volunteerlist_main() {
		return "category/volunteerlist";
	}
	@GetMapping("category/friendlist.do")
	public String friendlist_main() {
		return "category/friendlist";
	}
	@GetMapping("category/carlist.do")
	public String carlist_main() {
		return "category/carlist";
	}
	@GetMapping("category/photolist.do")
	public String photolist_main() {
		return "category/photolist";
	}
	@GetMapping("category/gamelist.do")
	public String gamelist_main() {
		return "category/gamelist";
	}
	@GetMapping("category/petlist.do")
	public String petlist_main() {
		return "category/petlist";
	}
	
	
}
