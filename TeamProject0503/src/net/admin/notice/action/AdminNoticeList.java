package net.admin.notice.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.admin.notice.db.NoticeBean;
import net.admin.notice.db.NoticeDAO;

public class AdminNoticeList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null || !id.equals("admin@watchu.com")){
			ActionForward forward= new ActionForward();
			forward.setPath("./intro.st");
			forward.setRedirect(true);
			return forward;
		}
		NoticeDAO ndao = new NoticeDAO();
		int count = ndao.getAdminNoticeCount();
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		List<NoticeBean> AdminNoticeList = null;
		if(count != 0) {
			AdminNoticeList = ndao.getAdminNoticeList(startRow, pageSize);
		}
		int pageCount = count/pageSize + ((count%pageSize == 0) ? 0 : 1);
		int pageBlock = 3;
		int startPage = (((currentPage-1)/pageBlock)*pageBlock)+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		request.setAttribute("AdminNoticeList", AdminNoticeList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/notice/admin_notice_list.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
