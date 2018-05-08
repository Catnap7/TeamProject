package net.admin.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminNoticeList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminNoticeList execute()");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/notice/admin_notice_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
