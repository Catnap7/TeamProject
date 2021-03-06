<%-- <%@page import="net.admin.manage.db.MovieBean"%> --%>
<%@page import="net.follow.db.FollowBean"%>
<%@page import="net.category.db.RecChkBean"%>
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
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄 : WATCHU</title>

<!-- jQuery -->
<script src="./js/jquery-3.3.1.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- cs -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/movie_info.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 웹폰트 -->
<!-- <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> -->


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

/* 좋아요  */
.like > input { display: none; } 

/*@@@@@@@ 별점 이미지 바꿀때 사용  */
.like > label:before { 
/*   margin: 5px; */
/*   font-size: 1.25em; */
   font-size: 2em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f004";
}

/*@@@@@@@ float 지우면 별점 css가 반대로 먹혀요. */
.like > label { 
  color: #ddd; 
  float: right;
}

/*@@@@@@@@@@ 별점 줄때 색이 변하는 css  */
/***** CSS Magic to Highlight Stars on Hover *****/

.like > input:checked ~ label, /* show gold star when clicked */
.like:not(:checked) > label:hover, /* hover current star */
.like:not(:checked) > label:hover ~ label { color: red;  } /* hover previous stars in list */

.like > input:checked + label:hover, /* hover current star when changing rating */
.like > input:checked ~ label:hover,
.like > label:hover ~ input:checked ~ label, /* lighten current selection */
.like > input:checked ~ label:hover ~ label { color: red;  } 
/* 좋아요  */
</style>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/rating.js"></script>


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
switch(moviebean.getMv_genre()){
case "animation" : genre="애니메이션"; break;
case "comedy" 	 : genre="코미디"; break;
case "indie"	 : genre="독립영화"; break;
case "sf" 		 : genre="SF"; break;
case "action"	 : genre="액션"; break;
case "thriller"  : genre="스릴러"; break;
case "romance"   : genre="로맨스"; break;
case "horror"    : genre="공포"; break;
case "drama"     : genre="드라마"; break;
}

String age = "";

switch(moviebean.getMv_age()){
case 0  : age="전체이용가"; break;
case 12	: age="12세이용가"; break;
case 15	: age="15세이용가"; break;
case 19 : age="청소년관람불가"; break;
}

   
%>

   <script>
   
   
   function abc(c) {
      $(document).ready(function(){
            
         $("[id="+c+"]").attr( "checked", "checked" );
      });
   }
   
   
   
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

