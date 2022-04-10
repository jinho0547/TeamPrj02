package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PuzzleMainContorller {
	@GetMapping("puzzle/main.do")
	public String puzzle_main() {
		return "puzzle";
	}
}
