package net.pay.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.CouponDAO;
import net.pay.db.PayDAO;

public class Pay implements Action{

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
		
		
		PayDAO pdao= new PayDAO();
		
		//m_pay들고와서, 이미 결제한 회원이면, 돌아가기
		String m_pay=pdao.getMpay(id);
		if(m_pay=="1"){
			ActionForward forward=new  ActionForward();
			forward.setPath("./PayList.pa");
			forward.setRedirect(true);
			return forward;
		}
		
		//쿠폰리스트뿌려주기
		CouponDAO cdao= new CouponDAO();
		List couponlist=cdao.getCoupons(id);
		
		request.setAttribute("couponlist", couponlist);

		ActionForward forward=new  ActionForward();
		forward.setPath("./pay/pay.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
