package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
/*
 * F_NO	NUMBER
F_TITLE	VARCHAR2(100 BYTE)
F_POSTER	VARCHAR2(200 BYTE)
F_ADDRESS	VARCHAR2(100 BYTE)
F_KIND	VARCHAR2(50 BYTE)
F_TEL	VARCHAR2(30 BYTE)
F_MENU	VARCHAR2(4000 BYTE)
F_TIME	VARCHAR2(100 BYTE)
*/
public class FoodVO {
	private int f_no;
	private String f_title,f_poster,f_address,f_kind,f_tel,f_menu,f_time;
}
