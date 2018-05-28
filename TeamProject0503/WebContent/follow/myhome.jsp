<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.favorite.db.FavoriteBean"%>
<%@page import="net.member.db.MemberBean"%>
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
<link href="./css/followList.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

<!-- 팔로우 리스트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<%
MemberBean getmember=(MemberBean)request.getAttribute("memberbean");

int followercount=((Integer)request.getAttribute("followercount"));
int followingcount= ((Integer)request.getAttribute("followingcount"));
int reviewcount= ((Integer)request.getAttribute("reviewcount"));
MovieBean favorite = (MovieBean)request.getAttribute("moviebean");
MovieBean favorite2=(MovieBean)request.getAttribute("moviebean2");
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
<div class="all">

<section class="sec myInfo">
	<div id="profile">
		<img src="./images/proflie_img/proflie<%=getmember.getM_pic()%>.png" width="200px" height="200px">
		<p><%=getmember.getM_name()%></p><p><%=grade%></p> <!-- 이름, 등급 가져오기 -->
	</div><!-- profile -->
	<div id="info">
		<table>
			<tr>
				<th>Following</th><td data-toggle="modal" data-target="#following"><a href=""><%=followingcount%></a></td>
			</tr>
			<tr>	
				<th>Follower</th><td data-toggle="modal" data-target="#follower"><a href=""><%=followercount%></a></td><!-- 팔로잉, 팔로워 수 가져오기 --> 
			</tr>		
			<tr>
				<th>리뷰 수</th><td><%=reviewcount%></td><!-- 리뷰 수 가져오기 -->
			</tr>
			<tr>
				<th>선호장르</th>
				<td>
					<%if(favorite==null){
						%>
						<%="선호장르 없음"%>
						<%
					}else{
						%>
						<%=genre%>
						<%
					} 
					%>
					<%=", " %>
					 <%if(favorite2==null){
						%>
						<%="선호장르 없음"%>
						<%
					}else{
						%>
						<%=genre2%>
						<%
					}
					%>
				</td> <!-- 선호장르 상위 2개 -->
			</tr>
		</table>
	</div><!-- info -->
</section><!-- myInfo -->



<!----------------------------------- 팔로잉 --------------------------------------------------------->  
 <div class="modal fade" id="following">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">팔로잉</h4>
        </div>
	
		<!--         내가 팔로잉 하는 한 사람  -->
		<div class="follow_div">
          <div class="photo">
		    <a href="http://www.naver.com"><img src="./images/m_cover.jpg" width="50px" height="50px"></a>
		  </div>
		  <a href="http://www.naver.com">gns@naver.com</a><br>
		  <span>김태훈</span>
		  <a href="http://www.naver.com" class="unfollow_a">언팔로우</a>
		</div>
		<div class="clear"></div>
		<!--         내가 팔로잉 하는 한 사람  -->
		
		<!--         내가 팔로잉 하는 한 사람  -->
		<div class="follow_div">
          <div class="photo">
		    <a href="http://www.naver.com"><img src="./images/m_cover.jpg" width="50px" height="50px"></a>
		  </div>
		  <a href="http://www.naver.com">gns@naver.com</a><br>
		  <span>김태훈</span>
		  <a href="http://www.naver.com" class="unfollow_a">언팔로우</a>
		</div>
		<div class="clear"></div>
		<!--         내가 팔로잉 하는 한 사람  -->
		
		<!--         내가 팔로잉 하는 한 사람  -->
		<div class="follow_div">
          <div class="photo">
		    <a href="http://www.naver.com"><img src="./images/m_cover.jpg" width="50px" height="50px"></a>
		  </div>
		  <a href="http://www.naver.com">gns@naver.com</a><br>
		  <span>김태훈</span>
		  <a href="http://www.naver.com" class="unfollow_a">언팔로우</a>
		</div>
		<div class="clear"></div>
		<!--         내가 팔로잉 하는 한 사람  -->
		
		<!--         내가 팔로잉 하는 한 사람  -->
		<div class="follow_div">
          <div class="photo">
		    <a href="http://www.naver.com"><img src="./images/m_cover.jpg" width="50px" height="50px"></a>
		  </div>
		  <a href="http://www.naver.com">gns@naver.com</a><br>
		  <span>김태훈</span>
		  <a href="http://www.naver.com" class="unfollow_a">언팔로우</a>
		</div>
		<div class="clear"></div>
		<!--         내가 팔로잉 하는 한 사람  -->
		
		<!--         내가 팔로잉 하는 한 사람  -->
		<div class="follow_div">
          <div class="photo">
		    <a href="http://www.naver.com"><img src="./images/m_cover.jpg" width="50px" height="50px"></a>
		  </div>
		  <a href="http://www.naver.com">gns@naver.com</a><br>
		  <span>김태훈</span>
		  <a href="http://www.naver.com" class="unfollow_a">언팔로우</a>
		</div>
		<div class="clear"></div>
		<!--         내가 팔로잉 하는 한 사람  -->
		
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
<!----------------------------------- 팔로잉 ---------------------------------------------------------> 

<!----------------------------------- 팔로워 --------------------------------------------------------->
  <div class="modal fade" id="follower">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">팔로워</h4>
        </div>
        
		<!--         나를 팔로우 하는 한 사람  -->
        <div class="follow_div">
          <div class="photo">
		    <a href="http://www.naver.com"><img src="./images/m_cover.jpg" width="50px" height="50px"></a>
		  </div>
		  <a href="http://www.naver.com">gns@naver.com</a><br>
		  <span>김태훈</span>
		  <a href="http://www.naver.com" class="follow_a">팔로잉</a>
		</div>
		<div class="clear"></div>
		<!--         나를 팔로우 하는 한 사람  -->
		
		<!--         나를 팔로우 하는 한 사람  -->
		<div class="follow_div">
          <div class="photo">
		    <a href="http://www.naver.com"><img src="./images/m_cover.jpg" width="50px" height="50px"></a>
		  </div>
		  <a href="http://www.naver.com">gns@naver.com</a><br>
		  <span>김태훈</span>
		  <a href="http://www.naver.com" class="unfollow_a">언팔로우</a>
		</div>
		<div class="clear"></div>
		<!--         나를 팔로우 하는 한 사람  -->
		  
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
<!----------------------------------- 팔로워 --------------------------------------------------------->

<section class="sec myReview">
	<div class="secInfo">
		<h3><%=getmember.getM_name()%>님 의 영화 리뷰</h3>
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
	

<section class="sec myFavMovie">
	<div class="secInfo">
		<h3><%=getmember.getM_name()%>님 이 좋아한 영화</h3>
		<a href="./FollowFavorite.fo"><p>영화 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->	
	</div>	
	
		<!-- ↓↓↓↓↓↓↓영화 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
	<!-- <div class="mvList" id="rv"> -->
		<div class="mvList"> 
			<%for(int i=0;i<=5;i++){%>
			<div>
				<!-- 회원이 좋아한 영화 최근 순 6개. 포스터 불러오기, 제목 불러오기 -->
				<a href=""><img src="./images/animation/Zootopia_p.jpg" width="190px" height="280px"></a>
				<p><%="주토피아" %></p>
			</div>
		<%} %>
		</div>
	<!-- </div> -->	
</section>
</div><!-- all -->
</article>
	


<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>