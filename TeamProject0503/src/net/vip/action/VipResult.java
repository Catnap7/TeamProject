package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.vip.db.VipBean;
import net.vip.db.VipDAO;
import net.vip.db.VipResBean;
import net.vip.db.VipResDAO;

public class VipResult implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO memberdao=new MemberDAO();
		MemberBean memberbean=new MemberBean();
		
		VipDAO vipdao = new VipDAO();
		VipBean vipbean=vipdao.getVipMovie(); 

		String v_num=String.valueOf(vipbean.getV_num());
		
		String vr_seat_num=request.getParameter("seat");
		
		
		
		VipResBean vipresbean = new VipResBean();
		vipresbean.setV_num(v_num);
		vipresbean.setVr_id(id);
		vipresbean.setVr_seat_num(vr_seat_num);

		
		VipResDAO vipresdao= new VipResDAO();
		vipresdao.insertVipRes(vipresbean);

		vipresdao.insertVipSeatTaken(v_num, vr_seat_num);
		String selectedSeat=vipresbean.getVr_seat_num();
		
		request.setAttribute("memberbean", memberbean);
		request.setAttribute("vipresbean", vipresbean);
		request.setAttribute("vipbean", vipbean);
		request.setAttribute("vr_seat_num", vr_seat_num);
		request.setAttribute("selectedSeat", selectedSeat);
		
		//이동
		ActionForward forward=new ActionForward();
							
		forward.setRedirect(false);
		forward.setPath("./vip/vip_reservation_result.jsp");		
						
		return forward;
		
	}

}
