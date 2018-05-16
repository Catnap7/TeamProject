package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberNameDup implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("m_name");
		MemberDAO memberdao = new MemberDAO();
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = memberdao.namedup(name);
		out.println(check);
		out.close();
		//포워드로 처리시 포워딩 됐는데 왜 한번더 시도 하냐고 오류메시지가뜸
		/*ActionForward forward = new ActionForward();
	  	forward.setPath("./Main.me");
	  	forward.setRedirect(false);
      	return forward;*/
		
		return null;
	}

}
