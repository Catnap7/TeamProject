<<<<<<< HEAD
<%@page import="net.follow.db.TimeLineBean"%>
<%@page import="java.util.List"%>
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
<%List timeline=(List)request.getAttribute("timelinelist"); 

%>
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<article>
	<div class="all allList">
		<section class="sec myReviewList">
			<div class="secInfo">
				<h3><%="왓츄 실시간 REVIEWS"%></h3>
			</div>	
					<%for(int i=0; i<timeline.size(); i++){ 
						TimeLineBean timeLineBean =  (TimeLineBean)timeline.get(i);
						String kind="";
						switch(timeLineBean.getKind()){
							case "rating" : kind="별점"; break;
							case "favorite" : kind="즐겨찾기"; break;
							case "review" : kind="리뷰"; break;
						}
					%>
					<div id="rv"> 
						<%=timeLineBean.getFo_following()+ "님이" +timeLineBean.getTitle()+ "에" +kind+"를(을) 주었습니다."%></p>
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