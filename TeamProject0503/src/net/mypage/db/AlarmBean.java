package net.mypage.db;

import java.sql.Date;

public class AlarmBean {
	String a_id;
	int a_num; //auto_increment
	int a_alarm_name;
	String a_end_day;
	String a_movie_name;
	String a_start_day;
	int a_check;
	String a_follower;
	
	
	
	public String getA_start_day() {
		return a_start_day;
	}
	public void setA_start_day(String a_start_day) {
		this.a_start_day = a_start_day;
	}
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
	public int getA_check() {
		return a_check;
	}
	public void setA_check(int a_check) {
		this.a_check = a_check;
	}
	public String getA_follower() {
		return a_follower;
	}
	public void setA_follower(String a_follower) {
		this.a_follower = a_follower;
	}
	
	
	
}
