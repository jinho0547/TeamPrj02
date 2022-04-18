package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.GalendarMapper;
import com.sist.vo.GalendarPuzzleVO;

@Repository
public class GalendarDAO {
	@Autowired
	private GalendarMapper mapper;

	public List<GalendarPuzzleVO> galendarListData(int cl_no) {
		return mapper.galendarListData(cl_no);
	}

	public GalendarPuzzleVO galendarDetailData(Map map) {
		return mapper.galendarDetailData(map);
	}

	public int galendarCount(Map map) {
		return mapper.galendarCount(map);
	}

	public List<String> galendarLoc(int cl_no) {
		return mapper.galendarLoc(cl_no);
	}

	public int galendarPuzzleCount(Map map) {
		return mapper.galendarPuzzleCount(map);
	}

	public void galendarPuzzleInsert(Map map) {
		mapper.galendarPuzzleInsert(map);
	}

	public int galendarPuzzleId(Map map) {
		return mapper.galendarPuzzleId(map);
	}

	public List<GalendarPuzzleVO> galendarMainListData(int cl_no) {
		return mapper.galendarMainListData(cl_no);
	}
}
