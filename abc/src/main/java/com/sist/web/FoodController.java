package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class FoodController {
	@Autowired
	private FoodDAO dao;
	@Autowired
	private memberDAO member;
	
@GetMapping("/puzzle/{cl}/food/food_find.do")
public String food_find(HttpSession session,@PathVariable int cl,Model m)
{
	int grade =member.ismember(session, cl);
	m.addAttribute("grade",grade);
	m.addAttribute("cl",cl);
	
	   return "food/food_find";
}

}

