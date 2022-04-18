package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

/*
 * CL_RANK	NUMBER	No	0 	1	
ID	VARCHAR2(20 BYTE)	No		2	
CL_NO	NUMBER	No		3	
*/
@Getter
@Setter
public class PmemberVO {
	private int cl_rank,cl_no;
	private String id,g_msg;
}
