package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.admin.manage.db.AdminMemberDAO;

public class AdminMemberDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null || !id.equals("admin")){
			ActionForward forward= new ActionForward();
			forward.setPath("./intro.st");
			forward.setRedirect(true);
			return forward;
		}
		String m_id = request.getParameter("m_id");		
		AdminMemberDAO amdao = new AdminMemberDAO();
		amdao.AdminMemberDelete(m_id);		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminMember_List_Search.am");
		forward.setRedirect(true);
		return forward;
	}
}
