package net.admin.manage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.admin.manage.db.AdminReviewDAO;
import net.category.db.ReviewBean;


@WebServlet("/AdminReviewSearch")
public class AdminReview_List_Search extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminReview_List_Search execute()");
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
		AdminReviewDAO ardao = new AdminReviewDAO();
		List<ReviewBean> reviewList = ardao.getAdminReviewSearch(searchValue, select);
		
		for(int i = 0; i < reviewList.size(); i++) {
			result.append("[{\"value\" : \"" + reviewList.get(i).getR_num() + "\"},");
			result.append("{\"value\" : \"" + reviewList.get(i).getR_id() + "\"},");
			result.append("{\"value\" : \"" + reviewList.get(i).getR_content().replaceAll("\r\n","") + "\"},");
			result.append("{\"value\" : \"" + reviewList.get(i).getR_recommand() + "\"},");
			result.append("{\"value\" : \"" + reviewList.get(i).getR_report() + "\"},");
			result.append("{\"value\" : \"" + reviewList.get(i).getR_date() + "\"}],");
		}		
		result.append("]}");
		return result.toString();
	}

}
