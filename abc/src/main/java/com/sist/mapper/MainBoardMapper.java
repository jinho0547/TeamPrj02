package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

/*
 *  private int b_no,b_hit,type;
	private String b_title,b_content,id;
	private Date b_regdate;
 */
//공지사항QnA게시판 글목록
public interface MainBoardMapper {
	//일반게시
	/*
	 * SELECT b_no,b_hit,type,b_title,b_content,id,TO_DATE(b_regdate,'YYYY-MM-DD') as b_regdate,num,r_num 
FROM (SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate,rownum AS num,r_num
FROM (SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate,(SELECT COUNT(*) FROM reply WHERE reply.b_no=board.b_no) r_num
FROM board WHERE type=9 AND id NOT LIKE 'admin' ORDER BY b_no DESC))
WHERE num BETWEEN 1 AND 5;
	 */
	@Select("SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate,num,r_num "
			+ "FROM (SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate,rownum AS num,r_num "
			+ "FROM (SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate,(SELECT COUNT(*) FROM reply WHERE reply.b_no=board.b_no) r_num "
			+ "FROM board WHERE type=9 AND id NOT LIKE 'admin' ORDER BY b_no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<MainBoardVO> mainboardListData(Map map);
	//일반게시 내가쓴글
//	@Select("SELECT b_no,b_hit,type,b_title,b_content,id,"
//			+ "TO_DATE(b_regdate,'YYYY-MM-DD') as b_regdate,rownum "
//			+ "FROM (SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate "
//			+ "FROM board WHERE type=9 AND id LIKE #{id} ORDER BY b_no DESC)) "
//			+ "WHERE rownum BETWEEN #{start} AND #{end}")
	@Select("SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate,num,r_num "
			+ "FROM (SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate,rownum AS num,r_num "
			+ "FROM (SELECT b_no,b_hit,type,b_title,b_content,id,b_regdate,(SELECT COUNT(*) FROM reply WHERE reply.b_no=board.b_no) r_num "
			+ "FROM board WHERE type=9 AND id LIKE #{id} ORDER BY b_no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<MainBoardVO> mainboardListFilterData(Map map);
	//관리자
	@Select("SELECT b_no,b_hit,type,b_title,b_content,id,"
			+ "b_regdate "
			+ "FROM board WHERE type=9 AND id LIKE 'admin' ORDER BY b_no DESC")
	public List<MainBoardVO> mainboardAdminListData(Map map);
	
	//댓글 수
	@Select("SELECT COUNT(*) FROM reply WHERE b_no=#{b_no}")
	public int replyNum(int b_no);
	
	//상세페이지
	@Select("SELECT b_no,b_hit,type,b_title,b_content,id,"
			+ "TO_DATE(b_regdate,'YYYY-MM-DD') as b_regdate "
			+ "FROM board WHERE type=9 AND b_no=#{b_no}")
	public MainBoardVO mainboardDetailData(int b_no);
	
	//관리자닉네임
	@Select("SELECT nic FROM member WHERE id LIKE 'admin'")
	public String getAdminNic();
	
	//총페이지
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM board WHERE type=9")
	public int mainboardTotalPage();
	
	@Select("SELECT COUNT(*) FROM board WHERE type=9")
	public int mainBoardCount();
	
	//글쓰기
//	@SelectKey(keyProperty = "b_no",resultType = int.class,before = true,
//			statement = "SELECT NVL(MAX(b_no)+1,1) as b_no FROM board")
	@Insert("INSERT INTO board(b_no,b_hit,type,b_title,b_content,id,b_regdate,cl_no) "
			+ "VALUES(b_no_seq.nextval,0,9,#{b_title},#{b_content},#{id},SYSDATE,1)")
	public void mainboardInsert(MainBoardVO vo);
	
	//글삭제
	@Delete("DELETE FROM board WHERE b_no=#{b_no}")
	public void deletemainboardData(int b_no);
	
	//글 수정
	@Update("UPDATE board SET b_title=#{b_title},b_content=#{b_content} WHERE b_no=#{b_no}")
	public void updateMainBoardData(MainBoardVO vo);
	
	//답변쓰기
//	@SelectKey(keyProperty = "r_no",resultType = int.class,before = true,
//			statement = "SELECT NVL(MAX(r_no)+1,1) as r_no FROM reply")
	@Insert("INSERT INTO reply(r_no,r_msg,r_regdate,b_no,id) VALUES(r_no_seq.nextval,#{r_msg},SYSDATE,#{b_no},'admin')")
	public void insert_mainboardReply(MBCommentVO vo);
	
	//답변불러오기
	@Select("SELECT r_no,r_msg,r_regdate,b_no,id FROM reply WHERE b_no=#{b_no}")
	public List<MBCommentVO> getReplyData(int b_no);
	
	//조회수증가
	@Update("UPDATE Board SET "
			  +"b_hit=b_hit+1 "
			  +"WHERE b_no=#{b_no}")
	public void hitIncrement(int b_no);
	
}
