package net.favorite.db;

import java.sql.Timestamp;

public class FavoriteBean {
	private String f_id;
	private int f_num;
	private Timestamp f_date;
	
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public Timestamp getF_date() {
		return f_date;
	}
	public void setF_date(Timestamp f_date) {
		this.f_date = f_date;
	}
	
	
	

}
