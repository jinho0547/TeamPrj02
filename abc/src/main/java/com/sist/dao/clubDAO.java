package com.sist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.*;

import com.sist.vo.clubVO;
import com.sist.vo.memberVO;
import com.sist.vo.clubgradeVO;
import com.sist.vo.clubpuzzleVO;

@Repository
public class clubDAO {
	@Autowired
	private clubMapper mapper;
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void transaction(String id,clubVO vo) {
		mapper.clubInsert(vo);
		int cl_no=mapper.clubmax();
		Map map=new HashMap ();
		map.put("id", id);
		map.put("cl_no",cl_no);
		map.put("g_msg", "");
		mapper.gradeInsert(map);
		
	}

	
	public clubVO clubMainData(int cl_no)
	   {
		   return mapper.clubMainData(cl_no);
	   }
	
	public List<clubgradeVO> clubgradeMainData(Map map)
	   {
		   return mapper.clubgradeMainData(map);
	   }
	public List<clubpuzzleVO> clubpuzzleMainData()
	   {
		   return mapper.clubpuzzleMainData();
	   }
	public clubVO puzzleMainInfoData(int cl_no) {
		return mapper.puzzleMainInfoData(cl_no);
	}

}
