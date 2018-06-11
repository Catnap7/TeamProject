<%@page import="net.follow.db.FollowBean"%>
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
<!-- jQuery -->
<script src="./js/jquery-3.3.1.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->

</head>
<body>
<%
MemberBean getmember=(MemberBean)request.getAttribute("memberbean");

int followercount=((Integer)request.getAttribute("followercount"));
int followingcount= ((Integer)request.getAttribute("followingcount"));
int reviewcount= ((Integer)request.getAttribute("reviewcount"));
MovieBean favorite = (MovieBean)request.getAttribute("moviebean");
//MovieBean favorite2=(MovieBean)request.getAttribute("moviebean2");
List top5reviewlist = (List)request.getAttribute("top5reviewlist");
List top5movielist = (List)request.getAttribute("top5movielist");
 List top5favoritelist = (List)request.getAttribute("top5favoritelist");
List f_followingList = (List)request.getAttribute("f_followingList");
List m_followingList = (List)request.getAttribute("m_followingList");
List f_followerList = (List)request.getAttribute("f_followerList");
List m_followerList = (List)request.getAttribute("m_followerList");
String id = (String)request.getAttribute("m_id");
String m_id=(String)session.getAttribute("m_id");
int myhomeFollowCheck = ((Integer)request.getAttribute("myhomeFollowCheck"));
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
/* String genre2="";

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
} */

%>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->


<article>
<div class="all">

<section class="sec myInfo">
	<div id="profile">
		<img src="./images/proflie_img/proflie<%=getmember.getM_pic()%>.png" width="200px" height="200px">
		<div id="pfName"><p><%=getmember.getM_name()%></p><p><%=grade%></p></div> <!-- 이름, 등급 가져오기 -->
	<div class="clear"></div>
	</div><!-- profile -->
	<div id="info">
		<table>
			<tr>
				<th>Following</th><td data-toggle="modal" data-target="#following" style="text-decoration: none; cursor: pointer;"><%=followingcount%></td>
			</tr>
			<tr>	
				<th>Follower</th><td data-toggle="modal" data-target="#follower" style="text-decoration: none; cursor: pointer;"><%=followercount%></td><!-- 팔로잉, 팔로워 수 가져오기 --> 
			</tr>		
			<tr>
				<th>리뷰 수</th><td><%=reviewcount%></td><!-- 리뷰 수 가져오기 -->
			</tr>
			<tr>
				<th>선호장르</th>
				<td>
					<%
					if(favorite==null ){
						%>
						<%="아직 선호장르가 없습니다"%>
						<%
					}else{
						%>
						<%=genre%>
						<%
					}
					%> 
				</td> <!-- 선호장르 상위 2개 -->
			</tr>
		</table>
	</div><!-- info -->
		<%
		if(m_id.equals(id)) {
		
		}else if(myhomeFollowCheck == 0) {
			%>
			<button class="FBtn" id="myhome_follow">
				<a>
				follow
				</a>
			</button>
			<%
		}else {
			%>
			<button class="FBtn" id="myhome_unfollow">
				<a>
				unfollow
				</a>
			</button>
			<%
		}
		%>
		<input type="hidden" id="m_id" value="<%=m_id %>">
		<input type="hidden" id="f_id" value="<%=id %>">
		
		<script type="text/javascript">
		
		$(document).ready(function() {
        	
        	$('#myhome_unfollow').click(function(){
        		var m_id = $('#m_id').val();
				var f_id = $('#f_id').val();
				
// 						alert($('#m_id').val());
// 						alert($('#f_id').val());
				
				$.ajax({
					type: "post",
					url: "./DeleteFollowerAction.fo",
					dataType: "html",
					data: {
						"m_id": m_id,
						"f_id": f_id,
					},
					success:function(data){
						alert("팔로우 끊기");
						location.reload();
					}
				});
        	});
        	
        	$('#myhome_follow').click(function(){
        		var m_id = $('#m_id').val();
				var f_id = $('#f_id').val();
				
// 						alert($('#m_id').val());
// 						alert($('#f_id').val());
				
				$.ajax({
					type: "post",
					url: "./InsertFollowerAction.fo",
					dataType: "html",
					data: {
						"m_id": m_id,
						"f_id": f_id,
					},
					success:function(data){
						alert("팔로잉 하기");
						location.reload();
					}
				});
        	});
        	
        });
			
		</script>
</section><!-- myInfo -->



