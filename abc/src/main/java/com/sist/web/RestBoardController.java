package com.sist.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.ReplyDAO;
import com.sist.dao.memberDAO;
import com.sist.vo.ReplyVO;

@RestController
@RequestMapping("/puzzle/{cl}/board/")
public class RestBoardController {
	
	@Autowired
	private ReplyDAO reply;
	@Autowired
	private memberDAO member;
	
	@PostMapping("replyList.do")
	public List<ReplyVO> getReplyList(@PathVariable int cl,HttpSession session,int bno){
		member.ismember(session, cl);
		return reply.getList(bno);
	}
	
	@PostMapping("writeReply.do")
	public int write(@RequestBody ReplyVO vo,@PathVariable int cl,HttpSession session) {
		member.ismember(session, cl);
		int b_no = vo.getB_no();
		String id = vo.getId();
		String r_msg = vo.getR_msg();
		System.out.println(vo);
		int result = reply.write(b_no, id, r_msg);
		return result;
	}
	@PostMapping("updateReply.do")
	public int update(@RequestBody ReplyVO vo,@PathVariable int cl,HttpSession session) {
		member.ismember(session, cl);
		int r_no = vo.getR_no();
		String r_msg = vo.getR_msg();
		int result = reply.update(r_no, r_msg);
		return result;
	}
	
	@GetMapping("deleteReply.do")
	public int delete(int r_no,@PathVariable int cl,HttpSession session) {
		member.ismember(session, cl);
		int result = reply.delete(r_no);
		return result;
	}

}
