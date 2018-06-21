package net.admin.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import net.admin.notice.db.NoticeBean;
import net.admin.notice.db.NoticeDAO;

public class AdminNoticeUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null || !id.equals("admin")){
			ActionForward forward= new ActionForward();
			forward.setPath("./intro.st");
			forward.setRedirect(true);
			return forward;
		}
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		String realpath = request.getRealPath("/upload");
		int maxSize = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		NoticeBean noticebean = new NoticeBean();
		noticebean.setN_content(multi.getParameter("n_content"));
		noticebean.setN_subject(multi.getParameter("n_subject"));
		NoticeDAO ndao = new NoticeDAO();
		ndao.NoticeUpdateInsert(noticebean, n_num);		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminNoticeList.an");
		forward.setRedirect(true);
		return forward;
	}

}
