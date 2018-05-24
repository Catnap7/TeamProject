<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄: My Watchu Page</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/myhome.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">


</head>
<body>
<%

%>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<article>

<section class="myInfo">
	<div id="profile">
		<img src="">
		<p><%="김와츄"%></p><p><%="등급"%></p> <!-- 이름, 등급 가져오기 -->
	</div><!-- profile -->
	<div id="info">
		<table>
			<tr>
				<th>Following</th><td><%="50"%></td><th>Follower</th><td><%="100"%></td> <!-- 팔로잉, 팔로워 수 가져오기 -->
			</tr>
			<tr>
				<th>리뷰 수</th><td><%="250"%></td><!-- 리뷰 수 가져오기 -->
			</tr>
			<tr>
				<th>선호장르</th><td><%="SF"%></td><td><%="드라마"%></td> <!-- 선호장르 상위 2개 -->
			</tr>
		</table>
	</div><!-- info -->
</section><!-- myInfo -->


<section class="myReview">
	<div class="secInfo">
		<h2><%="김와츄"%>님 의 리뷰</h2>
		<a href=""><p>리뷰 더 보기</p></a><!-- reviewList.jsp로 가야함 -->
	</div>	
	
	<!-- ↓↓↓↓↓↓↓리뷰 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
	<div class="rvList">
		<%for(int i=0;i<=5;i++){ %>
			<div id="rv"+i>
				<p>영화 제목</p>
				<p>리뷰 날짜</p>
				<p><%="리뷰를 가져와"%></p>
				<p>추천</p>
				<p>신고</p>
			</div>
		<%} %>
	</div>	
	<!-- ↑↑↑↑↑↑↑↑↑↑리뷰 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↑↑↑↑↑↑↑↑↑↑-->	
</section><!-- myReview -->

<section class="myFavMovie">
	<div class="secInfo">
		<h2><%="김와츄"%>님 이 좋아한 영화</h2>
		<a href=""><p>더 보기</p></a><!-- reviewList.jsp로 가야함 -->
	</div>
	<div class="mvList">
		<img src="">
		<p>영화 제목</p>
	</div>
</section>



</article>



<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>