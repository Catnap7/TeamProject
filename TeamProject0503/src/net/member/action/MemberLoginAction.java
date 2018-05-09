package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;


public class MemberLoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		
		MemberDAO mdao = new MemberDAO();
		String m_id = request.getParameter("m_id");
		mdao.getMember(m_id);
		MemberBean memberbean= mdao.getMember(m_id);
		
		
		memberbean.setM_id(request.getParameter("m_id"));
		memberbean.setM_pass(request.getParameter("m_pass"));
		
		if(request.getParameter("m_id").equals("admin")) {
			ActionForward forward= new ActionForward();			
			forward.setRedirect(true);
			forward.setPath("./AdminManageList.am");
			return forward;
		}
		
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check=mdao.userCheck(memberbean.getM_id(),memberbean.getM_pass());
		int Echeck=mdao.EmailChecked(memberbean.getM_id());
		
		
		if(check==0) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}else if(check==-1){
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다');");
			out.println("history.back()");
			out.println("</script>");
		}else if(check==1){
			
			if(Echeck==0) {
				out.println("<script>");
				out.println("alert('이메일 인증을 완료해주세요');");
				out.println("history.back()");
				out.println("</script>");
			}else {
			session.setAttribute("m_id",memberbean.getM_id());
			session.setAttribute("m_name",memberbean.getM_name());
			
			ActionForward forward= new ActionForward();			
			forward.setRedirect(true);
			forward.setPath("./Main.ma");
			return forward;
			}
	
	}
		return null;
		
	}

}
