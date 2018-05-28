package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminMemberDAO;

public class AdminMemberDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMemberDelete execute()");
		String m_id = request.getParameter("m_id");
		AdminMemberDAO amdao = new AdminMemberDAO();
		amdao.AdminMemberDelete(m_id);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/AdminMember_List_Search.am");
		forward.setRedirect(false);
		return forward;
	}

}
