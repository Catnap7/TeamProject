package net.mypage.db;

import java.sql.Date;

public class CouponBean {
	private String c_id;
	private int c_num;
	private int c_name;
	private String c_end_day;
	public String getC_end_day() {
		return c_end_day;
	}
	public void setC_end_day(String c_end_day) {
		this.c_end_day = c_end_day;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getC_name() {
		return c_name;
	}
	public void setC_name(int c_name) {
		this.c_name = c_name;
	}
	
	
}
