package com.sist.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

/*
B_NO	NUMBER
B_TITLE	VARCHAR2(50 BYTE)
B_CONTENT	VARCHAR2(1000 BYTE)
B_REGDATE	DATE
B_HIT	NUMBER
B_FILENAME	VARCHAR2(1000 BYTE)
B_FILESIZE	VARCHAR2(1000 BYTE)
B_FILECOUNT	NUMBER
TYPE	NUMBER
ID	VARCHAR2(20 BYTE)
CL_NO	NUMBER 
 */

@Setter
@Getter
public class GalleryBoardVO {
	private int b_no, b_hit, type, cl_no, b_filecount;
	private Date b_regdate;
	private String b_title, b_content, b_filename, b_filesize, dbday, id;
	private List<MultipartFile> files;
}
