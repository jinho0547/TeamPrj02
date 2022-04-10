package com.sist.vo;

import java.util.Date;

public class ReplyVO {
	private int r_no;
	private String r_msg;
	private Date r_regDate;
	private int b_no;
	private String id;
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_msg() {
		return r_msg;
	}
	public void setR_msg(String r_msg) {
		this.r_msg = r_msg;
	}
	public Date getR_regDate() {
		return r_regDate;
	}
	public void setR_regDate(Date r_regDate) {
		this.r_regDate = r_regDate;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ReplyVO [r_no=" + r_no + ", r_msg=" + r_msg + ", r_regDate=" + r_regDate + ", b_no=" + b_no + ", id="
				+ id + "]";
	}
	
	
}
