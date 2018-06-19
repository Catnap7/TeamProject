package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberNameDup implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("m_name");
		MemberDAO memberdao = new MemberDAO();
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = memberdao.namedup(name);
		out.println(check);
		out.close();
		
		return null;
	}

}
