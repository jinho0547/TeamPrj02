package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Board2VO {
	private int b_no, b_hit, type, cl_no, b_filecount;
	private Date b_regdate;
	private String b_title, b_content, b_filename, b_filesize, dbday, id;
}
