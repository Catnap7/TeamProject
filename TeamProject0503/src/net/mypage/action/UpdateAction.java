package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class UpdateAction implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateAction execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");
		// 자바빈 MemberBean mb 객체생성
		MemberBean mb = new MemberBean();		
		mb.setM_pass(request.getParameter("pass"));
		mb.setM_name(request.getParameter("name"));		
		// 자바빈 멤버변수 <= 폼파라미터 가져와서 저장
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		session.setAttribute("m_name", request.getParameter("name"));
		mb.setM_id(id);
		// MemberDAO mdao 객체생성
		MemberDAO mdao = new MemberDAO();		
		mdao.updateMember(mb);		
		//이동 ActionForward 객체 생성    
				// 방식,경로 저장
		
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./Mypage.my");																											
									
		return forward;		
	}

}
