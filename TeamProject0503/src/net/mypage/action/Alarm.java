package net.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.AlarmDAO;


public class Alarm implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Alarm execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");								
		AlarmDAO adao = new AlarmDAO();						
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		
		if(id==null){
			forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		List alarmlist = adao.getAlarms(id);
		
		request.setAttribute("alarmlist", alarmlist);	
		
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/alram.jsp");						
			
		return forward;
	}
	
}
