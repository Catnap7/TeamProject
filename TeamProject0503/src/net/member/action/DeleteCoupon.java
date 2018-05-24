package net.member.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.CouponBean;
import net.mypage.db.CouponDAO;

public class DeleteCoupon implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Calendar cal= new GregorianCalendar();
		cal.clear(Calendar.MILLISECOND);
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		int today = Integer.parseInt(date.format(cal.getTime()).toString());

	
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		

		
		
		
		// TODO Auto-generated method stub
		return null;
	}

}
