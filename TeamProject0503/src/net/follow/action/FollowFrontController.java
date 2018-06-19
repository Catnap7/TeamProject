package net.follow.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FollowFrontController extends HttpServlet{



	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI=request.getRequestURI();
		String context=request.getContextPath();
		String command=requestURI.substring(context.length());
		ActionForward forward=null;
		Action action=null;
		
		
		//주소 비교
		if(command.equals("/FollowMyHome.fo")){
			action= new FollowMyHome();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/FollowReview.fo")){
			action= new FollowReview();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/FollowFavorite.fo")){
			action= new FollowFavorite();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/DeleteFollowerAction.fo")){
			action= new DeleteFollowerAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/InsertFollowerAction.fo")){
			action= new InsertFollowerAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/TimeLine.fo")){
			action = new TimeLine();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}
			
		
		
		
		
		
		
		//이동(주소비교에서 이동방식, 이동할곳 정보를 찾아올것)
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
