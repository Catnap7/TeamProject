<%@page import="java.util.List"%>
<%@page import="net.admin.manage.db.MovieDAO"%>
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.favorite.db.FavoriteBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>당신의 모든 영화, 세상의 모든 취향 : 왓츄</title>

  
<!-- js -->
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/jquery.ulslide.js"></script>
<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/main.css" rel="stylesheet" type="text/css" media="screen"> 
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">


$(document).ready(function(){
	
	/***변수선언***/
	var $container = 1720;
	var $display = 5;
	var $mv = $container/$display;
	var $mv_mv = ($container/$display)+5;
	var $count =13; /* 영화개수 */
	var $slidebox=($mv*$count)+65; 

	
	console.log($container);
	console.log($display);
	console.log($mv);
	console.log($count);
	console.log($slidebox);

	
	/***함수설정***/
	function init(){
		console.log('init 함수 시작');
		$('.container').css('width',$container);
		$('.slider').css('width',$slidebox);
		$('.mv').css('width',$mv);
	 	$('.mv img').css('width',$mv*1.6);
		$('.mv img').css('height',$mv*1.1);	 
	}
	
	
	
	/* $('.mv img').mouseover(function(){
		$(this).css('width',$mv*2);
		$(this).css('height',$mv*1.5);
	}).mouseout(function(){
		$(this).css('width',$mv*1.5);
		$(this).css('height',$mv*1.1);
	});
 */
 
 /* $('.mv img').mouseover(function(){
	$(this).css('width',$mv*2);
	$(this).css('height',$mv*1.5);
}).mouseout(function(){
	$(this).css('width',$mv*1.5);
	$(this).css('height',$mv*1.1);
});
*/

	/****슬라이더 1~5****/
	function moveSlider1(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.trending').animate({left:'+='+$mv_mv},300,slideEnd1)
		}else if(check==1){
			$('.trending').animate({left:'-='+$mv_mv},300,slideEnd1)
		}
	}
	
	function moveSlider2(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.recommendRating').animate({left:'+='+$mv_mv},300,slideEnd2)
		}else if(check==1){
			$('.recommendRating').animate({left:'-='+$mv_mv},300,slideEnd2)
		}
	}
	
	function moveSlider3(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.recommendMany').animate({left:'+='+$mv_mv},300,slideEnd3)
		}else if(check==1){
			$('.recommendMany').animate({left:'-='+$mv_mv},300,slideEnd3)
		}
	}
	
	function moveSlider4(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.wannaWatch').animate({left:'+='+$mv_mv},300,slideEnd4)
		}else if(check==1){
			$('.wannaWatch').animate({left:'-='+$mv_mv},300,slideEnd4)
		}
	}
	
	function moveSlider5(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.adminPick').animate({left:'+='+$mv_mv},300,slideEnd5)
		}else if(check==1){
			$('.adminPick').animate({left:'-='+$mv_mv},300,slideEnd5)
		}
	}
	/*슬라이더 1~5*/
	
	
	
	
	
	/****슬라이더 제어****/
	function slideEnd1(){
		var nowLeft = $('.trending').position().left;
		
		var end = -($slidebox-$container);
		console.log(nowLeft);
		console.log(end);
		
		if(nowLeft<=end){
			$('.trending').animate({left:end});
		}else if(nowLeft>0){
			$('.trending').animate({left:0});
		}
	}
	
	function slideEnd2(){
		var nowLeft = $('.recommendRating').position().left;
		
		var end = -($slidebox-$container);
		console.log(nowLeft);
		console.log(end);
		
		if(nowLeft<=end){
			$('.recommendRating').animate({left:end});
		}else if(nowLeft>0){
			$('.recommendRating').animate({left:0});
		}
	}
	
	function slideEnd3(){
		var nowLeft = $('.recommendMany').position().left;
		
		var end = -($slidebox-$container);
		console.log(nowLeft);
		console.log(end);
		
		if(nowLeft<=end){
			$('.recommendMany').animate({left:end});
		}else if(nowLeft>0){
			$('.recommendMany').animate({left:0});
		}
	}
	
	function slideEnd4(){
		var nowLeft = $('.wannaWatch').position().left;
		
		var end = -($slidebox-$container);
		console.log(nowLeft);
		console.log(end);
		
		if(nowLeft<=end){
			$('.wannaWatch').animate({left:end});
		}else if(nowLeft>0){
			$('.wannaWatch').animate({left:0});
		}
	}
	
	function slideEnd5(){
		var nowLeft = $('.adminPick').position().left;
		
		var end = -($slidebox-$container);
		console.log(nowLeft);
		console.log(end);
		
		if(nowLeft<=end){
			$('.adminPick').animate({left:end});
		}else if(nowLeft>0){
			$('.adminPick').animate({left:0});
		}
	}
	/****슬라이더 제어****/

	
	
	/* 함수시작 */
	init();
	
	/***클릭이벤트 제어***/
		/*첫번째 슬라이더*/
		$('.next1').on('click',moveSlider1);
		$('.prev1').on('click',moveSlider1);
		
		/*두번째 슬라이더*/
		$('.next2').on('click',moveSlider2);
		$('.prev2').on('click',moveSlider2);
		
		/*세번째 슬라이더*/
		$('.next3').on('click',moveSlider3);
		$('.prev3').on('click',moveSlider3);
		
		/*네번째 슬라이더*/
		$('.next4').on('click',moveSlider4);
		$('.prev4').on('click',moveSlider4);
		
		/*다섯번째 슬라이더*/
		$('.next5').on('click',moveSlider5);
		$('.prev5').on('click',moveSlider5);
	/***클릭이벤트 제어***/

});	

