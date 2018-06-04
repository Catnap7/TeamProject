package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.AlarmDAO;

public class CheckAlarm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CheckAlarm execute()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session= request.getSession();
		String ro_id=(String)session.getAttribute("m_id");
				
		if(ro_id==null){
			ActionForward forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		AlarmDAO adao = new AlarmDAO();
		adao.checkAlarm(ro_id);
		return null;
	}

}
