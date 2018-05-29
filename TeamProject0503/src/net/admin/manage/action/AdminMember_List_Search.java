package net.admin.manage.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.mysql.fabric.Response;

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
		String select = request.getParameter("select");
		response.getWriter().write(getJSON(searchValue, select));		
	}
	
	public String getJSON(String searchValue, String select) {
		if(searchValue == null) searchValue = "";
		StringBuffer result = new StringBuffer("");
		String grade = null;
		String StrGrade = "";
		result.append("{\"result\":[");
		AdminMemberDAO amdao = new AdminMemberDAO();
		List<MemberBean> userList = amdao.getAdminMemberSearch(searchValue, select);
		
		for(int i = 0; i < userList.size(); i++) {
			switch(userList.get(i).getM_grade()){
			case 4: StrGrade="로그인정지"; break;
			case 3: StrGrade="댓글정지"; break;
			case 2: StrGrade="VIP"; break;
			case 1: StrGrade="정회원"; break;
			case 0: StrGrade="준회원"; break;
			}
			result.append("[{\"value\" : \"" + userList.get(i).getM_id() + "\"},");
			result.append("{\"value\" : \"" + userList.get(i).getM_name() + "\"},");
			result.append("{\"value\" : \"" + StrGrade + "\"},");
			result.append("{\"value\" : \"" + userList.get(i).getM_reg_date() + "\"},");
//			result.append("{\"value\" : \"<a href='./AdminMemberDelete.am?m_id="+ userList.get(i).getM_id() +"'>내보내기" + "</a>\"}],");	
			result.append("{\"value\" : \"<button onclick='confirm()'>내보내기" + "</button>\"}],");	
		}		
		result.append("]}");
		return result.toString();
	}
	
	public String confirm() {
		String message = "정말로 내보내시겠습니까?";
		String title = "확인";
		JOptionPane.showConfirmDialog(null, message, title, 0);
		return null;
	}

}
