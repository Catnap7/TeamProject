<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.category.db.ReviewBean"%>
<%@page import="net.member.db.MemberBean"%>
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
<link href="./css/timeline.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<%List timeline=(List)request.getAttribute("timelinelist"); 
/* List timelinemovie=(List)request.getAttribute("timelinemovie");
List timelinereview=(List)request.getAttribute("timelinereview"); */
%>
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<article>
	<div class="all allList">
		<section class="logList">
			<div class="secInfo">
				<p><%="WATCHU LOG 왓츄로그"%></p>
			</div>	
				<%if(timeline.size()!=0){ %>
			
					<%for(int i=0; i<timeline.size(); i++){ 
						TimeLineBean timeLineBean =  (TimeLineBean)timeline.get(i);
						String kind="";
						switch(timeLineBean.getKind()){
							case "rating" : kind="별점을 주었습니다."; break;
							case "favorite" : kind="즐겨찾기를 추가 하였습니다."; break;
							case "review" : kind="리뷰를 남겼습니다."; break;
						}
						String img_genre= "";
						if(timeLineBean.getGenre().equals("animation")){
						   img_genre="animation";
						}else if(timeLineBean.getGenre().equals("comedy")){
						   img_genre="comedy";
						}else if(timeLineBean.getGenre().equals("indie")){
						   img_genre="indie";
						}else if(timeLineBean.getGenre().equals("sf")){
						   img_genre="sf";
						}else if(timeLineBean.getGenre().equals("action")){
						   img_genre="action";
						}else if(timeLineBean.getGenre().equals("horror") || timeLineBean.getGenre().equals("thriller")){
						   img_genre="thriller";
						}else if(timeLineBean.getGenre().equals("romance") || timeLineBean.getGenre().equals("drama")){
						   img_genre="romance";
						}
						String yymmdd=timeLineBean.getDate().toString();
					%>
					
					<div id="rv">
						<div id="rvProfile"><span><img src="./images/proflie_img/proflie<%=timeLineBean.getPic()%>.png" width="60px" height="60px"></span><span><%=yymmdd.substring(0,16)%></span><span><%=timeLineBean.getName()%></span></div>
						<div id="rvMv">
							<p id="rvPos"><img src="./images/<%=img_genre%>/<%=timeLineBean.getEngtitle().replaceAll(" ","")+"_p.jpg"%>" width="180px" height="250px;"></p> 
							<p id="rvStill"><img src="./images/<%=img_genre%>/<%=timeLineBean.getEngtitle().replaceAll(" ","")+"_s.jpg"%>" width="350px" height="250px;"></p> 
						</div>
							<p id="rvMent"><a href="./FollowMyHome.fo?m_id=<%=timeLineBean.getFo_following()%>"><span><%=timeLineBean.getName()%></span></a><%="님이   " +timeLineBean.getTitle()+ "에  "+kind%></p>
					</div> 
					<%} 
				}else{%>
					<div id="noFollow">
						<p><img src="./images/following.png" width="80px" height="80px"></p>
						<p>마음에 드는 리뷰를 쓰는 다른 왓츄 회원을 팔로우 하고<br>
							관심 회원의 왓츄 활동을 실시간으로 알아보세요!</p>
					</div>
				
				<%}%>
					
		</section>
	</div>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>