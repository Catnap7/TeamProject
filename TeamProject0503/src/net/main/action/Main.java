package net.main.action;

import java.util.Calendar;
import java.util.List;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.favorite.db.FavoriteDAO;
import net.follow.db.FollowDAO;
import net.main.db.MainDAO;

public class Main implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Main execute");
		HttpSession session=request.getSession();
		
		
		String id = (String)session.getAttribute("m_id");
		if(id==null){
			forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		FavoriteDAO fdao = new FavoriteDAO();
		List <MovieBean>favoritelist = fdao.randomFavoriteList(id);	
		int favoritecount = fdao.getFavoriteCount(id);
		
		
		MainDAO mdao = new MainDAO();
		
		List<MovieBean>mainMovieList=mdao.mainMovieList();
		int allreviewcount=mdao.getAllReviewCount();
		List<MovieBean>mostReviewsList=mdao.getMostReviewsList();
		
		/*Vector vector = new Vector();
		vector = mdao.getMostReviewsList();
		
		List mostReviewsList=(List)vector.get(0);
		List favList=(List)vector.get(1);*/
		
		List<MovieBean>Mostcount = mdao.mostCountGenre(id);
		List<MovieBean>Bestrating = mdao.mostAvgGenre(id);
		List<MovieBean>Bestmovie = mdao.bestMovie();
		List<MovieBean>adminSelectMovieList = mdao.adminSelectMovie();
		
		
		FollowDAO followdao = new FollowDAO();
		int followercount= followdao.Followercount(id);
		int followingcount= followdao.Followingcount(id);
		
		
		request.setAttribute("followercount", followercount);
		request.setAttribute("followingcount", followingcount);
		
		request.setAttribute("id", id);
		
		request.setAttribute("mainMovieList", mainMovieList);
		
		request.setAttribute("mostReviewsList", mostReviewsList);
		/*request.setAttribute("favList", favList);*/
		
		request.setAttribute("allreviewcount", allreviewcount);
		
		request.setAttribute("favoritelist", favoritelist);
		request.setAttribute("favoritecount", favoritecount);
		request.setAttribute("Mostcount", Mostcount);
		request.setAttribute("Bestrating", Bestrating);
		request.setAttribute("Bestmovie", Bestmovie);
		request.setAttribute("adminSelectMovieList", adminSelectMovieList);
			
		//매일 1번 실행되는 메소드
		DailyReset dailyReset = new DailyReset();
		Timer timer = new Timer();
		Calendar date = Calendar.getInstance();		
		date.set(Calendar.AM_PM,Calendar.AM);
		date.set(Calendar.HOUR,12);
		date.set(Calendar.MINUTE, 0);
		date.set(Calendar.SECOND, 0);
		date.set(Calendar.MILLISECOND, 0);
		
		timer.scheduleAtFixedRate(dailyReset, date.getTime(), 1000*60*60*24); //1000*60초*60분*24시간
		//매일 1번 실행되는 메소드
		
		
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/main.jsp");						
			
		return forward;
	}
	
}
