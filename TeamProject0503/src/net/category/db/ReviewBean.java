package net.category.db;

import java.sql.Date;

public class ReviewBean {
	
	private int r_num;
	private String r_id; // member id
	private int r_p_num; // movie num
	private int r_recommand; //	default 0 추천
	private int r_report; // 신고수
	private String r_content; // 내용
	private Date r_date;	// 댓글 단 날
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public int getR_p_num() {
		return r_p_num;
	}
	public void setR_p_num(int r_p_num) {
		this.r_p_num = r_p_num;
	}
	public int getR_recommand() {
		return r_recommand;
	}
	public void setR_recommand(int r_recommand) {
		this.r_recommand = r_recommand;
	}
	public int getR_report() {
		return r_report;
	}
	public void setR_report(int r_report) {
		this.r_report = r_report;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
}
