package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberNameCh implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("excute()..");
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("m_name");
		MemberDAO memberdao = new MemberDAO();
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = memberdao.namecheck(name);
		if(check==0) {
			out.println("<script>");
			out.println("alert('사용중인 이름입니다.');");
			out.println("</script>");
		}else if(check==1){
			out.println("<script>");
			out.println("alert('사용가능한 이름입니다.');");
			out.println("</script>");
		}
		System.out.println(check);
		request.setAttribute("check", check);
	/*	ActionFosetPath("./Main.me");
		forward.setRedirect(false);rward forward = new ActionForward();
		forward.
		*/
		return null;
	}

}