<!----------------------------------- 팔로잉 --------------------------------------------------------->  
 <div class="modal fade" id="following">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">팔로잉</h4>
        </div>
        
        <%
        for(int i=0; i<f_followingList.size(); i++) {
        	FollowBean fbean = (FollowBean)f_followingList.get(i);
        	MemberBean mbean = (MemberBean)m_followingList.get(i);
        	List followingCheckList = (List)request.getAttribute("followingCheckList");
        	%>
        	<!--         내가 팔로잉 하는 한 사람  -->
			<div class="follow_div">
	          <div class="photo">
			    <a href="./FollowMyHome.fo?m_id=<%=fbean.getFo_following() %>"><img src="./images/proflie_img/proflie<%=mbean.getM_pic() %>.png" width="50px" height="50px"></a>
			  </div>
			  <a href="./FollowMyHome.fo?m_id=<%=fbean.getFo_following() %>"><%=fbean.getFo_following() %></a><br>
			  <span><%=mbean.getM_name() %></span>
			  <%
// 			  if(m_id.equals(id)) {
				  
			  if(m_id.equals(fbean.getFo_following())) {
				
			  }else if((Integer)followingCheckList.get(i) == 1) {
					  %>
	<!-- 				  서로 팔로우 할때 -->
					  <a id="f_unfollow<%=mbean.getM_name() %>" class="unfollow_a" style="cursor: pointer;">언팔로우</a>
					  <%
				  }else if((Integer)followingCheckList.get(i) == 0) {
					  %>
	<!-- 				  상대방만 나를 팔로우 할때 -->
					  <a id="f_following<%=mbean.getM_name() %>" class="follow_a" style="cursor: pointer;">팔로잉</a>
					  <%
				  }
// 			  }
			  %>

        	<input type="hidden" id="m_id<%=mbean.getM_name() %>" value="<%=m_id %>">
			<input type="hidden" id="f_id<%=mbean.getM_name() %>" value="<%=fbean.getFo_following() %>">
			  
			  <script type="text/javascript">
			  
		        $(document).ready(function() {
		        	
		        	$('#f_unfollow<%=mbean.getM_name() %>').click(function(){
		        		var m_id = $('#m_id<%=mbean.getM_name() %>').val();
						var f_id = $('#f_id<%=mbean.getM_name() %>').val();
						
<%-- 						alert($('#m_id<%=mbean.getM_name() %>').val()); --%>
<%-- 						alert($('#f_id<%=mbean.getM_name() %>').val()); --%>
						
						$.ajax({
							type: "post",
							url: "./DeleteFollowerAction.fo",
							dataType: "html",
							data: {
								"m_id": m_id,
								"f_id": f_id,
							},
							success:function(data){
								alert("팔로우 끊기");
								location.reload();
							}
						});
		        	});
		        	
		        	$('#f_following<%=mbean.getM_name() %>').click(function(){
		        		var m_id = $('#m_id<%=mbean.getM_name() %>').val();
						var f_id = $('#f_id<%=mbean.getM_name() %>').val();
						
<%-- 						alert($('#m_id<%=mbean.getM_name() %>').val()); --%>
<%-- 						alert($('#f_id<%=mbean.getM_name() %>').val()); --%>
						
						$.ajax({
							type: "post",
							url: "./InsertFollowerAction.fo",
							dataType: "html",
							data: {
								"m_id": m_id,
								"f_id": f_id,
							},
							success:function(data){
								alert("팔로잉 하기");
								location.reload();
							}
						});
		        	});
		        	
		        });
		        
       		 </script>
			  
			</div>
			<div class="clear"></div>
			<!--         내가 팔로잉 하는 한 사람  -->
        	<%
        }
        %>
		
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
        
        <%
        for(int i=0; i<f_followerList.size(); i++) {
        	FollowBean fbean = (FollowBean)f_followerList.get(i);
        	MemberBean mbean = (MemberBean)m_followerList.get(i);
        	List followCheckList = (List)request.getAttribute("followCheckList");
        	%>
        	
        	<!--         나를 팔로잉 하는 한 사람  -->
	        <div class="follow_div">
	          <div class="photo">
			    <a href="./FollowMyHome.fo?m_id=<%=fbean.getFo_id() %>"><img src="./images/proflie_img/proflie<%=mbean.getM_pic() %>.png" width="50px" height="50px"></a>
			  </div>
			  <a href="./FollowMyHome.fo?m_id=<%=fbean.getFo_id() %>"><%=fbean.getFo_id() %></a><br>
			  <span><%=mbean.getM_name() %></span>
			  <%
			  if(m_id.equals(fbean.getFo_id())) {
				
			  }else	if((Integer)followCheckList.get(i) == 1) {
					  %>
	<!-- 				  서로 팔로우 할때 -->
					  <a id="unfollow<%=mbean.getM_name() %>" class="unfollow_a" style="cursor: pointer;">언팔로우</a>
					  <%
				  }else if((Integer)followCheckList.get(i) == 0) {
					  %>
	<!-- 				  상대방만 나를 팔로우 할때 -->
					  <a id="following<%=mbean.getM_name() %>" class="follow_a" style="cursor: pointer;">팔로잉</a>
					  <%
				  }
// 			  }
			  %>

        	<input type="hidden" id="m_id<%=mbean.getM_name() %>" value="<%=m_id %>">
			<input type="hidden" id="f_id<%=mbean.getM_name() %>" value="<%=fbean.getFo_id() %>">
			  
			  <script type="text/javascript">
			  
		        $(document).ready(function() {
		        	
		        	$('#unfollow<%=mbean.getM_name() %>').click(function(){
		        		var m_id = $('#m_id<%=mbean.getM_name() %>').val();
						var f_id = $('#f_id<%=mbean.getM_name() %>').val();
						
<%-- 						alert($('#m_id<%=mbean.getM_name() %>').val()); --%>
<%-- 						alert($('#f_id<%=mbean.getM_name() %>').val()); --%>
						
						$.ajax({
							type: "post",
							url: "./DeleteFollowerAction.fo",
							dataType: "html",
							data: {
								"m_id": m_id,
								"f_id": f_id,
							},
							success:function(data){
								alert("팔로우 끊기");
								location.reload();
							}
						});
		        	});
		        	
		        	$('#following<%=mbean.getM_name() %>').click(function(){
		        		var m_id = $('#m_id<%=mbean.getM_name() %>').val();
						var f_id = $('#f_id<%=mbean.getM_name() %>').val();
						
<%-- 						alert($('#m_id<%=mbean.getM_name() %>').val()); --%>
<%-- 						alert($('#f_id<%=mbean.getM_name() %>').val()); --%>
						
						$.ajax({
							type: "post",
							url: "./InsertFollowerAction.fo",
							dataType: "html",
							data: {
								"m_id": m_id,
								"f_id": f_id,
							},
							success:function(data){
								alert("팔로잉 하기");
								location.reload();
							}
						});
		        	});
		        	
		        	
		        });
		        
       		 </script>
       		       
			</div>
			<div class="clear"></div>
			<!--         나를 팔로잉 하는 한 사람  -->
        	<%
        }
        %>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
