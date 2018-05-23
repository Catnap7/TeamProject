package net.pay.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.mypage.db.CouponDAO;
import net.pay.db.PayBean;
import net.pay.db.PayDAO;

public class PayList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("m_id");
		if(id==null){
			ActionForward forward=new  ActionForward();
			forward.setPath("./Main.ma");
			forward.setRedirect(true);
			return forward;
		}
		
		
		//이용권 유무 들고가야함. 		
		PayDAO pdao= new PayDAO();
		PayBean currentpaybean=pdao.getCurrentPay(id);
		

		request.setAttribute("currentpaybean", currentpaybean);
		
		//쿠폰 유무 들고가야함. 
		CouponDAO cdao= new CouponDAO();
		int couponcount=cdao.getCouponCount(id);
		boolean couponcheck=false; 
		if(couponcount>0){
			couponcheck=true;
		}
		
		request.setAttribute("couponcheck", couponcheck);
		
		
		//결제내역리스트 들고가야함. 
		List paylist= new ArrayList();
		paylist=pdao.getPayList(id);

		request.setAttribute("paylist", paylist);
		
		
		
		
		
		ActionForward forward=new  ActionForward();
		forward.setPath("./pay/pay_result.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
