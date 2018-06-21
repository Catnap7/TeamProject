package net.vip.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VipFrontController extends HttpServlet{



	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI=request.getRequestURI();
		String context=request.getContextPath();
		String command=requestURI.substring(context.length());
		ActionForward forward=null;
		Action action=null;
		
		
		//주소 비교
		if(command.equals("/Vip.vi")){
		  	action = new Vip();
		  try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
		}else if(command.equals("/VipResult.vi")){
		  	action = new VipResult();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipInsert.vi")){
		  	action = new VipInsert();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipMovieList.vi")){
		  	action = new VipMovieList();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipInfo.vi")){
		  	action = new VipInfo();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipModify.vi")){
				forward=new ActionForward();
			
				forward.setRedirect(false);
				forward.setPath("./vip/insertVipMovie.jsp");
				
		}else if(command.equals("/VipAdmin.vi")){
				action = new VipAdmin();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipResDelete.vi")){
		  	action = new VipResDelete();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipMemberList.vi")){
		  	action = new VipMemberList();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipMovieContent.vi")){
		  	action = new VipMovieContent();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipMovieModify.vi")){
		  	action = new VipMovieModify();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipMovieModifyAction.vi")){
		  	action = new VipMovieModifyAction();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipMovieDelete.vi")){
		  	action = new VipMovieDelete();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}else if(command.equals("/VipReset.vi")){
		  	action = new VipReset();
			  try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }

		//이동(주소비교에서 이동방식, 이동할곳 정보를 찾아올것)
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
			RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);	
			}
		}}
		
	
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
