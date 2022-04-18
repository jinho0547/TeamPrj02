package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface CreateMapper {
	/* @Insert("INSERT INTO spring_replyBoard(no,name,subject,content,pwd,"
		  +"group_id,group_step,group_tab,root) VALUES("
		  +"sr_no_seq.nextval,#{name},#{subject},#{content},"
		  +"#{pwd},#{group_id},#{group_step},"
		  +"#{group_tab},#{root})")
   public void replyBoardReplyInsert(ReplyBoardVO vo);*/
	/*P_NO	NUMBER	No	
	P_COST	VARCHAR2(100 BYTE)	Yes	
	P_HEAD	NUMBER(30,0)	No	
	P_LOC	VARCHAR2(100 BYTE)	No	
	P_DATE	DATE	No	
	P_TIME	VARCHAR2(20 BYTE)	No	
	P_TITLE	VARCHAR2(50 BYTE)	No	
	P_CONTENT	VARCHAR2(300 BYTE)	No	
	ID	VARCHAR2(20 BYTE)	No	
	CL_NO	NUMBER	No	
	*/
	@Insert("INSERT INTO puzzle(p_no,p_title,p_content,p_cost,p_loc,p_dloc,p_date,p_time,p_head,id,cl_no) VALUES("
			+ "p_no_seq.nextval,#{p_title},#{p_content},#{p_cost},#{p_loc},#{p_dloc},TO_DATE(#{db_day},'yyyy-MM-dd'),#{p_time},#{p_head},#{id},#{cl_no})")
	public void puzzle_create(CreateVO vo);
	

}
