package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.BoardVO;

public interface BoardMapper {
	
//	@Select("SELECT * FROM (SELECT rownum num, b.* from (select * from board where cl_no=#{cl_no} AND type=1 AND ${q} LIKE '%${t}%' ORDER BY B_REGDATE DESC) b) WHERE num BETWEEN #{start} AND #{end}")
	@Select("SELECT * FROM (SELECT rownum num, j.* FROM (select * from board b LEFT JOIN (SELECT count(*) replycnt,B_NO  FROM reply GROUP BY b_no) r ON b.B_NO=r.B_NO where b.cl_no=#{cl_no} AND type=1 AND b.${q} LIKE '%${t}%' ORDER BY b.B_REGDATE DESC) j) WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> getList(@Param("start") int start, @Param("end") int end,@Param("q") String q,@Param("t") String t,@Param("cl_no")int cl_no);
	
	@Select("select count(*) from (select * from board where cl_no=#{cl_no} AND type=1 AND ${q} LIKE '%${t}%' ORDER BY B_REGDATE DESC)")
	public int getCount(@Param("q")String q,@Param("t") String t,@Param("cl_no")int cl_no);//cl_no 수정,
	
	@Select("select * from board where b_no=#{bno}")
	public BoardVO getDetail(int bno);

	@Insert("insert into board(b_title,b_content,id,type,cl_no) values(#{b_title}, #{b_content},#{id},1,#{cl_no})")
	public int dowrite(@Param("b_title") String b_title,@Param("b_content") String b_content,@Param("cl_no")int cl_no,@Param("id") String id); //cl_no,id 수정

	@Update("update board set b_title=#{b_title}, b_content=#{b_content} where b_no=#{b_no}")
	public void update(@Param("b_title")String b_title,@Param("b_content") String b_content,@Param("b_no") int b_no);

	@Update("UPDATE board set b_hit=b_hit+1 WHERE b_no=#{b_no}")
	public void uphit(int b_no);

	@Delete("delete from board where b_no=#{b_no}")
	public void delete(int b_no);

}
 