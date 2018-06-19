package net.admin.manage.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminManageFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI=request.getRequestURI();
		String context=request.getContextPath();
		String command=requestURI.substring(context.length());
		ActionForward forward=null;
		Action action=null;
		if(command.equals("/AdminMovieInsert.am")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/manage/admin_movie_insert.jsp");
		}else if(command.equals("/AdminMovieInsertAction.am")) {
			action = new AdminMovieInsert();	         
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AdminManageList.am")){		      
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_manage_list.jsp");
		}else if(command.equals("/AdminMember_List_Search.am")) {     
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/manage/admin_member_list.jsp");			
		}else if(command.equals("/AdminMemberDelete.am")) {
			action = new AdminMemberDelete();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AdminPay_List_Search.am")) {     
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/manage/admin_pay_list.jsp");			
		}else if(command.equals("/AdminReview_List_Search.am")) {     
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/manage/admin_review_list.jsp");			
		}else if(command.equals("/AdminMovie_List_Search.am")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/manage/admin_movie_list.jsp");	
		}else if(command.equals("/AdminMemberDelete.am")) {
			action = new AdminMemberDelete();  
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}else if(command.equals("/AdminMovieInfo.am")) {
			action = new AdminMovieInfo();  
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/AdminMovieDelete.am")) {
			action = new AdminMovieDelete();  
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/AdminMovieUpdate.am")) {
			action = new AdminMovieUpdate();  
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}else if(command.equals("/AdminMovieUpdateAction.am")) {
			action = new AdminMovieUpdateAction();  
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}				
		}

		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}	
}
