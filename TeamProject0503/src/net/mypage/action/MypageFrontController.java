package net.mypage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageFrontController extends HttpServlet{


	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MypageFrontController doProcess()");
		String requestURI=request.getRequestURI();
		System.out.println("URI주소 : "+requestURI);
		String context=request.getContextPath();
		String command=requestURI.substring(context.length());
		ActionForward forward=null;
		Action action=null;
				
		//주소 비교
		if(command.equals("/Mypage.my")){
			action = new Mypage();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/UpdateCheck.my")){
			action = new UpdateCheck();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/Update.my")){
			action = new Update();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/UpdateAction.my")){
			action = new UpdateAction();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/DeleteCheck.my")){
			action = new DeleteCheck();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/DeleteAction.my")){
			action = new DeleteAction();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/Coupon.my")){
			action = new Coupon();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/Alarm.my")){
			action = new Alarm();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/CheckAlarm.my")){
			action = new CheckAlarm();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}			
		}else if(command.equals("/Myrating.my")){
			action = new Myrating();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/UpdateProfile.my")){
			action = new UpdateProfile();
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
		System.out.println("MypageFrontController doGet()");	
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MypageFrontController doPost()");
		doProcess(request, response);
		
	}
	
	
	
	
	
	
}
