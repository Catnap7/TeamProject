package net.admin.manage.db;

import java.sql.Date;

public class AdminReviewBean {
	
	int r_num;
	String r_id;
	int r_p_num;
	int r_recommand;
	String r_content;
	int r_report;
	Date r_date;
	
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
	public String getContent() {
		return r_content;
	}
	public void setContent(String content) {
		this.r_content = content;
	}
	public int getR_report() {
		return r_report;
	}
	public void setR_report(int r_report) {
		this.r_report = r_report;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}	

}
