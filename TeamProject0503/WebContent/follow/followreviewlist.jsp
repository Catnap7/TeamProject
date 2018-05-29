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
<link href="./css/myhome.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">


<body>
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

<article>
	<div class="all allList">


	<section class="sec myReviewList">
		<%-- <div id="profileList">
			<img src="./images/proflie_img/proflie<%=getmember.getM_pic()%>.png" width="200px" height="200px">
			<p><%=getmember.getM_name()%></p><p><%=grade%></p> <!-- 이름, 등급 가져오기 -->
		</div><!-- profile -->
		<div id="info">
			<table>
				<tr>
					<th>Following</th><td data-toggle="modal" data-target="#following"><%=followingcount%></td>
				</tr>
				<tr>	
					<th>Follower</th><td data-toggle="modal" data-target="#follower"><%=followercount%></td><!-- 팔로잉, 팔로워 수 가져오기 --> 
				</tr>		
				<tr>
					<th>리뷰 수</th><td><%=reviewcount%></td><!-- 리뷰 수 가져오기 -->
				</tr>
				<tr>
					<th>선호장르</th>
					<td>
						<%if(favorite==null){
							%><%="선호장르 없음"%>
						<%}else{%>
							<%=genre%>
						<%}%>
						<%=", " %>
						 <%if(favorite2==null){%>
							<%="선호장르 없음"%>
						<%}else{%>
							<%=genre2%>
						<%}%>
					</td> <!-- 선호장르 상위 2개 -->
				</tr>
			</table>
		</div><!-- info --> --%>
		<div class="secInfo">
			<h3><%="유저이름"%>님 의 영화 리뷰</h3>
		</div>	
				<%for(int i=0;i<=4;i++){ %>
				<div id="rv"> 
					<p>영화 제목/ 리뷰 날짜/ 추천/ 신고</p>
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
</head>







</body>
</html>