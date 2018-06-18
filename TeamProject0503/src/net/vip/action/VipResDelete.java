package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.vip.db.VipResBean;
import net.vip.db.VipResDAO;

public class VipResDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("VipResDelete execute()");
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		//세션
		HttpSession session =request.getSession();
		String m_id=(String)session.getAttribute("m_id");
		
		VipResBean vipresbean=new VipResBean();
		VipResDAO vipresdao=new VipResDAO();
		
		vipresbean=vipresdao.getYourSeat(m_id);
		String vr_seat_num=vipresbean.getVr_seat_num();
		vipresdao.deleteRes(m_id, vr_seat_num);
		
		System.out.println(m_id);
		System.out.println(vr_seat_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./Vip.vi");

		
		
		return forward;
		
		
		
	}

}
