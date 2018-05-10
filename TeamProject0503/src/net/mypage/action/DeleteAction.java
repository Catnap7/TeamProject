package net.mypage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class DeleteAction implements Action{
	ActionForward forward;
	PrintWriter out;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteAction execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");				
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("m_id");		
		// MemberDAO mdao 객체생성
		MemberDAO mdao = new MemberDAO();				
											
		int check=mdao.userCheck(id,request.getParameter("pass"));		
		
		switch(check){
		case 1: 	
				mdao.deleteMember(id);
				session.invalidate();								
				
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./Main.ma");
				break;
		case 0:
			response.setContentType("text/html;charset=utf-8");
			out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다!');");	
			out.println("history.back();");
			out.println("</script>");
			out.close();					
			break;				
		}
		 
		return forward;
	}
	
}
