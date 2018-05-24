package net.member.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.AlarmBean;
import net.mypage.db.AlarmDAO;

public class DeleteAlarm implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		

		
		// TODO Auto-generated method stub
		return null;		
	}

}
