package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

/*P_NO	NUMBER	No	
P_COST	VARCHAR2(100 BYTE)	Yes	
P_HEAD	NUMBER(30,0)	No	
P_LOC	VARCHAR2(100 BYTE)	No	
P_DATE	DATE	No	
P_TIME	VARCHAR2(20 BYTE)	No	
P_TITLE	VARCHAR2(50 BYTE)	No	
P_CONTENT	VARCHAR2(300 BYTE)	No	
ID	VARCHAR2(20 BYTE)	No	
CL_NO	NUMBER	No	
*/
@Setter
@Getter
public class CreateVO {
	private int p_no,cl_no,p_head;
	private String p_cost,p_loc,p_dloc,p_time,p_title,p_content,id,db_day;
	private Date p_date;
}
