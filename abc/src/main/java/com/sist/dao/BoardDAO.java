package com.sist.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BoardMapper;
import com.sist.vo.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private BoardMapper board;
	
	public List<BoardVO> getList(int p, String q, String t,int cl) {
		int start = ((p-1)*10)+1;
		int end=p*10;
		return board.getList(start,end,q,t,cl);
	};
	public int getCount(String q, String t,int cl) {
		return board.getCount(q,t,cl);
	}
	public BoardVO detail(int id) {
		return board.getDetail(id);
	}
	public int dowrite(String b_title, String b_content,HttpSession session,int cl) {
		String id=(String)session.getAttribute("id");
		return board.dowrite(b_title,b_content,cl,id);
	}
	public void update(String b_title, String b_content,int b_no) {
		board.update(b_title,b_content,b_no);
	}
	public void uphit(int b_no) {
		board.uphit(b_no);
	}
	public void delete(int id) {
		board.delete(id);
	}

}
