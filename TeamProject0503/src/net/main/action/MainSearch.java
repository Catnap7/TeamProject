package net.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.main.db.MainDAO;

public class MainSearch implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		String search = request.getParameter("search");
		if(id==null){
			forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		MainDAO maindao = new MainDAO();
		List titlesearchList = maindao.titlesearch(search);
		List directorsearchList = maindao.directorsearch(search);
		List actorsearchList = maindao.actorsearch(search);
		
		request.setAttribute("titlesearchList", titlesearchList);
		request.setAttribute("directorsearchList", directorsearchList);
		request.setAttribute("actorsearchList", actorsearchList);
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/mainsearch.jsp");						
			
		return forward;
	}

}
