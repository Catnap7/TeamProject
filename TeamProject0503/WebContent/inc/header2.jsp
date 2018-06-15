<%@page import="net.follow.db.FollowDAO"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="./js/main.js"></script>
<!-- <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script> -->
<script>
var a = 0
function start(){		
		if(a==0){
		//alert("0");	
		document.img1.src = "./images/alarm.png";	
		a=1;
		}else if(a==1){
			//alert("1");
			document.img1.src = "./images/alarm2.png";	
			a=0;
		}		
}
function alarm(){
	//alert("됩니다");
	setInterval("start()", 500);
}
</script>
<script>realtimeMain();</script>
<!-- 헤더 영역 -->
<%String id = (String)session.getAttribute("m_id");
/* int followercount=((Integer)request.getAttribute("followercount"));
int followingcount= ((Integer)request.getAttribute("followingcount"));  */

MemberBean getmember=(MemberBean)request.getAttribute("memberbean");

FollowDAO followdao = new FollowDAO();
int followercount= followdao.Followercount(id);
int followingcount= followdao.Followingcount(id);


%>
<div class="header">
	<div class="title_logo">
		<a href="./Main.ma"><img src="./images/watchu_logo.png" width="250px" height="50px"></a>
	</div>
	<link rel="shortcut icon" href="./images/watchu_logo.ico" type="image/x-icon">

<div class="clear"></div>

	<div class="rightInfo">
		<div id="h_follow">
			<div id="h_following">
				<p><%=followingcount %></p>
				<p>팔로잉</p>
			</div>
			<div id="h_follower">
				<p><%=followercount %></p>
				<p>팔로워</p>
			</div>		
		</div><!-- 팔로우 정보 -->		
		<%-- <%
		if(id.equals("admin")){
			String m_name="";
			m_name=(String)session.getAttribute("m_name");
			String alarm = (String)session.getAttribute("alarm_num");
			String id_name = "no_alarm";
			if(alarm==null){alarm="0";}
			int alarm_num = Integer.parseInt(alarm);	
			if(alarm_num>0){id_name="alarm";%>
				<script>alarm();</script>	
			<%}%>
			<div class="h_myinfo">
	  			<button class="h_dropbtn1"><%=m_name %></button>
					  <div class="h_dropdown-content1">
					    <a href="./Mypage.my">내정보보기</a>
					    <a href="./AdminManageList.am">관리자모드</a>
					    <a href="./Alarm.my">알림창</a>
					   <!--  <a href="./Myrating.my">평점내역</a> -->
					    <a href="./MemberLogout.me">로그아웃</a>
					  </div>
			</div><!-- 유저정보 -->
			<div><a href="./Alarm.my"><img src="./images/alarm2.png" id=<%=id_name %> name="img1"><span class="num"><%=alarm_num%></span></a></div>
			<!-- <div class="pay">
				<a href="./PayList.pa">이용권구매</a>
			</div> --><!--  이용권구매 -->
		<%}else{ --%>	
			<%String m_name="";
			m_name=(String)session.getAttribute("m_name");
			String alarm = (String)session.getAttribute("alarm_num");
			String id_name = "no_alarm";
			if(alarm==null){alarm="0";}
			int alarm_num = Integer.parseInt(alarm);	
			if(alarm_num>0){id_name="alarm";%>
				<script>alarm();</script>	
			<%}%>
			<div class="h_myinfo">
	  			<button class="h_dropbtn1"><%=m_name %></button>
					  <div class="h_dropdown-content1">
					    <a href="./Mypage.my">내정보보기</a>
					    <a href="./Coupon.my">쿠폰함</a>
					    <a href="./Alarm.my">알림창</a>
					    <a href="./Myrating.my">평점내역</a>
					    <a href="./MemberLogout.me">로그아웃</a>
					    <%if(id.equals("admin")){%>
					    <a href="./AdminManageList.am">관리자페이지</a>
					    <%}%>
					  </div>
			</div><!-- 유저정보 -->
			<div><a href="./Alarm.my"><img src="./images/alarm2.png" id=<%=id_name %> name="img1"><span class="num"><%=alarm_num%></span></a></div>
			<div class="pay">
				<a href="./PayList.pa">이용권구매</a>
			</div><!--이용권구매 -->
		</div><!-- rightInfo -->		
	<%-- <%} %>	 --%>
			
<div class="clear"></div>
	
		<div class="h_navbar">
		  	<div class="h_dropdown">
			    <button class="h_dropbtn2">CATEGORY</button>
			    <div class="h_dropdown-content">
			     	<a href="./CategoryList.ca?mv_genre=animation">애니메이션</a>
					<a href="./CategoryList.ca?mv_genre=thriller">공포/스릴러</a>
					<a href="./CategoryList.ca?mv_genre=indie">독립영화</a>
					<a href="./CategoryList.ca?mv_genre=romance">로맨스/드라마</a>
					<a href="./CategoryList.ca?mv_genre=action">액션</a>
					<a href="./CategoryList.ca?mv_genre=sf">SF</a>
					<a href="./CategoryList.ca?mv_genre=comedy">코미디</a>
			    </div>
	  		</div> 
	  		<a href="./Rating.ra">취향분석</a>
		 	<a href="./Favorite.fa">보고 싶은 영화</a>
			<div class="h_dropdown">
			    <button class="h_dropbtn2">WATCHUGRAM</button>
			    <div class="h_dropdown-content">
			     	<a href="./FollowMyHome.fo?m_id=<%=id%>">마이왓츄</a>
					<a href="./TimeLine.fo">왓츄 로그</a>
			    </div>
	  		</div> 
	  		<a href="./VipInfo.vi">watchu vip</a>
		
		 	<div class="search-container">
			    <form action="./MainSearch.ma" method="get">
			      <input type="text" placeholder="Search.." name="search">
			      <button type="submit" class="searchBtn"><img src="./images/search.png" width="20px" height="20px"></button>
			    </form>
			</div><!-- 검색창 -->
		</div><!--메인메뉴 -->
<div class="clear"></div>
</div>
<!-- 헤더 영역 -->