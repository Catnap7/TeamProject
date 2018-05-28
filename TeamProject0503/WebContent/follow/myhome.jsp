<%@page import="net.category.db.ReviewBean"%>
<%@page import="java.util.List"%>
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
		<h2><%=getmember.getM_name()%>님 의 리뷰</h2>
		<a href="./FollowReview.fo"><p>리뷰 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->
	</div>	
	
	<!-- ↓↓↓↓↓↓↓리뷰 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
	<!-- <div class="rvList"> -->
			<%for(int i=0;i<top5reviewlist.size();i++){
				ReviewBean reviewbean = (ReviewBean)top5reviewlist.get(i);
			 	MovieBean moviebean= (MovieBean)top5movielist.get(i);
			 	
				%>
			<div id="rv"> 
				<p> <%=moviebean.getMv_kor_title() %> / <%=reviewbean.getR_date() %>/ <%=reviewbean.getR_recommand() %>/ <%=reviewbean.getR_report() %></p>
				<p class="rvList">
				<%=reviewbean.getR_content()%></p>
			</div> 
			<%} %>
	<!-- </div> -->	
</section>
	

<section class="sec myFavMovie">
	<div class="secInfo">
		<h2><%=getmember.getM_name()%>님 이 좋아한 영화</h2>
		<a href="./FollowFavorite.fo"><p>영화 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->	
	</div>	
	
		<!-- ↓↓↓↓↓↓↓영화 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
	<!-- <div class="mvList" id="rv"> -->
		<div class="mvList"> 
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