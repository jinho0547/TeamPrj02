package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.GalendarDAO;
import com.sist.dao.GalleryBoardDAO;
import com.sist.dao.clubDAO;
import com.sist.dao.memberDAO;
import com.sist.vo.Board2VO;
import com.sist.vo.GalendarPuzzleVO;
import com.sist.vo.clubVO;

@Service
public class PuzzleMainServiceImpl implements PuzzleMainService {
	@Autowired
	private clubDAO cdao;
	@Autowired
	private GalendarDAO gdao;
	@Autowired
	private GalleryBoardDAO gbdao;
	@Autowired
	private memberDAO mdao;
	
	@Override
	public clubVO puzzleMainInfoData(int cl_no) {
		// TODO Auto-generated method stub
		return cdao.puzzleMainInfoData(cl_no);
	}

	@Override
	public List<Board2VO> BoardMainListData(int cl_no) {
		// TODO Auto-generated method stub
		return gbdao.BoardMainListData(cl_no);
	}

	@Override
	public List<GalendarPuzzleVO> galendarMainListData(int cl_no) {
		// TODO Auto-generated method stub
		return gdao.galendarMainListData(cl_no);
	}

	@Override
	public List<Board2VO> galleryMainListData(int cl_no) {
		// TODO Auto-generated method stub
		return gbdao.galleryMainListData(cl_no);
	}

	@Override
	public int puzzleMainHeadCount(int cl_no) {
		// TODO Auto-generated method stub
		return mdao.puzzleMainHeadCount(cl_no);
	}

}