package net.admin.manage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.admin.manage.db.AdminPayDAO;
import net.pay.db.PayBean;


@WebServlet("/AdminPaySearch")
public class AdminPay_List_Search extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminPay_List_Search execute()");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String searchValue = request.getParameter("searchValue");
		String select = request.getParameter("select");
		response.getWriter().write(getJSON(searchValue, select));		
	}
	
	public String getJSON(String searchValue, String select) {
		if(searchValue == null) searchValue = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		AdminPayDAO apdao = new AdminPayDAO();
		List<PayBean> payList = apdao.getAdminPaySearch(searchValue, select);
		
		for(int i = 0; i < payList.size(); i++) {
			result.append("[{\"value\" : \"" + payList.get(i).getP_num() + "\"},");
			result.append("{\"value\" : \"" + payList.get(i).getP_id() + "\"},");
			result.append("{\"value\" : \"" + payList.get(i).getP_auto() + "\"},");
			result.append("{\"value\" : \"" + payList.get(i).getP_start_day() + "\"},");
			result.append("{\"value\" : \"" + payList.get(i).getP_end_day() + "\"}],");
		}		
		result.append("]}");
		return result.toString();
	}

}
