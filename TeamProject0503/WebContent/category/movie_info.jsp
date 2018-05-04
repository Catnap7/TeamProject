<%-- <%@page import="net.admin.manage.db.MovieBean"%> --%>
<%@page import="net.admin.manage.db.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="./js/jquery-3.3.1.js"></script>

<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/movie_info.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


 
</head>
<body>
<%	
int mv_num =Integer.parseInt(request.getParameter("mv_num"));
MovieBean moviebean =(MovieBean)request.getAttribute("moviebean");

String story = moviebean.getMv_story();
if(story != null){
		story = story.replaceAll( "\r\n","<br>");
	}
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

String genre="";
if(moviebean.getMv_genre().equals("animation")){
	genre="애니메이션";
}else if(moviebean.getMv_genre().equals("comedy")){
	genre="코미디";
}else if(moviebean.getMv_genre().equals("indie")){
	genre="독립영화";
}else if(moviebean.getMv_genre().equals("sf")){
	genre="sf";
}else if(moviebean.getMv_genre().equals("action")){
	genre="액션";
}else if(moviebean.getMv_genre().equals("thriller")){
	genre="스릴러";
}else if(moviebean.getMv_genre().equals("romance")){
	genre="로맨스";
}else if(moviebean.getMv_genre().equals("horror")){
	genre="공포";
}else if(moviebean.getMv_genre().equals("drama")){
	genre="드라마";
}

String age = "";
if(moviebean.getMv_age()==0){
	age = "전체이용가";
}else if(moviebean.getMv_age()==12){
	age = "12세이용가";
}else if(moviebean.getMv_age()==15){
	age="15세이용가";
}else if(moviebean.getMv_age()==19){
	age="청소년이용불가";
}
	
%>
<script type="text/javascript">

