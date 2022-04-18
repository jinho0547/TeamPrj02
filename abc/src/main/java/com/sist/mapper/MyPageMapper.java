package com.sist.mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MyPuzzleVO;
import com.sist.vo.clubVO;
import com.sist.vo.memberVO;
/*
 *  private String id;
	private String pwd;
	private String nic;
	private String name;
	private String addr1;
	private String addr2;
	private String email;
	private String tel;
	private String sex;
	private String post;
	private int admin;
	private String birth;
 */
public interface MyPageMapper {
	
	//개인정보 읽기
	@Select("SELECT * FROM member WHERE id=#{id}")
	public memberVO readMyInfo(String id);
	
	//찜한 모임 출력
	@Select("SELECT cl_poster,cl_head,cl_loc,c_no " + 
			"FROM club c WHERE c.cl_no=(SELECT w.cl_no "
			+ "FROM wish w WHERE w.id=#{id} ORDER BY w_no ASC)")
	public List<clubVO> wishClubListData(String id);
	
	//내가 가입한 (만든) 모임
	@Select("SELECT * FROM (SELECT cl_name,cl_head,cl_loc,cl_poster " 
			+ "FROM club c JOIN grade g ON c.cl_no = g.cl_no WHERE g.ID = #{id})")
	public List<clubVO> myClubListData(String id);
	
	//카테고리 입력
	@Update("UPDATE member SET category=#{category} WHERE id=#{id}")
	public void InsertFavCategory(Map map);

	
	//카테고리 읽기
	@Select("SELECT category FROM member WHERE id=#{id}")
	public String readMyFavCategory(String id);
	
	//내정보 수정
	@Update("UPDATE member SET pwd=#{pwd},nic=#{nic},name=#{name},"
			+ "addr1=#{addr1},addr2=#{addr2},email=#{email},tel=#{tel},"
			+ "sex=#{sex},post=#{post},admin=#{admin},birth=#{birth} "
			+ "WHERE id=#{id}")
	public void myInfoUpdate(Map map);
	
	// 마이페이지 내가 가입한 모임 리스트 출력
	@Select("SELECT * FROM (SELECT p_no,id "
			+ "FROM puzzlejoin WHERE id in(SELECT id from puzzlejoin WHERE id=#{id})) v JOIN puzzle " 
			+ "ON v.p_no=puzzle.p_no ORDER BY p_date asc")
	public List<MyPuzzleVO> myPuzzleListData(String id);
}
