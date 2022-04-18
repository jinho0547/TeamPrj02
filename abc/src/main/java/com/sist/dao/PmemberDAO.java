package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.PmemberVO;

@Repository
public class PmemberDAO {
	@Autowired
	private PmemberMapper mapper;
	
	public List<PmemberVO> pmember(int cl_no)
	{
		return mapper.pmember(cl_no);
	}

	public void member_rankup(Map map)
	{
		
		mapper.member_rankup(map);
	}
	public void member_refuse(Map map)
	{
		mapper.member_refuse(map);
	}
	public void member_doublerankup(Map map)
	{
		mapper.member_doublerankup(map);
	}
	public void member_rankdown(Map map)
	{
		mapper.member_rankdown(map);
	}
	public List<PmemberVO> all_pmember(int cl_no)
	{
		
		return mapper.all_pmember(cl_no);
	}
	public Integer membergrade(int cl_no)
	{
		return mapper.membergrade(cl_no);
	}
	public List<PmemberVO> find_name(int cl_no)
	{
		return mapper.find_name(cl_no);
	}
}
