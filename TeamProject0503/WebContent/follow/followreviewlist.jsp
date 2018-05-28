<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄: Review List</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/myhome.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">


<body>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<article>
	<div class="all">
	<section class="sec myReview">
		<div class="secInfo">
			<h3><%="유저이름"%>님 의 영화 리뷰</h3>
			<a href="./FollowReview.fo"><p>리뷰 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->
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
	</div>
</article>



<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->
</head>







</body>
</html>