<script type="text/javascript">
	$(document).ready(function(){

	
	$('#favorite').click(function(){
		var m_id = $('#m_id').val();
		var mv_num =$('#mv_num').val(); 
			$.ajax({
				type:"post",
				url:"./FavoriteAction.fa",
				data:{
					"m_id":m_id,"f_num":mv_num
				},
				success:function(data){
					if(data==1){
					alert("즐겨찾기에 추가 되었습니다.")
					$('.fa_full').css('color','red');
					}
					
					if(data==-1){
					alert("즐겨찾기가 삭제 되었습니다.")
					$('.fa_full').css('color','#ddd');
					}
				}
			});
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
	    
	    <!-- poster -->
	     <div class="post">
	       <img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")+"_p.jpg"%>"><br>
	    	 
	     </div>
	     
	     <!-- movie info -->
	     <div id="content_table">
		     <table class="content_table">
		         <tr>
		            <td><%=moviebean.getMv_kor_title() %> (<%=moviebean.getMv_year() %>) </td>
		         </tr>
		         <tr>
		            <td><%=moviebean.getMv_eng_title() %></td>
		         </tr>
		         <tr>
		         	<td><%String avg2 =String.format("%.1f",avg);%>
			          <p id="aveRating" style="color:#ff8800;">평균 평점  <%=avg2 %> / 5</p></td>
		         </tr>
		      </table><!-- tabel1 -->
		      
	        <table class="content_table2">
	        	 <tr>
	        	 	<td><%=age %></td>
	        	 </tr>
		         <tr>
		            <td><%=genre%> | <%=moviebean.getMv_country() %> | <%=moviebean.getMv_time() %>분 </td>
		         </tr>
		            <td>감독 : <%=moviebean.getMv_director() %></td>
		         </tr>
		         <tr>
		            <td>주연 : <%=moviebean.getMv_actor() %></td>
		         </tr>
	      	</table><!-- table2 -->
	      	
	     	 <!-- 별점 시작 -->
		      	<div class="starRating">
			       <p id="giveStar">별점주기</p>
			         <form action="" id="starform<%=mv_num %>">
			            <input type="hidden" name="ra_p_num" value="<%=mv_num %>">
			            <script type="text/javascript">
			               abc("star"+<%=ra_rating%>+<%=mv_num%>);
			            </script>
			            <fieldset class="rating" id="starfield<%=mv_num %>" >
			                <input type="radio" id="star5<%=mv_num %>" name="ra_rating" value="5" /><label class = "full" for="star5<%=mv_num %>" title="5 stars"></label>
			                <input type="radio" id="star4<%=mv_num %>" name="ra_rating" value="4" /><label class = "full" for="star4<%=mv_num %>" title="4 stars"></label>
			                <input type="radio" id="star3<%=mv_num %>" name="ra_rating" value="3" /><label class = "full" for="star3<%=mv_num %>" title="3 stars"></label>
			                <input type="radio" id="star2<%=mv_num %>" name="ra_rating" value="2" /><label class = "full" for="star2<%=mv_num %>" title="2 stars"></label>
			                <input type="radio" id="star1<%=mv_num %>" name="ra_rating" value="1" /><label class = "full" for="star1<%=mv_num %>" title="1 star"></label>
			            </fieldset>
			          </form>
				</div><!-- 별점 끝 -->
				
				<!--즐겨찾기  -->
			      <fieldset class="like" id="starfield<%=mv_num %>" >
			      				<div id="favImg"><img src="./images/fav.png"></div>
			    			    <div id="dup"></div>
			    			   <%  if(favoritebean !=null){
			    				      if(favoritebean.getF_id()!=null && favoritebean.getF_num()==mv_num){
							    %><input type="button" id="favorite" name="fa_favorite" value="즐찾" style="display: none;"/><label id="fa" class = "fa_full" for="favorite" title="좋아요 해제" style="color:red;"></label><%
			    				      }
			    			   		}else{
							    	%>
							    	<input type="button" id="favorite" name="fa_favorite" value="즐찾" style="display: none;"/><label id="fa" class = "fa_full" for="favorite" title="좋아요" style="color:gray;" ></label>
							    	<%  
							      }
			   				     %>
			    			    <input type="hidden" id ="m_id"value="<%=id%>">
			    			    <input type="hidden" id ="mv_num"value="<%=mv_num%>">  
			  	 </fieldset>
	      <%						
	      if(memberBean.getM_pay()==0){
	         %>
	         <script type="text/javascript">
	         $(document).ready(function(){ 
	   		 
	   			 	$('.hr').click(function(){
	   			 	 var con=confirm("이용권이 존재 하지 않습니다. 이용권 페이지로 이동 하시겠습니까?");
	   		         if(con==true){
	   		         	location.href="./PayList.pa";
	   		         }else{
	   		         }
	
	               });
	         });      
	         </script>
	              <%   
	      }
	      
	      if(memberBean.getM_pay()==1){
	         if(memberBean.getM_id_num1()<200001 && moviebean.getMv_age()==19 ){
	             %>
	              <script type="text/javascript">
	               $(document).ready(function(){
	                var url = $('hr').attr('href','<%=moviebean.getMv_video()%>');  
	                  $('.hr').click(function(){
	                	  alert('<%=moviebean.getMv_video()%>');
	                      window.open('<%=moviebean.getMv_video()%>','_blank'); 
	                     });
	              break;
	               });           
	              </script>
	              <%
	         }else if( memberBean.getM_id_num1()>199912 && moviebean.getMv_age()==19){
	        	 %>
	             <script type="text/javascript">
	             $(document).ready(function(){
	                $('.hr').click(function(){
	                   alert("청소년 관람불가 영화입니다.");
	                   return attributes;
	                   });
	             });      
	             </script>
	          <%   
	         } 
	         %>
	         
	         <script type="text/javascript">
	         $(document).ready(function(){
	          var url = $('hr').attr('href','<%=moviebean.getMv_video()%>');  
	            $('.hr').click(function(){
	          	  
	                window.open('<%=moviebean.getMv_video()%>','_blank'); 
	
	
	               });
	            
	         });           
	        </script>
	        <%
	         }
	      %>
	      		 <button class="hr" id="mv_play" style="display: none;">이동</button>
	      		  
	      		  <label class="play" for="mv_play" title="보러가기">왓츄에서 영화보기<label>
	      		  
	      		  
	      		  
	        
	      </div><!-- contentTable -->
	   </div><!-- contentInner -->
   </div><!-- content -->
   
   <div class="clear"></div>
   
   <nav class="movieNav">
   	<ul>
   		<li><a href="#story">줄거리</a></li>
   		<li><a href="#movie_preview">예고편</a></li>
   		<li><a href="#movie_steel">스틸컷</a></li>
   		<li><a href="#comment">왓츄리뷰보기</a></li>
   	</ul>
   </nav>

	<!-- 줄거리 -->
   <div class="story" id="story">
	<p class="movieInfoTitle">줄거리</p>     
      <p class="movieInfoContent">
      <%=story%>
      </p>
   </div>
   
   <!--예고편  -->
   <div class="movie_preview" id="movie_preview">
   	<p class="movieInfoTitle">예고편</p>  
     <p class="movieInfoContent">
      <iframe src=<%=moviebean.getMv_video()%>></iframe><br>
     </p>
   </div>
   
   <!--스틸컷  -->
  	<p class="movieInfoTitle">스틸컷</p>
   <div class="movie_steel" id="movie_steel">
   	
      <p class="movieInfoContent">
        <a href="#" class="prev" style="display: none;"><img alt="이전 이미지" src="./images/arrow_left.png" class="prev"></a>
      	<div class="frame">
      		<p><img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")+"_s.jpg"%>" class="steelcut"></p><!-- 스틸컷  -->
      	</div>
      <a href="#" class="next"><img alt="다음 이미지" src="./images/arrow_right.png" class="next"></a>
     </p>
   </div>

   <!--댓글   -->

  
		<p class="movieInfoTitle">리뷰 쓰기</p>
		 <div class="coment c1" id="comment">
	     <!--댓글 쓰는 란  -->
	     <form action="./InsertReview.ca" class="coment_write" id="review">
	     <%     
	     if(memberBean.getM_grade() == 3) {
	    	 %>
	    	 <textarea cols="90" rows="7" placeholder="리뷰를 등록할 수 없습니다." readonly="readonly"></textarea>
	    	 <%
	     }else {
	    	 %>
	    	 <textarea cols="90" rows="7" placeholder="영화를 어떻게 보셨나요?" name="r_content"></textarea>
	         <input type="hidden" name="mv_num" value="<%=moviebean.getMv_num() %>">
	         <input type="submit" value="등록">    	 
	    	 <%
	     }     
	     %>       
	     </form>
	     
	   </div>  
	   
	   
	   <!-- 댓글 리스트 -->
	   <p class="movieInfoTitle">왓츄 REVIEWS</p>
	   <div class="coment"> 
			
			<a id="rec"></a><a id="new"></a>
			<div class="sort_wrap">
				<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>&order=recommend#rec" class="sort_btn">추천순</a>
				<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>&order=newest#new" class="sort_btn">최신순</a>
			</div>
			
     <!-- 댓글 리스트 -->
     <%
     List reviewList = (List)request.getAttribute("reviewList");
     List memberName = (List)request.getAttribute("memberName");
     String pageNum_s= (String)request.getAttribute("pageNum");
     int pageNum = Integer.parseInt(pageNum_s);
     int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
     int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
     int startPage = ((Integer)request.getAttribute("startPage")).intValue();
     int endPage = ((Integer)request.getAttribute("endPage")).intValue();
     int count = ((Integer)request.getAttribute("count")).intValue();
     
     if(reviewList == null) {
        %>
         <table class="review_none">
           <tr>
             <td>아직 등록된 리뷰가 없어요</td>
           </tr>
         </table>
         <%
     }else {

     for(int i=0; i<reviewList.size(); i++) {
        ReviewBean reviewbean = (ReviewBean)reviewList.get(i);
        MemberBean memberbean = (MemberBean)memberName.get(i);
        if(moviebean.getMv_num()==reviewbean.getR_p_num()) {
        	String yymmdd =reviewbean.getR_date().toString();
           %>
           <table class="review_o"  id="rem_<%=reviewbean.getR_id() %>">
              <tr>
                <td class="c_name">
                <%=memberbean.getM_name() %>
                <a href="./FollowMyHome.fo?m_id=<%=reviewbean.getR_id() %>" class="glyphicon glyphicon-home" style="color: green;" title="구경하기"></a>
                </td>
              </tr>
              <tr>
                <td class="review_content">
                <%
                if(reviewbean.getR_report() >= 10) {
                	%>
                	<%="신고 누적으로 관리자가 검토중입니다." %>
                	<%
                }else {
                	%>
                	<%=reviewbean.getR_content().replaceAll("\r\n","<br>") %> 
                	<%
                }
                %>
                </td>
              </tr>
              <tr>
                <td class="review_sub">추천 <%=reviewbean.getR_recommand() %> / 신고 <%=reviewbean.getR_report() %></td>
              </tr>
              <tr>
                <td class="review_sub"><%=yymmdd.substring(0,16)%></td>
                
              </tr>
<!--               본인이면  (수정 삭제) 보이기 본인이 아니면 (추천 신고) 보이기  -->
            <%
            if(reviewbean.getR_id().equals(id)) {
               %>
               <tr>
                     <td class="review_sub2">
                     <a href="./ModifyReview.ca?r_num=<%=reviewbean.getR_num() %>&mv_num=<%=moviebean.getMv_num() %>" class="a">수정</a> | 
                     <a href="./DeleteReview.ca?r_num=<%=reviewbean.getR_num() %>&mv_num=<%=moviebean.getMv_num() %>" class="a">삭제</a>
                     </td>
                 </tr>
               <%
            }else if(memberBean.getM_name().equals("관리자")) {
				%>
				<tr>
			      	  <td class="review_sub2">
			      	  <a href="./DeleteReview.ca?r_num=<%=reviewbean.getR_num() %>&mv_num=<%=moviebean.getMv_num() %>" class="a">삭제</a>
			      	  </td>
			    	</tr>
				<%
			}else {
               %>
               <tr>
                    <td class="review_sub2">
					

							
		                    <a id="recommend<%=reviewbean.getR_num() %>"><img alt="추천" src="./images/recommend.PNG" style="width: 40px; height: 40px; border-radius: 30px;" title="추천"></a>
		                    <a id="report<%=reviewbean.getR_num() %>"><img alt="신고" src="./images/report.PNG" style="width: 40px; height: 40px; border-radius: 30px;" title="신고"></a>
		                    
		                    <input type="hidden" id="r_num<%=reviewbean.getR_num() %>" value="<%=reviewbean.getR_num() %>">
							<input type="hidden" id="mv_num<%=reviewbean.getR_num() %>" value="<%=moviebean.getMv_num() %>">
							<input type="hidden" id="id<%=reviewbean.getR_num() %>" value="<%=id %>">
							<input type="hidden" id="r_id<%=reviewbean.getR_num() %>" value="<%=reviewbean.getR_id() %>">
		
							<script type="text/javascript">
								$(document).ready(function() {
									
									$('#recommend<%=reviewbean.getR_num() %>').click(function(){
										var r_num = $('#r_num<%=reviewbean.getR_num() %>').val();
										var mv_num = $('#mv_num<%=reviewbean.getR_num() %>').val();
										var id = $('#id<%=reviewbean.getR_num() %>').val();
										var r_id = $('#r_id<%=reviewbean.getR_num() %>').val();
										
										
											$.ajax({
												type: "post",
												url: "./RecommendAction.ca",
												dataType: "html",
												data: {
													"r_num": r_num,
													"mv_num": mv_num,
													"id": id,
													"r_id": r_id
												},
												success:function(data){
													if(data==0) {
														alert("이미 추천을 준 리뷰 입니다");
													}else {
														location.reload();
													}
												}
											});
									});
									
									$('#report<%=reviewbean.getR_num() %>').click(function(){
										var r_num = $('#r_num<%=reviewbean.getR_num() %>').val();
										var mv_num = $('#mv_num<%=reviewbean.getR_num() %>').val();
										var id = $('#id<%=reviewbean.getR_num() %>').val();
										var r_id = $('#r_id<%=reviewbean.getR_num() %>').val();
										
										
											$.ajax({
												type: "post",
												url: "./ReportAction.ca",
												dataType: "html",
												data: {
													"r_num": r_num,
													"mv_num": mv_num,
													"id": id,
													"r_id": r_id
												},
												success:function(data){
													if(data==0) {
														alert("이미 신고한 리뷰 입니다");
													}else {
														location.reload();
													}
												}
											});
									});
							});
							</script>
							
		                    </td>
		                 </tr>
		               <%
		            }
		            %>
		              
		            </table>

		            <%
		        }
		     }
		     
		}
		     %>
		
		     <%
		     
		     if(count != 0) {
		     %>
		   <div class="prev_next">
		     <%
		      if(startPage>pageBlock){         
		         %><a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num() %>&pageNum=<%=startPage-pageBlock%>">prev</a><%
		      }
		      for(int i=startPage;i<=endPage;i++) {
		         %><a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num() %>&pageNum=<%=i%>"><%=i%></a><%
		      }
		      if(pageCount>endPage){
		       	 %><a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num() %>&pageNum=<%=startPage+pageBlock%>">next</a><%
		      }
		      %>
		   </div>
		<%
		} 
		%>

	   </div>

   </section>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>