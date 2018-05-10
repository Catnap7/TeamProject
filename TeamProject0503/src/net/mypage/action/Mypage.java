package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class Mypage implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Mypage execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");
		// 자바빈 MemberBean mb 객체생성
		MemberBean mb = new MemberBean();
		// 자바빈 멤버변수 <= 폼파라미터 가져와서 저장
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");				
		// MemberDAO mdao 객체생성
		MemberDAO mdao = new MemberDAO();
		// getMember(세션값) 메서드 호출()
		mb=mdao.getMember(id);
						
		request.setAttribute("mb", mb);			
		
		//이동 ActionForward 객체 생성    
		// 방식,경로 저장
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/mypage.jsp");				
		return forward;
	}
	
}
