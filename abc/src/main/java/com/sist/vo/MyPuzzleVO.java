package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MyPuzzleVO {
	private int p_no, cl_no, p_head, p_no_1;
	private String p_cost, p_loc, p_dloc, p_time, p_title, p_content, id, db_day;
	private Date p_date;
}
