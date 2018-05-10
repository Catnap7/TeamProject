<%-- <%@page import="net.admin.manage.db.MovieBean"%> --%>
<%@page import="net.category.db.ReviewBean"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.rating.db.RatingBean"%>
<%@page import="java.util.List"%>
<%@page import="net.favorite.db.FavoriteBean"%>
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

<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

/*@@@@@@float를 지우면 별5개가 전부 좌측 배열 되요.  */
.rating { 
  border: none;
  float: left; 
}

.rating > input { display: none; } 

/*@@@@@@@ 별점 이미지 바꿀때 사용  */
.rating > label:before { 
  margin: 5px;
/*   font-size: 1.25em; */
   font-size: 2em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

/*@@@@@@@ float 지우면 별점 css가 반대로 먹혀요. */
.rating > label { 
  color: #ddd; 
  float: right;
}

/*@@@@@@@@@@ 별점 줄때 색이 변하는 css  */
/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
</style>
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/rating.js"></script>
<script src="./js/favorite.js"></script>
</head>
<body>
<%
String id = (String)session.getAttribute("m_id");
int mv_num =Integer.parseInt(request.getParameter("mv_num"));
MovieBean moviebean =(MovieBean)request.getAttribute("moviebean");
FavoriteBean favoritebean = (FavoriteBean)request.getAttribute("favoritebean");
RatingBean ratingBean = (RatingBean)request.getAttribute("ratingBean");
float avg = (float)request.getAttribute("avg");
MemberBean memberBean = (MemberBean)request.getAttribute("memberbean");

int ra_rating =ratingBean.getRa_rating();
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

	<script>
	
	
	function abc(c) {
//		alert(c);
//c는 체크해야 하는 아이디값
		$(document).ready(function(){
				
			$("[id="+c+"]").attr( "checked", "checked" );
		});
	}
	
/* 	
	$(document).ready(function(){
		//string2.jsp에
		//파라미터값 넘겨서data:{name:"홍길동", age:21}
		//결과 받아서 body 태그 뒷부분에 추가
		
		$(".rating").addClass("pp");

		$(".pp").checked = false;
		
	});
	 */
	
	//
	
	
	</script>
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
					<form action="" id="starform<%=mv_num %>">
				<input type="hidden" name="ra_p_num" value="<%=mv_num %>">
				<script type="text/javascript">
					abc("star"+<%=ra_rating%>+<%=mv_num%>);
				</script>
				<!-- 별점 시작 -->
				<fieldset class="rating" id="starfield<%=mv_num %>" >
				    <input type="radio" id="star5<%=mv_num %>" name="ra_rating" value="5" /><label class = "full" for="star5<%=mv_num %>" title="5 stars"></label>
				    <input type="radio" id="star4<%=mv_num %>" name="ra_rating" value="4" /><label class = "full" for="star4<%=mv_num %>" title="4 stars"></label>
				    <input type="radio" id="star3<%=mv_num %>" name="ra_rating" value="3" /><label class = "full" for="star3<%=mv_num %>" title="3 stars"></label>
				    <input type="radio" id="star2<%=mv_num %>" name="ra_rating" value="2" /><label class = "full" for="star2<%=mv_num %>" title="2 stars"></label>
				    <input type="radio" id="star1<%=mv_num %>" name="ra_rating" value="1" /><label class = "full" for="star1<%=mv_num %>" title="1 star"></label>
				</fieldset>
				<!-- 별점 끝 -->
				</form>
					평균 평점 <%=avg %> / 5
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
		<!--즐겨찾기  -->
		<%
		if(favoritebean !=null){
		if(favoritebean.getF_id()!=null && favoritebean.getF_num()==mv_num)
		{
	%>		
		<form action="" id="starform<%=mv_num %>">
				<input type="hidden" name="f_num" value="<%=mv_num %>">
				<fieldset class="rating" id="starfield<%=mv_num %>" >
				    <input type="checkbox" id="favorite" name="fa_favorite" checked="checked"/><label class = "full" for="favorite" title="1 star"></label>
				</fieldset>
		</form>
	<%		
		}
		}else{
	%>
		<form action="" id="starform<%=mv_num %>">
			<input type="hidden" name="f_num" value="<%=mv_num %>">
			<fieldset class="rating" id="starfield<%=mv_num %>" >
			    <input type="checkbox" id="favorite" name="fa_favorite" /><label class = "full" for="favorite" title="1 star"></label>
			</fieldset>
		</form>
	<%
		}
			%>
			
		<%
		if(memberBean.getM_grade()==0){
			%>
			<script type="text/javascript">
			$(document).ready(function(){
				$('.hr').click(function(){
					alert("결제 후 이용 가능합니다.");
					});
			});		
			</script>
		<%	
		}else if(memberBean.getM_grade()==1){
			if(memberBean.getM_id_num1()<=991231 && moviebean.getMv_age()==19 ){
				
				 %>
				  <script type="text/javascript">
				  var url = $('hr').attr('href','<%=moviebean.getMv_video()%>');
					$(document).ready(function(){
						$('.hr').click(function(){
							 window.open('<%=moviebean.getMv_video()%>','_blank')
							});
						
					});			  
				  </script>
				  <%
			}else if (memberBean.getM_id_num1()>=000101 && moviebean.getMv_age()==19){
				%>
					<script type="text/javascript">
					$(document).ready(function(){
						$('.hr').click(function(){
							alert("19세 미만은 사용하실 수 없습니다.");
							return attributes;
							});
					});		
					</script>
				<%	
				}
			 %>
			  <script type="text/javascript">
				$(document).ready(function(){
					$('.hr').click(function(){
						 window.open('<%=moviebean.getMv_video()%>','_blank') 
						});
					
				});			  
			  </script>
			  <%
		}
		
		%>
			  <button class="hr"> 이동</button>
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
		<iframe src=<%=moviebean.getMv_video()%>></iframe><br>
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
	  <form action="./InsertReview.ca" class="coment_write">
	    <textarea cols="90" rows="7" value placeholder="영화를 어떻게 보셨나요?" name="r_content"></textarea>
	    <input type="hidden" name="mv_num" value="<%=moviebean.getMv_num() %>">
	    <input type="submit" value="등록">
	  </form>
	  <!-- 댓글 리스트 -->
 	 <%
 	 List reviewList = (List)request.getAttribute("reviewList");
 	 
 	 for(int i=0; i<reviewList.size(); i++) {
 		 ReviewBean reviewbean = (ReviewBean)reviewList.get(i);
 		 if(moviebean.getMv_num()==reviewbean.getR_p_num()) {
 			 %>
 			 <table> 
 			    <tr>
 			      <td class="c_name"><%=reviewbean.getR_id() %></td>
 			    </tr>
 			    <tr>
 			      <td><%=reviewbean.getR_content() %></td>
 			    </tr>
 			    <tr>
 			      <td>추천 <%=reviewbean.getR_recommand() %> / 신고 <%=reviewbean.getR_report() %></td>
 			    </tr>
 			    <tr>
 			      <td><%=reviewbean.getR_date() %></td>
 			    </tr>
<!--  			    본인이면  (수정 삭제) 보이기 본인이 아니면 (추천 신고) 보이기  -->
				<%
				if(reviewbean.getR_id().equals(id)) {
					%>
					<tr>
 			      	  <td><a href="./ModifyReview.ca?mv_num=<%=moviebean.getMv_num() %>">수정</a> | <a href="./DeleteReview.ca?r_num=<%=reviewbean.getR_num() %>&mv_num=<%=moviebean.getMv_num() %>">삭제</a></td>
 			    	</tr>
					<%
				}else {
					%>
					<tr>
 			          <td><a href="#">추천</a> | <a href="#">신고</a></td>
 			    	</tr>
					<%
				}
				%>
 			    
 			  </table>
 			  <hr class="coment_sec">
 			  <%
 		 }
 	 }
 	 %>
	  
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