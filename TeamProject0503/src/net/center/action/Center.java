package net.center.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.notice.db.NoticeBean;
import net.admin.notice.db.NoticeDAO;



public class Center implements Action {
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Center execute()");

		NoticeDAO ndao = new NoticeDAO();

		List<NoticeBean> AdminNoticeList = null;

		AdminNoticeList = ndao.getAdminNoticeList();
		request.setAttribute("AdminNoticeList", AdminNoticeList);

		forward=new ActionForward();
		forward.setPath("./customer/customer.jsp");	
		forward.setRedirect(false);						
		return forward;
	}

}
