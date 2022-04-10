package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class memberRestController {
	@Autowired
	private memberDAO dao;
	
	@GetMapping(value="member/idcheck.do", produces = "text/plain;charset=utf-8")
	public String idchecking(String id) {
		String result="";
		int num = dao.idchecking(id);
		if(num==0) {
			result="사용 가능한 아이디입니다.";
		}
		else {
			result="이미 사용중인 아이디입니다.";
		}
		return result;
	}
	
	@GetMapping(value="member/nicCheck.do", produces = "text/plain;charset=utf-8")
	public String nicChecking(String nic) {
		String result="";
		int num = dao.nicChecking(nic);
		if(num==0) {
			result="사용 가능한 닉네임입니다.";
		}
		else {
			result="이미 사용중인 닉네임입니다.";
		}
		return result;
	}
	
	@GetMapping(value="member/log_in.do", produces = "text/plain;charset=utf-8")
	public String loginDoing(String id,String pwd,HttpSession session) {
		String result = dao.loginchecking(id, pwd);
		if(!(result.equals("NOID")&& result.equals("NOPWD"))) {
			session.setAttribute("id", id);
			session.setAttribute("nic", result);
		}
		System.out.println(result);
		return result;
	}
	@GetMapping("member/putId.do")
	public int putIdCheck(String id) {
		int result = dao.idchecking(id);
//		System.out.println(result);
		return result;
	}
	
	@GetMapping("member/tellPwdByTel.do")
	public String findingPwdByTel(String name, String id, String tel) {
		Map map = new HashMap();
		map.put("name", name);
		map.put("id", id);
		map.put("tel", tel);
		String result = dao.findingPwdByTel(map);
		return result;
	}
	
	@GetMapping("member/tellPwdByEmail.do")
	public String findingPwdByEmail(String name, String id, String email) {
		Map map = new HashMap();
		map.put("name", name);
		map.put("id", id);
		map.put("email", email);
		String result = dao.findingPwdByEmail(map);
		return result;
	}
	
	@GetMapping("member/tellIdByTel.do")
	public String findingIdByTel(String name, String tel) {
		Map map = new HashMap(); //ed
		map.put("name", name);
		map.put("tel", tel);
		String result = dao.findingIdByTel(map);
		return result;
	}
	
	@GetMapping("member/tellIdByEmail.do")
	public String findingIdByEmail(String name, String email) {
		Map map = new HashedMap();
		map.put("name", name);
		map.put("email", email);
		String result = dao.findingIdByEmail(map);
		System.out.println(result);
		return result;
	}
}
