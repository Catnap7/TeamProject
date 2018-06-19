package net.mypage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class Update implements Action{
	PrintWriter out;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				request.setCharacterEncoding("utf-8");
				MemberBean mb = new MemberBean();
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("m_id");	
				if(id==null){
					ActionForward forward= new ActionForward();
					forward.setPath("./MemberLogin.me");
					forward.setRedirect(true);
					return forward;
				}				//한글처리
				mb.setM_pass(request.getParameter("pass"));	
				MemberDAO mdao = new MemberDAO();
				int check=mdao.userCheck(id, mb.getM_pass());
				
				ActionForward forward=null;
				switch(check){
				case 1: 	
						mb = mdao.getMember(id);
						request.setAttribute("id", id);
						request.setAttribute("name", mb.getM_name());
						
						forward=new ActionForward();
						forward.setRedirect(false);
						forward.setPath("./mypage/updateform.jsp");
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
