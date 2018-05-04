<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 영역 -->
<header>
	<div class="title_logo">
		<a href="./Main.me"><img src="./images/watchu_logo.png" width="250px" height="50px"></a>
	</div>
	
<div class="clear"></div>

		
		<div class="pay">
			<a href="../pay/payment.jsp">이용권구매</a>
		</div><!--이용권구매 -->
		
		<%String m_id=(String)session.getAttribute("m_id");%>

		<div class="myinfo">
  			<button class="dropbtn1"><%=m_id %></button>
				  <div class="dropdown-content1">
				    <a href="../member/mypage.jsp">내정보보기</a>
				    <a href="./Coupon.my">쿠폰함</a>
				    <a href="./Alarm.my">알림창</a>
				    <a href="./Myrating.my">평점내역</a>
				    <a href="./MemberLogout.me">로그아웃</a>
				  </div>
		</div><!-- 유저정보 -->
				
<div class="clear"></div>
	
		<div class="navbar">
		  	<div class="dropdown">
			    <button class="dropbtn">CATEGORY</button>
			    <div class="dropdown-content">
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
		 	<a href="../favorite/favorite.jsp">보고 싶은 영화</a>
		 	<a href="../vip/vip_reservation.jsp">only for vip</a>
		
		 	<div class="search-container">
			    <form action="category_search.jsp">
			      <input type="text" placeholder="Search.." name="search">
			      <button type="submit" class="searchBtn"><img src="./images/search.png" width="20px" height="20px"></button>
			    </form>
			</div><!-- 검색창 -->
		</div><!--메인메뉴 -->
</header>

<!-- 헤더 영역 -->