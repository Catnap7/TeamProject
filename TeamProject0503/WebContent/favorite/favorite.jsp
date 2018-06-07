<%@page import="java.util.List"%>
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.admin.manage.db.MovieDAO"%>
<%@page import="net.favorite.db.FavoriteBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄: 회원님이 보고 싶어 하는 영화</title>

  
<!-- js -->
<script src="../js/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/category.css" rel="stylesheet" type="text/css" media="screen"> 
 
<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">


</script> 
</head>





<body>
<%
String id = (String)session.getAttribute("m_id");
List<FavoriteBean> favoritelist = (List)request.getAttribute("favoritelist");
List<MovieBean> movielist = (List)request.getAttribute("movielist");
%>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->



<!-- 크롬 기준 -->



<!-- 아티클 -->
<article>

	<div class="container">
		
		
		<!--for문으로 반복 하시면 됩니다.아래의 디자인 예시 코드를 지우고 for문만 남기면 정상작동-->
<%-- 		<%for(int i=0;i<favoritelist.size();i++){
		MovieBean moviebean= movielist.get(i); --%>

	<%if(favoritelist.size()!=0) {%>
	
	<h2 id="favoriteTitle">회원님이 보고 싶어 하는 영화</h2> 
	<%
		for(int i=0;i<favoritelist.size();i++){
		MovieBean moviebean= (MovieBean)movielist.get(i);

		

		/* 스릴러, 호러 나눠진 영화 장르 thriller로 합쳐서 저장*/
		String img_genre= "";
		if(moviebean.getMv_genre().equals("animation")){
			img_genre="animation";
		}else if(moviebean.getMv_genre().equals("comedy")){
			img_genre="comedy";
		}else if(moviebean.getMv_genre().equals("indie")){
			img_genre="indie";
		}else if(moviebean.getMv_genre().equals("sf")){
			img_genre="sf";
		}else if(moviebean.getMv_genre().equals("action")){
			img_genre="action";
		}else if(moviebean.getMv_genre().equals("horror") || moviebean.getMv_genre().equals("thriller")){
			img_genre="thriller";
		}else if(moviebean.getMv_genre().equals("romance") || moviebean.getMv_genre().equals("drama")){
			img_genre="romance";
		}
		

		String age = "";
		switch(moviebean.getMv_age()){
		case 0  : age="전체이용가"; break;
		case 12	: age="12세이용가"; break;
		case 15	: age="15세이용가"; break;
		case 19 : age="청소년관람불가"; break;
		}
		
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
		imgname = imgname.replaceAll("\\p{Z}", "");%>
			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>"><div class="mv">
							<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
							<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
							<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
							<span class="mv_grade"><%=age%></span><!-- 등급 -->
							<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
							</div>
			</a>
		<%}
		}else{%>
			<div id="noMoreMovie"><!-- <p><i class="material-icons" style="font-size:48px;">warning</i></p><br> -->
				<p>아직 보고싶어요를 하나도 누르지 않으셨네요TT</p><br><br>
				<p><img src="./images/noFavorite.png" width="140px" height="140px"></p><br>
				<p>회원님이 보고 싶은 영화에 하트를 꾹 눌러주세요!</p><br><br>
				
			</div>	
		<%}%> 
		
	</div><!-- container -->
</article>
<!-- 아티클 영역 끝 --> 





<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>