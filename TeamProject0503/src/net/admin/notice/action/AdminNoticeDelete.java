package net.admin.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.notice.db.NoticeDAO;

public class AdminNoticeDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminNoticeDelete execute()");		
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		NoticeDAO ndao = new NoticeDAO();
		ndao.NoticeDelete(n_num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminNoticeList.an");
		forward.setRedirect(false);
		return forward;
	}

}
