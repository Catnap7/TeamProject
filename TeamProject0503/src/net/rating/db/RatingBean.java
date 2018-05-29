package net.rating.db;

import java.sql.Timestamp;

public class RatingBean {
	private int ra_num;
	private String ra_id;
	private int ra_rating;
	private int ra_p_num;
	private Timestamp ra_date;
	
	public int getRa_num() {
		return ra_num;
	}
	public void setRa_num(int ra_num) {
		this.ra_num = ra_num;
	}
	public String getRa_id() {
		return ra_id;
	}
	public void setRa_id(String ra_id) {
		this.ra_id = ra_id;
	}
	public int getRa_rating() {
		return ra_rating;
	}
	public void setRa_rating(int ra_rating) {
		this.ra_rating = ra_rating;
	}
	public int getRa_p_num() {
		return ra_p_num;
	}
	public void setRa_p_num(int ra_p_num) {
		this.ra_p_num = ra_p_num;
	}
	public Timestamp getRa_date() {
		return ra_date;
	}
	public void setRa_date(Timestamp ra_date) {
		this.ra_date = ra_date;
	}

}
