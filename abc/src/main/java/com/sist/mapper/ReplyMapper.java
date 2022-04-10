package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ReplyVO;

public interface ReplyMapper {

	@Select("SELECT * FROM reply where b_no=#{bno} ORDER BY r_regdate DESC")
	List<ReplyVO> getList(int bno);

	@Insert("insert into reply(b_no, id, r_msg) values(#{bno},#{id},#{content})")
	int write(@Param("bno") int bno, @Param("id") String id,@Param("content") String content);
	
	@Delete("delete from reply where r_no=#{rno}")
	int delete(int rno);
	
	@Update("update reply set r_msg=#{content} where r_no=#{rno}")
	int update(@Param("rno")int rno,@Param("content") String content);

}
