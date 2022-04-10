package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.ReplyDAO;
import com.sist.vo.ReplyVO;

@RestController
@RequestMapping("/board/")
public class RestBoardController {
	
	@Autowired
	private ReplyDAO reply;
	
	@PostMapping("replyList.do")
	public List<ReplyVO> getReplyList(int bno){
		return reply.getList(bno);
	}
	
	@PostMapping("writeReply.do")
	public int write(@RequestBody ReplyVO vo) {
		int b_no = vo.getB_no();
		String id = vo.getId();
		String r_msg = vo.getR_msg();
		System.out.println(vo);
		int result = reply.write(b_no, id, r_msg);
		return result;
	}
	@PostMapping("updateReply.do")
	public int update(int r_no,String r_msg) {
		int result = reply.update(r_no, r_msg);
		return result;
	}
	
	@GetMapping("deleteReply.do")
	public int delete(int r_no) {
		int result = reply.delete(r_no);
		return result;
	}

}