//팝업 스크립트

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
    }
    return "";
}
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function couponClose(){
    if($("input[name='chkbox']").is(":checked") ==true){
        setCookie("close","Y",1);
    }
    $("#popp27").hide();
}
$(document).ready(function(){
    cookiedata = document.cookie;
    if(cookiedata.indexOf("close=Y")<0){
        $("#popp27").show();
    }else{
        $("#popp27").hide();
    }
    $("#close").click(function(){
        couponClose();
    });
});

//end of popup
</script> 
</head>





<body>
<%
String id = (String)request.getAttribute("m_id");

List titlesearchList =(List)request.getAttribute("titlesearchList");
List directorsearchList =(List)request.getAttribute("directorsearchList");
List actorsearchList =(List)request.getAttribute("actorsearchList");
%>



<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<!-- 팝업 -->
<div id="popp27">
 <div class="cont">
  <img src="./images/popup3.png" alt="할인쿠폰광고 " border="0" width="400px" height="400px"></div>
 <div class="close">
  <form method="post" action="" name="pop_form">
   <span id="check"><input type="checkbox" value="checkbox" name="chkbox" id="chkday"/><label for="chkday">오늘 하루동안 보지 않기</label></span>
   <span id="close">닫기</span>
  </form>
 </div>
</div>
<!--  end of popup -->


<!-- 아티클 -->
<article class = "main2">

<!-- ***********각 슬라이드에 들어갈 영화는 13개씩 지정해놨습니다********** -->
<!-- 크롬 기준 -->

<!-- 왓츄에서 인기있는 영화 -->
<%if(titlesearchList.size()!=0){
	
%>  	<div class="container"> 
  		<h2>제목별</h2>
		<div class="slider trending">
			 <!--for문으로 반복 하시면 됩니다-->
			 <%
			 
		for(int i = 0; i<titlesearchList.size();i++){
			MovieBean moviebean = (MovieBean)titlesearchList.get(i);
		/* 스릴러, 호러 나눠진 영화 장르 thriller로 합쳐서 저장*/
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
		
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
 		imgname = imgname.replaceAll("\\p{Z}", "");%>
 			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>"><div class="mv">
							<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
							<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
							<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
							<span class="mv_grade"><%=age%></span><!-- 등급 -->
							<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
							</div>
			</a> 
		<%}  
			
			 %><!--for문 여기까지 -->			
				 		
    	</div><!-- slider -->
	</div><!-- container -->
	<%=titlesearchList.size() %>
	<%if(titlesearchList.size()>5){
		%>
		<div>
			<div class="prev1 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
			<div class="next1 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
		</div><!-- button -->		
		<%
		
	} %>
		
		<%
}%>

 <%if(directorsearchList.size()!=0){
	
%>  	<div class="container"> 
  		<h2>감독별</h2>
		<div class="slider trending">
			 <!--for문으로 반복 하시면 됩니다-->
			 <%
			 
		for(int i = 0; i<directorsearchList.size();i++){
			MovieBean moviebean = (MovieBean)directorsearchList.get(i);
		/* 스릴러, 호러 나눠진 영화 장르 thriller로 합쳐서 저장*/
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
		
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
 		imgname = imgname.replaceAll("\\p{Z}", "");%>
 			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>"><div class="mv">
							<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
							<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
							<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
							<span class="mv_grade"><%=age%></span><!-- 등급 -->
							<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
							</div>
			</a> 
		<%}  
			
			 %><!--for문 여기까지 -->			
				 		
    	</div><!-- slider -->
	</div><!-- container -->
		<%if(directorsearchList.size()>=5){
		%>
		<div>
			<div class="prev1 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
			<div class="next1 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
		</div><!-- button -->		
		<%
		
	} %>
		<%
}%>

<%if(actorsearchList.size()!=0){
	
%>  	<div class="container"> 
  		<h2>배우별</h2>
		<div class="slider trending">
			 <!--for문으로 반복 하시면 됩니다-->
			 <%
			 
		for(int i = 0; i<actorsearchList.size();i++){
			MovieBean moviebean = (MovieBean)actorsearchList.get(i);
		/* 스릴러, 호러 나눠진 영화 장르 thriller로 합쳐서 저장*/
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
		
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
 		imgname = imgname.replaceAll("\\p{Z}", "");%>
 			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>"><div class="mv">
							<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
							<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
							<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
							<span class="mv_grade"><%=age%></span><!-- 등급 -->
							<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
							</div>
			</a> 
		<%}  
			
			 %><!--for문 여기까지 -->			
				 		
    	</div><!-- slider -->
	</div><!-- container -->
		<%if(actorsearchList.size()>=5){
		%>
		<div>
			<div class="prev1 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
			<div class="next1 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
		</div><!-- button -->		
		<%
		
	} %>
		<%
}%> 
	
</article>
<!-- 아티클 영역 끝 -->





<div class="clear"></div>
<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>