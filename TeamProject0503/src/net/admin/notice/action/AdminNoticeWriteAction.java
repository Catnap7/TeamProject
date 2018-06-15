package net.admin.notice.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.admin.notice.db.NoticeBean;
import net.admin.notice.db.NoticeDAO;

public class AdminNoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println("AdminNoticeWrite execute()");
		   String realpath = request.getRealPath("./upload");
		   System.out.println("upload폴더의 물리적 경로:" + realpath);
		   int maxSize = 10 * 1024 * 1024;
		   MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "euc-kr", new DefaultFileRenamePolicy());
		
		NoticeBean nb = new NoticeBean();
		nb.setN_content(multi.getParameter("n_content"));
		nb.setN_subject(multi.getParameter("n_subject"));
		nb.setN_image(multi.getParameter("n_image"));
		nb.setN_file(multi.getParameter("n_file"));
		nb.setN_date(new Date(System.currentTimeMillis()));
		
		
		NoticeDAO ndao = new NoticeDAO();
		ndao.NoticeInsert(nb);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminNoticeList.an");
		forward.setRedirect(true);
		return forward;
	}

}
