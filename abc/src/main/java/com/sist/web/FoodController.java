package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FoodController {
	@Autowired
	private FoodDAO dao;
	
@GetMapping("food/food_find.do")
public String food_find()
{
	   return "food/food_find";
}

}

