package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.Board2VO;
import com.sist.vo.GalleryBoardVO;

public interface GalleryBoardMapper {
	// 목록 출력 - 페이징
	@Select("SELECT b_no,id,b_title,b_content,TO_CHAR(b_regdate,'YYYY-MM-DD') as dbday,b_hit,type,num "
			+ "FROM (SELECT b_no,id,b_title,b_content,b_regdate,b_hit,type,rownum as num "
			+ 		  "FROM (SELECT /*+ INDEX_DESC(board b_bno_pk)*/b_no,id,b_title,b_content,b_regdate,b_hit,type "
			+ 				  "FROM board "
			+ 				 "WHERE cl_no=#{cl_no} AND type=2)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<GalleryBoardVO> galleryBoardListData(Map map);
	
	// 총페이지 
	@Select("SELECT COUNT(*) FROM board WHERE type=2")
	public int galleryBoardRowCount();
	
	// 상세보기
	@Update("UPDATE board SET b_hit=b_hit+1 WHERE b_no=#{b_no}")
	public void hitIncrement(int b_no);
	
	@Select("SELECT b_no,b_title,b_content,TO_CHAR(b_regdate,'YYYY-MM-DD') as dbday,id,b_hit,b_filename,b_filesize,b_filecount "
			+ "FROM board "
			+"WHERE b_no=#{b_no}")
	public GalleryBoardVO galleryBoardDetailData(int b_no);
	
	// 글 생성하기
	@Insert("INSERT INTO board VALUES "
			+ "(b_no_seq.nextval,#{b_title},#{b_content},SYSDATE,0,#{b_filename},#{b_filesize},#{b_filecount},2,#{id},#{cl_no})")
	public void galleryBoardInsert(GalleryBoardVO vo);
	
	// 글 수정하기
	@Update("UPDATE board SET b_title=#{b_title},b_content=#{b_content},b_regdate=SYSDATE,b_filename=#{b_filename},b_filesize=#{b_filesize},b_filecount=#{b_filecount} "
			+ "WHERE b_no=#{b_no}")
	public void galleryBoardUpdate1(GalleryBoardVO vo);
	
	@Update("UPDATE board SET b_title=#{b_title},b_content=#{b_content},b_regdate=SYSDATE "
			+ "WHERE b_no=#{b_no}")
	public void galleryBoardUpdate2(GalleryBoardVO vo);
	
	// 글 삭제하기
	@Delete("DELETE FROM board WHERE b_no=#{b_no}")
	public void galleryBoardDelete(int b_no);
	
	// 글 검색하기 - 동적쿼리
	@Select({"<script>"
			+ "SELECT b_no,id,b_title,b_content,TO_CHAR(b_regdate,'YYYY-MM-DD') as dbday,b_hit "
			+ "FROM (SELECT b_no,id,b_title,b_content,b_regdate,b_hit "
					+ "FROM board "
					+ "WHERE type=2) "
			+ "WHERE "
				+"<trim prefixOverrides=\"OR\">"
					+"<foreach collection=\"fsArr\" item=\"fs\">"
						+"<trim prefix=\"OR\">"
							+"<choose>"
								+"<when test=\"fs=='N'.toString()\">"
								+"id LIKE '%'||#{ss}||'%'"
								+"</when>"
								+"<when test=\"fs=='S'.toString()\">"
								+"b_title LIKE '%'||#{ss}||'%'"
								+"</when>"
								+"<when test=\"fs=='C'.toString()\">"
								+"b_content LIKE '%'||#{ss}||'%'"
								+"</when>"
							+"</choose>"
						+"</trim>"
					+"</foreach>"
				+"</trim>"
			+"</script>"})
	public List<GalleryBoardVO> gallerySearchData(Map map);
	
	// 파일 삭제한거 update
	@Update("UPDATE board SET b_filename=#{b_filename},b_filecount=b_filecount-1 "
			+ "WHERE b_no=#{b_no}")
	public void galleryFilenameDelete(Map map);
	
	@Update("UPDATE board SET b_filesize=#{b_filesize} "
			+ "WHERE b_no=#{b_no}")
	public void galleryFilesizeDelete(Map map);
	
	@Select("SELECT /*+INDEX_DESC(board B_BNO_PK)*/ * FROM board WHERE type=2 AND cl_no=#{cl_no} AND rownum<=5")
	public List<Board2VO> galleryMainListData(int cl_no);
	
	@Select("SELECT /*+INDEX_DESC(board B_BNO_PK)*/ * FROM board WHERE type=1 AND cl_no=#{cl_no} AND rownum<=6")
	public List<Board2VO> BoardMainListData(int cl_no);
}
