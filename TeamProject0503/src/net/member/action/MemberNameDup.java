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
		System.out.println(name);
		MemberDAO memberdao = new MemberDAO();
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = memberdao.namedup(name);
		System.out.println(check);
		if(check==0) {
			int data= 0;
			out.println("<script>");
			out.println("alert('사용중인 이름입니다.');");
			out.println("</script>");
		}else if(check==1){
			int data= 1;
			out.println("<script>");
			out.println("alert('사용가능한 이름입니다.');");
			out.println("</script>");
		}

		//포워드로 처리시 포워딩 됐는데 왜 한번더 시도 하냐고 오류메시지가뜸
	/*	ActionFosetPath("./Main.me");
		forward.setRedirect(false);rward forward = new ActionForward();
		forward.
		*/
		return null;
	}

}
