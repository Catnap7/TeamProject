package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberNameCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String m_name = request.getParameter("name");
		
		MemberDAO memberdao = new MemberDAO();
		boolean result = memberdao.duplicateIdCheck(m_name);
		PrintWriter out = response.getWriter();

		if(result)	out.println("0"); 
		else		out.println("1");
		
		out.close();
		return null;
	}

}
