package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.vip.db.VipBean;
import net.vip.db.VipDAO;
import net.vip.db.VipResBean;
import net.vip.db.VipResDAO;

public class VipResult implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("VipResult execute");
		request.setCharacterEncoding("UTF8");
		
		VipDAO vipdao = new VipDAO();
		VipBean vipbean=vipdao.getVipMovie(); 
		
		
		//VipReservation
		
		String v_num=String.valueOf(vipbean.getV_num());
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
		String vr_seat_num=request.getParameter("seat");
		
		System.out.println(v_num);
		System.out.println(id);
		System.out.println(vr_seat_num);
		
		
		VipResBean vipresbean = new VipResBean();
		vipresbean.setV_num(v_num);
		vipresbean.setVr_id(id);
		vipresbean.setVr_seat_num(vr_seat_num);

		
		VipResDAO vipresdao= new VipResDAO();
		vipresdao.insertVipRes(vipresbean);

		//insertVipSeatTaken 
		vipresdao.insertVipSeatTaken(v_num, vr_seat_num);
		
		
		
		//이동
		ActionForward forward=new ActionForward();
							
		forward.setRedirect(false);
		forward.setPath("./vip/vip_reservation_result.jsp");		
						
		return forward;
		
	}

}
