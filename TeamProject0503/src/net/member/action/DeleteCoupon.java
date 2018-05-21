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

		CouponDAO cdao = new CouponDAO();
	
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		

		List <CouponBean>couponlist = cdao.getCoupons(id);
		if(couponlist != null){
		for(CouponBean couponbean:couponlist){
		 String array[] = couponbean.getC_end_day().split("/");  
		 String day = array[0]+array[1]+array[2];
		 
		 int c_end_day = Integer.parseInt(day);
		 if(today>=c_end_day){
			cdao.deleteCoupon(couponbean.getC_num());
			}  
		 }//end for
		}//end if
		
		
		
		// TODO Auto-generated method stub
		return null;
	}

}
