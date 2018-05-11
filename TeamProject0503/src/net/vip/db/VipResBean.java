package net.vip.db;

public class VipResBean {
	
	String vr_id;
	String vr_seat_num;
	String v_num;
	
	String v_seatNum;
	String v_seatSelected;
	
	
	//VipReservation
	public String getVr_id() {
		return vr_id;
	}
	public void setVr_id(String vr_id) {
		this.vr_id = vr_id;
	}
	public String getVr_seat_num() {
		return vr_seat_num;
	}
	public void setVr_seat_num(String vr_seat_num) {
		this.vr_seat_num = vr_seat_num;
	}
	public String getV_num() {
		return v_num;
	}
	public void setV_num(String v_num) {
		this.v_num = v_num;
	}
	
	
	
	
	//VipSeatTaken
	public String getV_seatNum() {
		return v_seatNum;
	}
	public void setV_seatNum(String v_seatNum) {
		this.v_seatNum = v_seatNum;
	}
	public String getV_seatSelected() {
		return v_seatSelected;
	}
	public void setV_seatSelected(String v_seatSelected) {
		this.v_seatSelected = v_seatSelected;
	}
	

	

	
}
