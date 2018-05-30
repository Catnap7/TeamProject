<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 리뷰 라인</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/myhome.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<article>
	<div class="all allList">
		<section class="sec myReviewList">
			<div class="secInfo">
				<h3><%="왓츄 실시간 REVIEWS"%></h3>
			</div>	
					<%for(int i=0;i<=4;i++){ %>
					<div id="rv"> 
						<p>pic 그림 /닉네임 / 영화 제목/ 리뷰 날짜/ 추천/ 신고</p>
						<p class="rvList">
						<%="Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has "%></p>
					</div> 
					<%} %>
		</section>
	</div>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>