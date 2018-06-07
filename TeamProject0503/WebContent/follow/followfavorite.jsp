<%@page import="net.member.db.MemberBean"%>
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄: 좋아하는 영화</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<!-- <link href="./css/myhome.css" rel="stylesheet" type="text/css">-->
<link href="./css/followReviews.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">


<body>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->


<%
//FollowFavorite.fo?id=<%mv.getm_id%/>들고오기
//id값 챙겨왔다.

List<MovieBean> followfavoritelist=(List)request.getAttribute("followfavoritelist");

String m_name="";
m_name=(String)session.getAttribute("m_name");
	 
	 
%>
<article class="all">
<section class="sec myFavMovie">
	<div class="secInfo">
		<h2><%=m_name%>님 이 좋아한 영화</h2>
	</div>	
			
		<div class="mvList"> 
			<%for(MovieBean moviebean: followfavoritelist){
				
				String imgname = moviebean.getMv_eng_title().replaceAll(" " , "");
				imgname = imgname.replaceAll("\\p{Z}", "");
				
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
			%>
			<div id="fvfv">
				<img src="./images/<%=img_genre %>/<%=imgname %>_p.jpg" width="175px" height="260px">
				<p><%=moviebean.getMv_kor_title()%></p>
			</div>
		<%} %>
		</div>
		
		
</section>

<p class="up2"><a href="#">▲<br>▲</a></p>

</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->
</head>



</body>
</html>