package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
public class EmailCheckAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberDAO memberdao = new MemberDAO();
		String id= request.getParameter("m_id");
		MemberBean memberbean = memberdao.getMember(id);
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		if (id==null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = './MemberLogin.me'");
			script.println("</script>");
			script.close();
			return null;
		}
			session.setAttribute("m_id",id);
			memberdao.setUserEmailChecked(id);
			forward.setRedirect(false);
			forward.setPath("./Main.me");
			return forward;
	}
}
