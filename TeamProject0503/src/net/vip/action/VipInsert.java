package net.vip.action;

import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.vip.db.VipBean;
import net.vip.db.VipDAO;

public class VipInsert implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		String genre = null;
		/*String genre=(String)session.getAttribute("genre");*/
		Cookie[] cookies=request.getCookies();
		/*String genre=URLDecoder.decode(cookies[0].getValue());*/
		/*String genre=URLDecoder.decode(cookies[0].getValue());*/
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("genre")) {
					genre = cookies[i].getValue();					 
				}				
			}//for
		
		}//end if
		System.out.println("쿠키값을 보자 : "+genre);
		
		int maxSize=10*1024*1024;
		
		String realPath="";
		MultipartRequest multi=null;	
		
		realPath=request.getRealPath("/images/"+genre);
		multi=new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
		/*System.out.println(realPath);
		System.out.println("vipinsert.java2");*/
		
		//vip 영화 넣기
		VipBean vipbean = new VipBean();
		
		vipbean.setV_date(multi.getParameter("v_date"));
		vipbean.setV_when(multi.getParameter("v_when"));
		
		vipbean.setV_kor_title(multi.getParameter("v_kor_title"));
		vipbean.setV_eng_title(multi.getParameter("v_eng_title"));
		
		vipbean.setV_year(Integer.parseInt(multi.getParameter("v_year")));
		vipbean.setV_country(multi.getParameter("v_country"));
		vipbean.setV_age(Integer.parseInt(multi.getParameter("v_age")));
		
		vipbean.setV_genre(multi.getParameter("v_genre"));
		vipbean.setV_time(Integer.parseInt(multi.getParameter("v_time")));
		
		vipbean.setV_director(multi.getParameter("v_director"));
		vipbean.setV_actor(multi.getParameter("v_actor"));
		
		vipbean.setV_story(multi.getParameter("v_story"));
		vipbean.setV_video(multi.getParameter("v_video"));
		
		vipbean.setV_critic_1_by(multi.getParameter("v_critic_1_by"));
		vipbean.setV_critic_1(multi.getParameter("v_critic_1"));
		vipbean.setV_critic_2_by(multi.getParameter("v_critic_2_by"));
		vipbean.setV_critic_2(multi.getParameter("v_critic_2"));
			
		vipbean.setPoster(multi.getParameter("poster"));
		vipbean.setStill1(multi.getParameter("still1"));
		vipbean.setStill2(multi.getParameter("still2"));
		
		VipDAO vipdao=new VipDAO();
		vipdao.insertVip(vipbean);

		//시사회 좌석 테이블 리셋
		
		vipdao.resetVipSeat();

		ActionForward forward=new ActionForward();
					
		forward.setRedirect(true);
		forward.setPath("./VipMovieList.vi");
		
		return forward;
	}

}
