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
		// TODO Auto-generated method stub
				System.out.println("MemberUpdate execute()");
				//한글처리
				request.setCharacterEncoding("utf-8");
				// 자바빈 MemberBean mb 객체생성
				MemberBean mb = new MemberBean();
				// 자바빈 멤버변수 <= 폼파라미터 가져와서 저장	
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("m_id");	
				mb.setM_pass(request.getParameter("pass"));	
				// MemberDAO mdao 객체생성
				MemberDAO mdao = new MemberDAO();
				// insertMember(mb) 메서드 호출()
				int check=mdao.userCheck(id, mb.getM_pass());
				
				//이동 ActionForward 객체 생성    
				// 방식,경로 저장
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
