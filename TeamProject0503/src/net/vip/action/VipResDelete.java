package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.vip.db.VipResBean;
import net.vip.db.VipResDAO;

public class VipResDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		String m_id=(String)session.getAttribute("m_id");
		if(m_id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		//세션
		
		VipResBean vipresbean=new VipResBean();
		VipResDAO vipresdao=new VipResDAO();
		
		vipresbean=vipresdao.getYourSeat(m_id);
		String vr_seat_num=vipresbean.getVr_seat_num();
		vipresdao.deleteRes(m_id, vr_seat_num);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Vip.vi");
		forward.setRedirect(true);

		
		
		return forward;
		
		
		
	}

}
