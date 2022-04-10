package com.sist.dao;

import com.sist.mapper.*;
import com.sist.vo.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class memberDAO {
	@Autowired
	private signupMapper mapper;

	public void memberInsert(memberVO vo) {
		mapper.memberSignUp(vo);
	}

	public int idchecking(String id) {
		int num = mapper.idchecking(id);
		return num;
	}

	public int nicChecking(String nic) {
		int num = mapper.nicChecking(nic);
		return num;
	}

	public String loginchecking(String id, String pwd) {
		String result = "";
		int count = mapper.idchecking(id);
		
		if (count == 0) {
			result = "NOID";
		} else {
			String data = mapper.loginChecking(id);
			StringTokenizer st = new StringTokenizer(data, ",");
			String db_pwd = st.nextToken();
			String nic = st.nextToken();
			if(db_pwd.equals(pwd)) {
				result=nic;
			}else {
				result="NOPWD";
			}

		}
//		System.out.println(result);
		return result;
	}
	
	
	//전화번호,이메일로 비밀번호찾기
	public String findingPwdByEmail(Map map) {
		String result="";
		result = mapper.findingPwdByEmail(map);
		if(result==null) {
			result="NOID";
			return result;
		}else {
			StringBuffer sb = new StringBuffer();
			sb.append(result);
			sb.replace(sb.length()-4, sb.length(), "****");
			result = sb.toString();
					
			return result;
		}
	}
	public String findingPwdByTel(Map map) {
		String result="";
		result = mapper.findingPwdByTel(map);
		if(result==null) {
			result="NOID";
			return result;
		}else {
			StringBuffer sb = new StringBuffer();
			sb.append(result);
			sb.replace(sb.length()-4, sb.length(), "****");
			result = sb.toString();
			
			return result;
		}
	}
	
	
	//전화번호,이메일로 아이디 찾기	
	public String findingIdByTel(Map map) {
		String result="";
		result = mapper.findingIdByTel(map);
		if(result==null) {
			result = "NOID";
			return result;
		}else {
			StringBuffer sb = new StringBuffer();
			sb.append(result);
			sb.replace(sb.length()-3, sb.length(), "***");
			result = sb.toString();
					
			return result;
		}
	}
	
	public String findingIdByEmail(Map map) {
		String result="";
		result = mapper.findingIdByEmail(map);
		if(result==null) {
			result = "NOID";
			return result;
		}else {
			StringBuffer sb = new StringBuffer();
			sb.append(result);
			sb.replace(sb.length()-3, sb.length(), "***");
			result = sb.toString();
					
			return result;
		}
	}
	
	
}
