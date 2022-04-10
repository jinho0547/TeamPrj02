package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BoardMapper;
import com.sist.vo.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private BoardMapper board;
	
	public List<BoardVO> getList(int p) {
		int start = ((p-1)*10)+1;
		int end=p*10;
		return board.getList(start,end);
	};
	public BoardVO detail(int id) {
		return board.getDetail(id);
	}
	public int getCount() {
		return board.getCount();
	}
	public int dowrite(String b_title, String b_content) {
		return board.dowrite(b_title,b_content);
	}
	public void update(String b_title, String b_content,int b_no) {
		board.update(b_title,b_content,b_no);
	}

}
