package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminMemberDAO;

public class AdminMemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMemberDeleteAction execute()");
		String id = request.getParameter("id");
		
		AdminMemberDAO addao = new AdminMemberDAO();
		addao.AdminMemberDelete(id);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminMemberListAction.am");
		forward.setRedirect(true);		
		return forward;
	}

}
