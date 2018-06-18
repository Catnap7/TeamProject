package net.main.action;

import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.favorite.db.FavoriteBean;
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
		
//		留ㅼ씪 �옄�젙留덈떎 由ъ뀑 �떎�뻾�떆�궎�뒗 硫붿냼�뱶
//		System.out.println("由ъ뀑 硫붿냼�뱶 �떎�뿕 �떆�옉");
//		DailyReset dailyReset = new DailyReset();
//		Timer timer = new Timer();
//		Calendar date = Calendar.getInstance();		
//		date.set(Calendar.AM_PM,Calendar.AM);
//		date.set(Calendar.HOUR,12);
//		date.set(Calendar.MINUTE, 0);
//		date.set(Calendar.SECOND, 0);
//		date.set(Calendar.MILLISECOND, 0);
		
//		timer.scheduleAtFixedRate(dailyReset, date.getTime(), 1000*60*60*24); //1000諛�由ъ큹*60珥�*60遺�*24�떆媛�
//		留ㅼ씪 �옄�젙留덈떎 由ъ뀑 �떎�뻾�떆�궎�뒗 硫붿냼�뱶
		
////		�떎�떆媛� �븣�엺 硫붿냼�뱶
//		System.out.println("�떎�떆媛� �븣�엺 �떎�뿕 �떆�옉");
//		RealtimeAlarm realtime = new RealtimeAlarm();
//		Timer timer2 = new Timer();
//		Calendar date2 = Calendar.getInstance();		
//		date2.set(Calendar.AM_PM,Calendar.AM);
//		date2.set(Calendar.HOUR,12);
//		date2.set(Calendar.MINUTE, 0);
//		date2.set(Calendar.SECOND, 0);
//		date2.set(Calendar.MILLISECOND, 0);
//		
//		timer2.scheduleAtFixedRate(realtime, date2.getTime(), 1000*60); //1000諛�由ъ큹*60珥�*60遺�*24�떆媛�
////		�떎�떆媛� �븣�엺 硫붿냼�뱶
		
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/main.jsp");						
			
		return forward;
	}
	
}
