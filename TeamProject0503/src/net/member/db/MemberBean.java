package net.member.db;

import java.sql.Date;

public class MemberBean {
	private int m_id_num1;
	private int m_id_num2;
	private String m_id;
	private String m_pass;
	private String m_salt;
	private String m_name;
	private int m_grade;
	private Date m_reg_date;
	private int m_pay;
	private int m_pic;
	private Date m_end_day;
	
	public Date getM_end_day() {
		return m_end_day;
	}
	public void setM_end_day(Date m_end_day) {
		this.m_end_day = m_end_day;
	}
	public int getM_pic() {
		return m_pic;
	}
	public void setM_pic(int m_pic) {
		this.m_pic = m_pic;
	}
	public int getM_pay() {
		return m_pay;
	}
	public void setM_pay(int m_pay) {
		this.m_pay = m_pay;
	}
	public int getM_id_num1() {
		return m_id_num1;
	}
	public void setM_id_num1(int m_id_num1) {
		this.m_id_num1 = m_id_num1;
	}
	public int getM_id_num2() {
		return m_id_num2;
	}
	public void setM_id_num2(int m_id_num2) {
		this.m_id_num2 = m_id_num2;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public Date getM_reg_date() {
		return m_reg_date;
	}
	public void setM_reg_date(Date m_reg_date) {
		this.m_reg_date = m_reg_date;
	}
	public String getM_salt() {
		return m_salt;
	}
	public void setM_salt(String m_salt) {
		this.m_salt = m_salt;
	}
	
}
