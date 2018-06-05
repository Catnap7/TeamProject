package net.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.AlarmDAO;

public class RealtimeAlarm  implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RealtimeAlarm execute");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		AlarmDAO adao = new AlarmDAO();				  
		int alarm_num=adao.getCount(id);
		session.setAttribute("alarm_num", ""+alarm_num+"");		
		return null;
	}

}
