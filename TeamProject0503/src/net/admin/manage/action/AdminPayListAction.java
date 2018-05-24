package net.admin.manage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.pay.db.PayBean;
import net.pay.db.PayDAO;

public class AdminPayListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminPayListAction execute()");
		PayDAO pdao = new PayDAO();
		int count = pdao.getAdminPayCount();
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		List<PayBean> AdminPayList = null;
		
		if(count != 0) {
			AdminPayList = pdao.getAdminPayList(startRow, pageSize);
		}
		
		int pageCount = count/pageSize + ((count%pageSize == 0) ? 0 : 1);
        int pageBlock = 3;
        int startPage = (((currentPage-1)/pageBlock)*pageBlock)+1;
        int endPage = startPage+pageBlock-1;
        if(endPage > pageCount) {
           endPage = pageCount;
        }
		request.setAttribute("AdminPayList", AdminPayList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/manage/admin_pay_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
