package net.admin.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.notice.db.NoticeBean;
import net.admin.notice.db.NoticeDAO;

public class AdminNoticeContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		NoticeDAO ndao = new NoticeDAO();
		NoticeBean noticebean = ndao.getAdminNoticeContent(n_num);
		request.setAttribute("noticebean", noticebean);
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/notice/admin_notice_content.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
