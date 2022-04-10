package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.BoardVO;

public interface BoardMapper {
	
	@Select("SELECT * FROM (SELECT rownum num, b.* from (select * from board where cl_no=1 AND type=1 AND b_title LIKE '%%' ORDER BY B_REGDATE DESC) b) WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> getList(@Param("start") int start, @Param("end") int end);//검색어, cl_no
	
	@Select("select count(*) from (select * from board where cl_no=1 AND type=1 AND b_title LIKE '%%' ORDER BY B_REGDATE DESC)")
	public int getCount();//cl_no 수정, 검색어
	
	@Select("select * from board where b_no=#{bno}")
	public BoardVO getDetail(int bno);

	@Insert("insert into board(b_title,b_content,id,type,cl_no) values(#{b_title}, #{b_content},'jinho',1,1)")
	public int dowrite(@Param("b_title") String b_title,@Param("b_content") String b_content); //cl_no,id 수정

	@Update("update board set b_title=#{b_title}, b_content=#{b_content} where b_no=#{b_no}")
	public void update(@Param("b_title")String b_title,@Param("b_content") String b_content,@Param("b_no") int b_no);

}
 