$(document).ready(function(){
	
	$('.next').click(function(){
		$('.steelcut').attr('src',"./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")%>"+"_s2.jpg"); // 스틸컷 2번째 이미지 소스
		$(this).css('display','none');
		$('.prev').css('display','block');
		return false;
	});
	
	$('.prev').click(function(){
		$('.steelcut').attr('src', "./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")%>"+"_s.jpg"); // 스틸컷 1번째 이미지 소스
		$(this).css('display','none');
		$('.next').css('display','block');
		return false;
	});
	
});
</script>
<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>
	<section>
	<div class="content">
	<div class="content_inner">
	  <div class="post">
	    <img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")+"_p.jpg"%>" width="500px" height="650px;"><br>
	  </div>
	  <div>
		<table class="content_table">
			<tr>
				<td><%=moviebean.getMv_kor_title() %> (<%=moviebean.getMv_year() %>) </td>
			</tr>
			<tr>
				<td><%=moviebean.getMv_eng_title() %></td>
			</tr>
			<tr>
				<td>
					<div class="star">
						<span class="fa fa-star checked star_rating"></span>
						<span class="fa fa-star checked star_rating"></span>
						<span class="fa fa-star checked star_rating"></span>
						<span class="fa fa-star checked star_rating"></span>
						<span class="fa fa-star checked star_rating"></span>
					</div>
					평균 평점 5 / 5
				</td>
			</tr>
			<tr>
				<td><%=genre%> | <%=moviebean.getMv_country() %></td>
			</tr>
			<tr>
				<td><%=moviebean.getMv_time() %>분  | <%=age %></td>
			</tr>
			<tr>
				<td>[감독] <%=moviebean.getMv_director() %></td>
			</tr>
			<tr>
				<td>[주연] <%=moviebean.getMv_actor() %></td>
			</tr>
		</table>
		 <span class="fa fa-heart checked-like like"></span><!-- checked-like 있으면 빨간색하트 -->
		  <a href="<%=moviebean.getMv_video() %>" class="fa fa-play-circle play" target="_blank"></a>
		</div>
	</div>
	</div>
	
	<div class="clear"></div>
	
	<div class="story">
	<hr>
		<p>
		<%=story%>
		</p>
	<hr>
	</div>
	
	<!--예고편  -->
	<div class="movie_preview">
	  <div>
		<iframe src=<%=moviebean.getMv_video() %>></iframe><br>
	  </div>
	</div>
	
	<!--스틸컷  -->
	<div class="movie_steel">
	  <div>
	  	<a href="#" class="prev" style="display: none;"><img alt="이전 이미지" src="./images/info_arrow_left.png" class="prev"></a>
		<img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")+"_s.jpg"%>" class="steelcut"><!-- 스틸컷 1번째 이미지 -->
		<a href="#" class="next"><img alt="다음 이미지" src="./images/info_arrow_right.png" class="next"></a>
	  </div>
	</div>
				
	<!--댓글   -->
	<div class="coment">
	<hr>
	  <!--댓글 쓰는 란  -->
	  <form action="" method="get" class="coment_write">
	    <textarea cols="90" rows="7" value placeholder="영화를 어떻게 보셨나요?"></textarea>
	    <input type="submit" value="등록">
	  </form>
	  <!-- 댓글 리스트 -->
	  
	  <table>
	    <tr>
	      <td class="c_name">홍길동</td>
	    </tr>
	    <tr>
	      <td>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻ<br>ㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
	    </tr>
	    <tr>
	      <td>추천 22 / 신고 1</td>
	    </tr>
	    <tr>
	      <td>18-05-03</td>
	    </tr>
	    <!-- 본인이면  (수정 삭제) 보이기 본인이 아니면 (추천 신고) 보이기 -->
	    <tr>
	      <td><a href="#">수정</a> | <a href="#">삭제</a></td>
	    </tr>
	  </table>
	  <hr class="coment_sec">
	  
	  <table>
	    <tr>
	      <td class="c_name">이순신</td>
	    </tr>
	    <tr>
	      <td>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻ<br>ㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
	    </tr>
	    <tr>
	      <td>추천 0 / 신고 0</td>
	    </tr>
	    <tr>
	      <td>18-05-03</td>
	    </tr>
	    <tr>
	      <td><a href="#">추천</a> | <a href="#">신고</a></td>
	    </tr>
	  </table>
	  <hr class="coment_sec">
	  
	  <table>
	    <tr>
	      <td class="c_name">이순신</td>
	    </tr>
	    <tr>
	      <td>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻ<br>ㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
	    </tr>
	    <tr>
	      <td>추천 0 / 신고 0</td>
	    </tr>
	    <tr>
	      <td>18-05-03</td>
	    </tr>
	    <tr>
	      <td><a href="#">추천</a> | <a href="#">신고</a></td>
	    </tr>
	  </table>
	  <hr class="coment_sec">
	  
	  <table>
	    <tr>
	      <td class="c_name">이순신</td>
	    </tr>
	    <tr>
	      <td>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻ<br>ㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
	    </tr>
	    <tr>
	      <td>추천 0 / 신고 0</td>
	    </tr>
	    <tr>
	      <td>18-05-03</td>
	    </tr>
	    <tr>
	      <td><a href="#">추천</a> | <a href="#">신고</a></td>
	    </tr>
	  </table>
	  <hr class="coment_sec">
	  
	  <table>
	    <tr>
	      <td class="c_name">이순신</td>
	    </tr>
	    <tr>
	      <td>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻ<br>ㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
	    </tr>
	    <tr>
	      <td>추천 0 / 신고 0</td>
	    </tr>
	    <tr>
	      <td>18-05-03</td>
	    </tr>
	    <tr>
	      <td><a href="#">추천</a> | <a href="#">신고</a></td>
	    </tr>
	  </table>
	  <hr class="coment_sec">
	  
	<div class="prev_next">
	  <a href="#">prev</a>
	  <a href="#">1</a>
	  <a href="#">2</a>
	  <a href="#">3</a>
	  <a href="#">next</a>
	</div>

	</div>
						
	</section>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>