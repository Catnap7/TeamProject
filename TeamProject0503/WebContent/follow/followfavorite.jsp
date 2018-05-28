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
<link href="./css/myhome.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">


<body>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->


<%
//FollowFavorite.fo?id=<%mv.getm_id%/>들고오기
//id값 챙겨왔다.

/* List<MovieBean> followfavoritelist=(List)request.getAttribute("followfavoritelist");
MemberBean getmember=(MemberBean)request.getAttribute("memberbean");
	
	 */


%>



<%
/* for(MovieBean mb: followfavoritelist){
	mb.getMv_kor_title();
	mb.getMv_eng_title();
	mb.getMv_director();
	mb.getMv_actor();
	
} */
%>

<article>
<section class="sec myFavMovie">
	<div class="secInfo">
		<h2><%="유저이름"%>님 이 좋아한 영화</h2>
	</div>	
	
	<!-- ↓↓↓↓↓↓↓영화 리스트6개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
		<%-- <div class="mvList"> 
			<%for(int i=0;i<top5favoritelist.size();i++){
				MovieBean moviebean=(MovieBean)top5favoritelist.get(i);
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
			<div>
				<img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")%>_p.jpg" width="175px" height="260px">
				<p><%=moviebean.getMv_kor_title()%></p>
			</div>
		<%} %>
		</div> --%>
		
		
		<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓디자인 예시를 위한 코드. 위의 for문 완성 한 후에 지워도 무방 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
		<div class="mvList"> 
			<%for(int i=0;i<=5;i++){%>
			<div>
				<img src="./images/action/IronMan3_p.jpg" width="175px" height="260px">
				<p><%="아이언맨3"%></p>
			</div>
		<%} %>
		</div>
		<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑디자인 예시를 위한 코드. 위의 for문 완성 한 후에 지워도 무방 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↓-->
		
		
</section>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->
</head>



</body>
</html>