package net.admin.manage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminMemberDAO;
import net.member.db.MemberBean;

public class AdminMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMemberListAction execute()");
		AdminMemberDAO amdao = new AdminMemberDAO();
		
		int count = amdao.getAdminMemberCount();
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		List<MemberBean> AdminMemberList = null;
		
		if(count != 0) {
			AdminMemberList = amdao.getAdminMemberList(startRow, pageSize);
		}
		
		int pageCount = count/pageSize + ((count%pageSize == 0) ? 0 : 1);
        int pageBlock = 3;
        int startPage = (((currentPage-1)/pageBlock)*pageBlock)+1;
        int endPage = startPage+pageBlock-1;
        if(endPage > pageCount) {
           endPage = pageCount;
        }
		request.setAttribute("AdminMemberList", AdminMemberList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/manage/admin_member_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
