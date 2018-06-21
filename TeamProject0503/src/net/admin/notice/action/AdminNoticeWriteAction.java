package net.admin.notice.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import net.admin.notice.db.NoticeBean;
import net.admin.notice.db.NoticeDAO;

public class AdminNoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null || !id.equals("admin@watchu.com")){
			ActionForward forward= new ActionForward();
			forward.setPath("./intro.st");
			forward.setRedirect(true);
			return forward;
		}
		String realpath = request.getRealPath("./upload");
		int maxSize = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		NoticeBean nb = new NoticeBean();
		nb.setN_content(multi.getParameter("n_content"));
		nb.setN_subject(multi.getParameter("n_subject"));
		nb.setN_image(multi.getFilesystemName("n_image"));
		nb.setN_file(multi.getFilesystemName("n_file"));
		nb.setN_date(new Date(System.currentTimeMillis()));		
		NoticeDAO ndao = new NoticeDAO();
		ndao.NoticeInsert(nb);		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminNoticeList.an");
		forward.setRedirect(true);
		return forward;
	}

}
