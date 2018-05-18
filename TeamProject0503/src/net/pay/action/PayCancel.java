package net.pay.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.pay.db.PayBean;
import net.pay.db.PayDAO;

public class PayCancel implements Action{

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
		
		//정기 결제 해지함
		PayDAO pdao= new PayDAO();
		pdao.payCancel(id);
		
		
		
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('정기이용권이 결제가 해지되었습니다.')");
		out.println("location.href='./PayList.pa'");
		out.println("</script>");
		out.close();
		return null;

		/*
		
		ActionForward forward=new ActionForward();
		forward.setPath("./PayList.pa");
		forward.setRedirect(true);
		return forward;*/
	}
	

}
