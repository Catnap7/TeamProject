package net.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.CouponBean;
import net.mypage.db.CouponDAO;

public class Coupon implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
				System.out.println("Coupon execute()");
				//한글처리
				request.setCharacterEncoding("utf-8");								
				CouponDAO cdao = new CouponDAO();						
				HttpSession session=request.getSession();		
				String id = (String)session.getAttribute("m_id");
				
				if(id==null){
					forward=new ActionForward();
					forward.setRedirect(true);		
					forward.setPath("./MemberLogin.me");
					return forward;
				}
				
				List couponlist = cdao.getCoupons(id);
				
				request.setAttribute("couponlist", couponlist);	
				
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./mypage/coupon.jsp");						
					
				return forward;
	}
	
}
