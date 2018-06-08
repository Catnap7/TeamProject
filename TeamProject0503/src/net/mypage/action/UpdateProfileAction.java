package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class UpdateProfileAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UpdateProfileAction execute()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		int profile_num = Integer.parseInt(request.getParameter("profile_num"));
		
		MemberDAO mdao = new MemberDAO();
		mdao.updateProfile(id, profile_num);
		return null;
	}

}
