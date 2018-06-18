package net.pay.db;

import java.sql.Date;

public class PayBean {
	
	int p_num;
	String p_id;
	Date p_start_day; //startday 지워졌는지 db 다시 확인할것.
	Date p_end_day;
	String p_auto;
	int p_charge;
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public Date getP_start_day() {
		return p_start_day;
	}
	public void setP_start_day(Date p_start_day) {
		this.p_start_day = p_start_day;
	}
	public Date getP_end_day() {
		return p_end_day;
	}
	public void setP_end_day(Date p_end_day) {
		this.p_end_day = p_end_day;
	}
	public String getP_auto() {
		return p_auto;
	}
	public void setP_auto(String p_auto) {
		this.p_auto = p_auto;
	}
	public int getP_charge() {
		return p_charge;
	}
	public void setP_charge(int p_charge) {
		this.p_charge = p_charge;
	}

}
