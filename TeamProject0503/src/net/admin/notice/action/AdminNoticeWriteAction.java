package net.admin.notice.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.notice.db.NoticeBean;
import net.admin.notice.db.NoticeDAO;

public class AdminNoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminNoticeWrite execute()");
		request.setCharacterEncoding("UTF-8");
		
		NoticeBean nb = new NoticeBean();
		nb.setN_content(request.getParameter("n_content"));
		nb.setN_date(new Date(System.currentTimeMillis()));
		nb.setN_subject(request.getParameter("n_subject"));
		
		
		NoticeDAO ndao = new NoticeDAO();
		ndao.NoticeInsert(nb);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminNoticeList.an");
		forward.setRedirect(true);
		return forward;
	}

}
