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
String grede="";
if(getmember.getM_grade()==1){
	grede="정회원";
}else if(getmember.getM_grade()==2){
	grede="VIP";
}
String genre="";
if(favorite!=null){
if(favorite.getMv_genre().equals("animation")){
	   genre="애니메이션";
	}else if(favorite.getMv_genre().equals("comedy")){
	   genre="코미디";
	}else if(favorite.getMv_genre().equals("indie")){
	   genre="독립영화";
	}else if(favorite.getMv_genre().equals("sf")){
	   genre="sf";
	}else if(favorite.getMv_genre().equals("action")){
	   genre="액션";
	}else if(favorite.getMv_genre().equals("thriller")){
	   genre="스릴러";
	}else if(favorite.getMv_genre().equals("romance")){
	   genre="로맨스";
	}else if(favorite.getMv_genre().equals("horror")){
	   genre="공포";
	}else if(favorite.getMv_genre().equals("drama")){
	   genre="드라마";
	}
}
String genre2="";
if(favorite2!=null){
if(favorite2.getMv_genre().equals("animation")){
	   genre2="애니메이션";
	}else if(favorite2.getMv_genre().equals("comedy")){
	   genre2="코미디";
	}else if(favorite2.getMv_genre().equals("indie")){
	   genre2="독립영화";
	}else if(favorite2.getMv_genre().equals("sf")){
	   genre2="sf";
	}else if(favorite2.getMv_genre().equals("action")){
	   genre2="액션";
	}else if(favorite2.getMv_genre().equals("thriller")){
	   genre2="스릴러";
	}else if(favorite2.getMv_genre().equals("romance")){
	   genre2="로맨스";
	}else if(favorite2.getMv_genre().equals("horror")){
	   genre2="공포";
	}else if(favorite2.getMv_genre().equals("drama")){
	   genre2="드라마";
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
		<img src="./images/proflie1.png" width="200px" height="200px">
		<p><%=getmember.getM_name()%></p><p><%=grede%></p> <!-- 이름, 등급 가져오기 -->
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
				<th>리뷰 수</th><td><%=reviewcount%></td><td></td><!-- 리뷰 수 가져오기 -->
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
				<%="," %>
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
<div class="clear"></div>
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

<div class="clear"></div>


<section class="sec myReview">
	<div class="secInfo">
		<h3><%=getmember.getM_name()%>님 의 리뷰</h3>
		<a href=""><p>리뷰 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->
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
		<h3><%=getmember.getM_id()%>님 이 좋아한 영화</h3>
		<a href=""><p>영화 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->	
	</div>	
	
		<!-- ↓↓↓↓↓↓↓영화 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
	<!-- <div class="mvList" id="rv"> -->
		<div class="mvList"> 
			<%for(int i=0;i<=5;i++){%>
			<div>
				<a href="#"><img src="./images/animation/Zootopia_p.jpg" width="220px" height="300px"></a><!-- 무비 인포로 연결/ 포스터 불러오기 -->
				<p><%="주토피아" %></p><!-- 영화 이름 불러오기 -->
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