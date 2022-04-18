package com.sist.service;

import java.util.List;

import com.sist.vo.Board2VO;
import com.sist.vo.GalendarPuzzleVO;
import com.sist.vo.clubVO;

public interface PuzzleMainService {
	// 동아리 상세 정보 출력
	public clubVO puzzleMainInfoData(int cl_no);

	// 동아리 게시판 출력
	public List<Board2VO> BoardMainListData(int cl_no);

	// 동아리 모임 출력
	public List<GalendarPuzzleVO> galendarMainListData(int cl_no);

	// 동아리 이미지 출력
	public List<Board2VO> galleryMainListData(int cl_no);
	
	// 동아리 인원 카운팅
	public int puzzleMainHeadCount(int cl_no);
}
