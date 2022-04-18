package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/*
P_NO	NUMBER
P_COST	VARCHAR2(100 BYTE)
P_HEAD	NUMBER(30,0)
P_LOC	VARCHAR2(100 BYTE)
P_DATE	DATE
P_TIME	VARCHAR2(20 BYTE)
P_TITLE	VARCHAR2(50 BYTE)
P_CONTENT	VARCHAR2(300 BYTE)
ID	VARCHAR2(20 BYTE)
CL_NO	NUMBER
 */

@Setter
@Getter
public class GalendarPuzzleVO {
	private int p_no, p_head, cl_no;
	private Date p_date;
	private String p_cost, p_loc, p_time, p_title, p_content, id, dbday, p_dloc;
}
