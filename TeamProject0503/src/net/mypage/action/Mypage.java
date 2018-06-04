package net.mypage.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.follow.db.FollowBean;
import net.follow.db.FollowDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class Mypage implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Mypage execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");
		// 자바빈 MemberBean mb 객체생성
		MemberBean mb = new MemberBean();
		// 자바빈 멤버변수 <= 폼파라미터 가져와서 저장
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");				
		// MemberDAO mdao 객체생성
		MemberDAO mdao = new MemberDAO();
		// getMember(세션값) 메서드 호출()
		mb=mdao.getMember(id);
		
		FollowDAO followdao = new FollowDAO();
		int followercount= followdao.Followercount(id);
		int followingcount= followdao.Followingcount(id);
		Vector vector = new Vector();
		
		// 팔로잉 리스트
		vector = followdao.followingList(id);
		List<FollowBean> f_followingList = (List)vector.get(0);
		List<MemberBean> m_followingList = (List)vector.get(1);
		// 팔로워 리스트
		vector = followdao.followerList(id);
		List<FollowBean> f_followerList = (List)vector.get(0);
		List<MemberBean> m_followerList = (List)vector.get(1);		
		
		String following_id = null;
		String f_id = null;
		List<Integer> followingCheckList = new ArrayList<>();
		List<Integer> followCheckList = new ArrayList<>();
		
		// 팔로잉 체크
		for(int i=0; i<f_followingList.size(); i++) {
			FollowBean fbean = (FollowBean)f_followingList.get(i);
			following_id = fbean.getFo_following();
			System.out.println(following_id);
			
			followingCheckList.addAll(followdao.followingCheck(id, following_id));
			request.setAttribute("followingCheckList", followingCheckList);
			System.out.println(followingCheckList.get(i));

		}
		
		// 팔로워 체크
		for(int i=0; i<f_followerList.size(); i++) {
			FollowBean fbean = (FollowBean)f_followerList.get(i);
			f_id = fbean.getFo_id();
			System.out.println(f_id);
			
			followCheckList.addAll(followdao.followCheck(id, f_id));
			request.setAttribute("followCheckList", followCheckList);
			System.out.println(followCheckList.get(i));

		}
		
		request.setAttribute("followercount", followercount);
		request.setAttribute("followingcount", followingcount);
		request.setAttribute("mb", mb);
		request.setAttribute("f_followingList", f_followingList);
		request.setAttribute("m_followingList", m_followingList);
		request.setAttribute("f_followerList", f_followerList);
		request.setAttribute("m_followerList", m_followerList);		
		
		//이동 ActionForward 객체 생성    
		// 방식,경로 저장
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/mypage.jsp");				
		return forward;
	}
	
}
