<%@page import="net.member.db.MemberBean"%>
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//FollowFavorite.fo?id=<%mv.getm_id%/>들고오기
//id값 챙겨왔다.

List<MovieBean> followfavoritelist=(List)request.getAttribute("followfavoritelist");
MemberBean getmember=(MemberBean)request.getAttribute("memberbean");
	
	


%>



<%
for(MovieBean mb: followfavoritelist){
	mb.getMv_kor_title();
	mb.getMv_eng_title();
	mb.getMv_director();
	mb.getMv_actor();
	
}
%>

<section class="sec myReview">
	<div class="secInfo">
		<h2><%=getmember.getM_id()%>님 의 리뷰</h2>
		<a href="./FollowReview.fo?m_id=<%=getmember.getM_id()%>"><p>리뷰 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->
	</div>	
	
	<!-- ↓↓↓↓↓↓↓리뷰 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
	<!-- <div class="rvList"> -->
			<%for(int i=0;i<=4;i++){ %>
			<div id="rv"> 
				<p>영화 제목/ 리뷰 날짜/ 추천/ 신고</p>
				<p class="rvList">
				<%="Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has "%></p>
			</div> 
			<%} %>
	<!-- </div> -->	
</section>






</body>
</html>