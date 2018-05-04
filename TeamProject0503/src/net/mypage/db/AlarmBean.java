package net.mypage.db;

import java.sql.Date;

public class AlarmBean {
	String a_id;
	int a_num; //auto_increment
	int a_alarm_name;
	String a_end_day;
	String a_movie_name;
	
	
	public String getA_movie_name() {
		return a_movie_name;
	}
	public void setA_movie_name(String a_movie_name) {
		this.a_movie_name = a_movie_name;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public int getA_alarm_name() {
		return a_alarm_name;
	}
	public void setA_alarm_name(int a_alarm_name) {
		this.a_alarm_name = a_alarm_name;
	}
	public String getA_end_day() {
		return a_end_day;
	}
	public void setA_end_day(String a_end_day) {
		this.a_end_day = a_end_day;
	}
	
	
}
