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
		
		Calendar cal= new GregorianCalendar();
		cal.clear(Calendar.MILLISECOND);
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		int today = Integer.parseInt(date.format(cal.getTime()).toString());

		AlarmDAO adao = new AlarmDAO();
		
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		

		List <AlarmBean>alarmlist = adao.getAlarms(id);//세션 아이디 넣으세요.
		if(alarmlist != null){
		for(AlarmBean alarmbean:alarmlist){
		 String array[] = alarmbean.getA_end_day().split("/");  
		 String day = array[0]+array[1]+array[2];
		 
		 int c_end_day = Integer.parseInt(day);
		 if(today>=c_end_day){
			adao.deleteAlarm(alarmbean.getA_num());
			}  
		 }//end for
		}//end if
		// TODO Auto-generated method stub
		return null;		
	}

}