<!----------------------------------- 팔로워 --------------------------------------------------------->

<section class="sec myReview">
	<div class="secInfo">
		<h3><%=getmember.getM_name()%>님의 리뷰</h3>
		<a href="./FollowReview.fo?m_id=<%=getmember.getM_id()%>"><p>리뷰 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->
	</div>	
	
	<!-- ↓↓↓↓↓↓↓리뷰 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
	<!-- <div class="rvList"> -->
	
			<%
			 if(top5reviewlist.size()==0){
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
			for(int i=0;i<top5reviewlist.size();i++){
				ReviewBean reviewbean = (ReviewBean)top5reviewlist.get(i);
			 	MovieBean moviebean= (MovieBean)top5movielist.get(i);
			 	String yymmdd =reviewbean.getR_date().toString();
			 			
				%>
			<div id="rv"> 
				<p><span id="reviewTitle"><%=moviebean.getMv_kor_title()%></span>
				<span id="reviewDate"><%=yymmdd.substring(0,10)%></span>
				<span id="reviewRecommand"><%="추천수  "%><%=reviewbean.getR_recommand()%></span>
				<%-- / <%=reviewbean.getR_report()%> --%></p>
				<p class="rvList"><%=reviewbean.getR_content().replaceAll("\r\n", "<br>")%></p>
			</div> 
			
			<%}
			}%>
	<!-- </div> -->	
</section>
	

<section class="sec myFavMovie">
	<div class="secInfo">
		<h3><%=getmember.getM_name()%>님이 좋아한 영화</h3>
		<a href="./FollowFavorite.fo?m_id=<%=getmember.getM_id()%>"><p>영화 더 보기 >></p></a><!-- reviewList.jsp로 가야함 -->	
	</div>	
	
		<!-- ↓↓↓↓↓↓↓영화 리스트 5개. for문 으로 돌릴 수 있으면 for문 사용해도 무방↓↓↓↓↓↓↓↓↓↓↓-->	
	<!-- <div class="mvList" id="rv"> -->
		<div class="mvList"> 
			<%
				if(top5favoritelist.size()==0){
					%>
					<div class="noFavContents">
						<!-- <img src="./images/noFavorite.png" width="140px" height="140px"> --> 
						<p><%="좋아요 누른 영화가 없습니다"%></p>
						<p><%="좋아하는 영화에 하트를 눌러주세요!"%></p>
					</div>

					<%
				}else{
				for(int i=0;i<top5favoritelist.size();i++){
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
			<div class="favMovies">
				<img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")%>_p.jpg" width="195px" height="280px"> 
				<p><%=moviebean.getMv_kor_title()%></p>
			</div>
		<%	}
				}%>
		</div>
	<!-- </div> -->	
</section>
</div><!-- all -->

<!-- <div class="up"><a href="#">▲<br>▲</a></div> -->


</article>
	


<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>