package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.action.Action;
import net.mypage.action.ActionForward;

public class UpdateProfile implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UpdateProfile execute()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/updateProfile.jsp");				
		return forward;
	}

}
