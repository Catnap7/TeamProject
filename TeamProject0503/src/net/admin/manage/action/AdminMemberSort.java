package net.admin.manage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminMemberDAO;
import net.member.db.MemberBean;

public class AdminMemberSort implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMemberSort execute()");
		String sort = request.getParameter("sort");
		if(sort == "1"){
			sort = "m_name";
		}else if(sort == "2") {
			sort = "m_grade";
		}else if(sort == "3") {
			sort = "m_reg_date";
		}
		
		AdminMemberDAO amdao = new AdminMemberDAO();
		List<MemberBean> AdminMemberSort = amdao.getAdminMemberSort(sort);
		
		request.setAttribute("AdminMemberSort", AdminMemberSort);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/manage/admin_member_list_sort.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
