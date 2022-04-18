package com.sist.dao;
import com.sist.vo.*;
import com.sist.mapper.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainBoardDAO {
	@Autowired
	private MainBoardMapper mapper;
	//관리자닉
	public String getAdminNic() {
		String nic = mapper.getAdminNic();
		return nic;
	}
	
	public MainBoardVO mainboardDetailData(int b_no) {
		MainBoardVO vo = mapper.mainboardDetailData(b_no);
		return vo;
	}
	
	public List<MainBoardVO> mainboardListData(Map map){
		List<MainBoardVO>list = mapper.mainboardListData(map);
		return list;
	}
	
	public List<MainBoardVO> mainboardAdminListData(Map map){
		List<MainBoardVO>list = mapper.mainboardAdminListData(map);
		return list;
	}
	
	public void mainboardInsert(MainBoardVO vo) {
		mapper.mainboardInsert(vo);
	}
	
	
	public int mainboardTotalPage() {
		int num = mapper.mainboardTotalPage();
		return num;
	}
	
	public int mainBoardCount() {
		int num = mapper.mainBoardCount();
		return num;
	}
	
	//답변달기
	public void insert_mainboardReply(MBCommentVO vo) {
		mapper.insert_mainboardReply(vo);
	}
	//답변가져오기
	public List<MBCommentVO> getReplyData(int b_no) {
		List<MBCommentVO> list = mapper.getReplyData(b_no);
		return list;
	}
	
	//글삭제
	public void deletemainboardData(int b_no) {
		mapper.deletemainboardData(b_no);
	}
	
	//글 수정
	public void updateMainBoardData(MainBoardVO vo){
		mapper.updateMainBoardData(vo);
	}
	
	//조회수증가
	public void hitIncrement(int b_no) {
		mapper.hitIncrement(b_no);
	}
	
	//댓글 수
	public int replyNum(int b_no) {
		int num = mapper.replyNum(b_no);
		return num;
	}
	
	//내가 쓴 글
	public List<MainBoardVO> mainboardListFilterData(Map map){
		List<MainBoardVO> list = mapper.mainboardListFilterData(map);
		return list;
	}
}
