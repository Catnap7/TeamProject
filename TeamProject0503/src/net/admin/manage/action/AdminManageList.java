package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminManageList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		if(id == null || !id.equals("admin@watchu.com")){
			ActionForward forward = new ActionForward();
			forward.setPath("./intro.st");
			forward.setRedirect(true);
			return forward;
		}
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/admin_manage_list.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
