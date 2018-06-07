<%@page import="net.category.db.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="net.admin.manage.db.MovieBean"%>
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
<link href="./css/followReviews.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">


<body>

<%
//리뷰 출력을 위한 list
List<ReviewBean> followreviewlist=(List)request.getAttribute("followreviewlist");
List<MovieBean> followmovielist=(List)request.getAttribute("followmovielist");
%>
<%
MemberBean getmember=(MemberBean)request.getAttribute("memberbean");

int followercount=((Integer)request.getAttribute("followercount"));
int followingcount= ((Integer)request.getAttribute("followingcount"));
int reviewcount= ((Integer)request.getAttribute("reviewcount"));
MovieBean favorite = (MovieBean)request.getAttribute("moviebean");
MovieBean favorite2=(MovieBean)request.getAttribute("moviebean2");
List top5reviewlist = (List)request.getAttribute("top5reviewlist");
List top5movielist = (List)request.getAttribute("top5movielist");
 List top5favoritelist = (List)request.getAttribute("top5favoritelist");
/*  List top5movielist2 = (List)request.getAttribute("top5movielist2"); */
String grade="";
switch(getmember.getM_grade()){
case 1 : grade = "정회원"; break;
case 2 : grade = "VIP회원"; break;
}

String genre="";
if(favorite!=null){
switch(favorite.getMv_genre()){
case "animation" : genre="애니메이션"; break;
case "comedy" : genre="코미디"; break;
case "indie" : genre="독립영화"; break;
case "sf" : genre="sf"; break;
case "action" : genre="액션"; break;
case "thriller" : genre="스릴러"; break;
case "romance" : genre="로맨스"; break;
case "horror" : genre="공포"; break;
case "drama" : genre="드라마"; break;
}
}
String genre2="";
if(favorite2!=null){
switch(favorite2.getMv_genre()){
case "animation" : genre2="애니메이션"; break;
case "comedy" : genre2="코미디"; break;
case "indie" : genre2="독립영화"; break;
case "sf" : genre2="sf"; break;
case "action" : genre2="액션"; break;
case "thriller" : genre2="스릴러"; break;
case "romance" : genre2="로맨스"; break;
case "horror" : genre2="공포"; break;
case "drama" : genre2="드라마"; break;
}
}

%>
<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<article class="all">


<section class="sec myInfo">
	<div id="profile">
		<img src="./images/proflie_img/proflie<%=getmember.getM_pic()%>.png" width="100px" height="100px">
		<p><span><%=getmember.getM_name()%></span></p> <!-- 이름, 등급 가져오기 -->
	</div><!-- profile -->
	<div id="info">
		
				<p><span id="span1">Following</span><span><td data-toggle="modal" data-target="#following"><%=followingcount%></td></span>
				<span id="span1">Follower</span><span><td data-toggle="modal" data-target="#follower"><%=followercount%></td></span></p>
				<p><span id="span1">리뷰 수</span><span><%=reviewcount%></span></p>
				<p><span id="span1">선호장르</span>
				<span>
					<%if(favorite==null){
						%>
						<%="선호장르 없음"%>
					<% }else{
						%>
						<%=genre+", "%>
						<%
					} 
					%>
					 <%if(favorite2==null){
						%>
						<%-- <%="선호장르 없음"%> --%>
						<%
					}else{
						%>
						<%=genre2%>
						<%
					}
					%>
			</span></p>
	</div><!-- info -->
</section><!-- myInfo -->



	<section class="sec myReviewList">
				<%
			 if(followreviewlist.size()==0){
				 %>
				 <div id="rv"> 
				<%-- <p> <%=moviebean.getMv_kor_title() %> / <%=reviewbean.getR_date() %>/ <%=reviewbean.getR_recommand() %>/ <%=reviewbean.getR_report() %></p> --%>
					<div class="noReviewContents">
						<!-- <img src="./images/noReview.png" width="140px" height="140px">  -->
						<p><%="아직 리뷰가 없습니다"%></p>
						<p><%="영화를 본 후 내 감상을 리뷰로 남겨주세요!"%></p>
					
					</div>
				</div>
				 <%
			 }else{	
				
				for(int i=0;i<followreviewlist.size();i++){
				ReviewBean reviewbean=followreviewlist.get(i);
				MovieBean moviebean=followmovielist.get(i);
				%>
				<div id="rv"> 
					<p><span id="reviewTitle"><%=moviebean.getMv_kor_title()%></span>
					<span id="reviewDate"><%=reviewbean.getR_date()%></span>
					<span id="reviewRecommand"><%="추천수  "%><%=reviewbean.getR_recommand()%></span>
					<%-- / <%=reviewbean.getR_report()%> --%></p>
					<p class="rvList">
					<%=reviewbean.getR_content()%></p>
				</div> 
				<%}
				}%>
	</section>

<p class="up"><a href="#">▲<br>▲</a></p>

</article>



<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->
</head>







</body>
</html>