package net.roulette.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.CouponBean;
import net.mypage.db.CouponDAO;
import net.roulette.db.rouletteDAO;

public class RouletteWinner implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session= request.getSession();
		String ro_id=(String)session.getAttribute("m_id");
				
		if(ro_id==null){
			ActionForward forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		
		String id= request.getParameter("id");
		String c_name = request.getParameter("c_name");	
		int c_num=4;
		switch(c_name){
		case "10% 쿠폰" : c_num = 0;
		break;
		case "50% 쿠폰" : c_num = 1;
		break;
		case "100% 쿠폰" : c_num = 2;
		break;
		}
		rouletteDAO rdao = new rouletteDAO();
		rdao.downRoulette(id, c_name);
		
		Calendar cal= new GregorianCalendar();
		cal.add(Calendar.MONTH,1);
		cal.clear(Calendar.MILLISECOND);
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String c_end_day=date.format(cal.getTime()).toString();

		CouponBean cb = new CouponBean();
		cb.setC_id(id); //아이디값 넣기
		cb.setC_name(c_num); // 0 : 10%할인쿠폰, 1 : 50%할인쿠폰, 2 : 100%할인쿠폰
		cb.setC_end_day(c_end_day);

		CouponDAO cdao = new CouponDAO();
		cdao.insertCoupon(cb);
		
		return null;
	}
}
