package net.admin.manage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminMovieDAO;
import net.admin.manage.db.MovieBean;


@WebServlet("/AdminMovieSearch")
public class AdminMovie_List_Search extends HttpServlet {
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
		AdminMovieDAO amdao = new AdminMovieDAO();
		List<MovieBean> movieList = amdao.getAdminMovieSearch(searchValue, select);
		
		for(int i = 0; i < movieList.size(); i++) {
			result.append("[{\"value\" : \"" + movieList.get(i).getMv_num() + "\"},");
			result.append("{\"value\" : \"<a href='./AdminMovieInfo.am?mv_num=" + movieList.get(i).getMv_num() + "'>" + movieList.get(i).getMv_kor_title() + " ( "+movieList.get(i).getMv_eng_title() + " ) " + "</a>\"},");
			result.append("{\"value\" : \"" + movieList.get(i).getMv_director() + "\"},");
			result.append("{\"value\" : \"" + movieList.get(i).getMv_year() + "\"},");
			result.append("{\"value\" : \"" + movieList.get(i).getMv_age() + "\"},");
			result.append("{\"value\" : \"" + movieList.get(i).getMv_genre() + "\"}],");
		}		
		result.append("]}");
		return result.toString();
	}

}
