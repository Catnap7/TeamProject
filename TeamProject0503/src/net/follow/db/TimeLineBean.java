package net.follow.db;

import java.sql.Timestamp;

public class TimeLineBean {
	private String kind;
	private String fo_following;
	private String title;
	private String engtitle;
	private int pic;
	private int num;
	private Timestamp date;
	private String genre;
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getEngtitle() {
		return engtitle;
	}
	public void setEngtitle(String engtitle) {
		this.engtitle = engtitle;
	}
	public int getPic() {
		return pic;
	}
	public void setPic(int pic) {
		this.pic = pic;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getFo_following() {
		return fo_following;
	}
	public void setFo_following(String fo_following) {
		this.fo_following = fo_following;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
