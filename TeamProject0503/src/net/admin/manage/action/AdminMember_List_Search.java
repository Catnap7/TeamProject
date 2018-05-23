package net.admin.manage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminMemberDAO;
import net.member.db.MemberBean;


@WebServlet("/AdminMemberSearch")
public class AdminMember_List_Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminMember_List_Search execute()");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String searchValue = request.getParameter("searchValue");
		response.getWriter().write(getJSON(searchValue));
	}
	
	public String getJSON(String searchValue) {
		if(searchValue == null) searchValue = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		AdminMemberDAO amdao = new AdminMemberDAO();
		List<MemberBean> userList = amdao.getAdminMemberSearch(searchValue);
		for(int i = 0; i < userList.size(); i++) {
			result.append("[{\"value\" : \"" + userList.get(i).getM_id() + "\"},");
			result.append("{\"value\" : \"" + userList.get(i).getM_name() + "\"},");
			result.append("{\"value\" : \"" + userList.get(i).getM_grade() + "\"},");
			result.append("{\"value\" : \"" + userList.get(i).getM_reg_date() + "\"}],");
		}
		result.append("]}");
		return result.toString();
		
	}

}
