package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.GalleryBoardMapper;
import com.sist.vo.Board2VO;
import com.sist.vo.GalleryBoardVO;

@Repository
public class GalleryBoardDAO {
	@Autowired
	private GalleryBoardMapper mapper;

	public List<GalleryBoardVO> galleryBoardListData(Map map) {
		return mapper.galleryBoardListData(map);
	}

	public int galleryBoardRowCount() {
		return mapper.galleryBoardRowCount();
	}

	public int galleryBoardTotalPage() {
		return (int) (Math.ceil(mapper.galleryBoardRowCount() / 15.0));
	}

	public GalleryBoardVO galleryBoardDetailData(int b_no) {
		mapper.hitIncrement(b_no);

		return mapper.galleryBoardDetailData(b_no);
	}

	public GalleryBoardVO galleryBoardDetailData2(int b_no) {
		return mapper.galleryBoardDetailData(b_no);
	}

	public void galleryBoardInsert(GalleryBoardVO vo) {
		mapper.galleryBoardInsert(vo);
	}

	public void galleryBoardUpdate1(GalleryBoardVO vo) {
		mapper.galleryBoardUpdate1(vo);
	}

	public void galleryBoardUpdate2(GalleryBoardVO vo) {
		mapper.galleryBoardUpdate2(vo);
	}

	public void galleryBoardDelete(int b_no) {
		mapper.galleryBoardDelete(b_no);
	}

	public List<GalleryBoardVO> gallerySearchData(Map map) {
		return mapper.gallerySearchData(map);
	}

	public void galleryFilenameDelete(Map map) {
		mapper.galleryFilenameDelete(map);
	}

	public void galleryFilesizeDelete(Map map) {
		mapper.galleryFilesizeDelete(map);
	}

	public List<Board2VO> galleryMainListData(int cl_no) {
		return mapper.galleryMainListData(cl_no);
	}

	public List<Board2VO> BoardMainListData(int cl_no) {
		return mapper.BoardMainListData(cl_no);
	}

}
