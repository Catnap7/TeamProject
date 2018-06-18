package net.pay.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.pay.db.PayBean;
import net.pay.db.PayDAO;

public class PayAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
		int m_pay=pdao.getMpay(id);
		
		if(m_pay==1){
			ActionForward forward=new  ActionForward();
			forward.setPath("./PayList.pa");
			forward.setRedirect(true);
			return forward;
		}
		
		//페이빈에 정보 넣기. 
		PayBean paybean= new PayBean();
		paybean.setP_id(id);
		paybean.setP_charge(Integer.parseInt(request.getParameter("charge")));
		paybean.setP_auto(request.getParameter("pay"));
		
		
		//insert
		pdao.insertPay(paybean);
		
		//멤버 m_pay 변경
		pdao.updateMpaytoOne(id);
		
		//사용한 쿠폰 삭제
		int c_name=Integer.parseInt(request.getParameter("couponBox"));
		pdao.deleteUseCoupon(id, c_name);
		
		
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('결제가 완료되었습니다.')");
		out.println("location.href='./PayList.pa'");
		out.println("</script>");
		out.close();
		return null;
		
		/*
		ActionForward forward=new  ActionForward();
		forward.setPath("./PayList.pa");
		forward.setRedirect(true);
		return forward;*/
	}
	

}
