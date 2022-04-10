package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ReplyMapper;
import com.sist.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private ReplyMapper reply;
	
	public List<ReplyVO> getList(int bno){
		return reply.getList(bno);
	}
	
	public int write(int bno, String id,String content) {
		int result=reply.write(bno,id,content);
		return result;
	}
	
	public int delete(int rno) {
		int result=reply.delete(rno);
		return result;
	}
	
	public int update(int rno, String content) {
		int result=reply.update(rno, content);
		return result;
	}

}
