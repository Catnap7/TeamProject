<%@page import="java.util.List"%>
<%@page import="net.admin.manage.db.MovieDAO"%>
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.favorite.db.FavoriteBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-2.1.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 당신의 모든 영화, 세상의 모든 취향 </title>





<!-- icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- js -->
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/jquery.ulslide.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<jsp:include page="../popup/popup.jsp"/>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/main.css" rel="stylesheet" type="text/css" media="screen"> 
<link href="./css/mainModal.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

<script type="text/javascript">

$(document).ready(function(){
	
	/* alert($(".sd2>img").length); */ 
	
	/***변수선언***/
	var $container = 1550;
	var $display = 5;
	var $mv = 1525/$display;
	/* var $mv_mv = ($container/$display)+5; */
	var $mv_mv = 1525+25;

	var $1_count =$(".sd1>img").length;
	var $2_count =$(".sd2>img").length;
	var $3_count =$(".sd3>img").length;
	var $4_count =$(".sd4>img").length;
	var $5_count =$(".sd5>img").length;
	
	var $1_slidebox=($mv_mv*$1_count/5);  
	var $2_slidebox=($mv_mv*$2_count/5);  
	var $3_slidebox=($mv_mv*$3_count/5); 
	var $4_slidebox=($mv_mv*$4_count/5);  
	var $5_slidebox=($mv_mv*$5_count/5);  
	

	/*마우스 오버시 슬라이더 길이 조정*/
	 $(".sd1>img").mouseenter(function(){$('.trending').css('width',$1_slidebox+500);});	 
	 $(".sd1>img").mouseleave(function(){ $('.trending').css('width',$1_slidebox);});

	 $(".sd2>img").mouseenter(function(){ $('.recommendRating').css('width',$2_slidebox+500);});	 
	 $(".sd2>img").mouseleave(function(){ $('.recommendRating').css('width',$2_slidebox);});
	 
	 $(".sd3>img").mouseenter(function(){ $('.recommendMany').css('width',$3_slidebox+500);});	 
	 $(".sd3>img").mouseleave(function(){ $('.recommendMany').css('width',$3_slidebox);});
	 
	 $(".sd4>img").mouseenter(function(){ $('.wannaWatch').css('width',$4_slidebox+500);});	 
	 $(".sd4>img").mouseleave(function(){ $('.wannaWatch').css('width',$4_slidebox);});
	 
	 $(".sd5>img").mouseenter(function(){ $('.adminPick').css('width',$5_slidebox+500);});	 
	 $(".sd5>img").mouseleave(function(){ $('.adminPick').css('width',$5_slidebox);});
	
	
	/***함수설정***/
	function init(){
		console.log('init 함수 시작');
		$('.container').css('width',$container);
		
		$('.trending').css('width',$1_slidebox);
		$('.recommendRating').css('width',$2_slidebox);
		$('.recommendMany').css('width',$3_slidebox);
		$('.wannaWatch').css('width',$4_slidebox);
		$('.adminPick').css('width',$5_slidebox);
		
		$('.mv').css('width',$mv);
	 	$('.mv img').css('width',$mv*1.6);
		$('.mv img').css('height',$mv*1.2);	 
	}
	

	/****슬라이더 1~5****/
	function moveSlider1(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.trending').animate({left:'+='+$mv_mv},350,slideEnd1)
		}else if(check==1){
			$('.trending').animate({left:'-='+$mv_mv},350,slideEnd1)
		}
	}
	
	function moveSlider2(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.recommendRating').animate({left:'+='+$mv_mv},350,slideEnd2)
		}else if(check==1){
			$('.recommendRating').animate({left:'-='+$mv_mv},350,slideEnd2)
		}
	}
	
	function moveSlider3(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.recommendMany').animate({left:'+='+$mv_mv},350,slideEnd3)
		}else if(check==1){
			$('.recommendMany').animate({left:'-='+$mv_mv},350,slideEnd3)
		}
	}
	
	function moveSlider4(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.wannaWatch').animate({left:'+='+$mv_mv},350,slideEnd4)
		}else if(check==1){
			$('.wannaWatch').animate({left:'-='+$mv_mv},350,slideEnd4)
		}
	}
	
	function moveSlider5(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.adminPick').animate({left:'+='+$mv_mv},350,slideEnd5)
		}else if(check==1){
			$('.adminPick').animate({left:'-='+$mv_mv},350,slideEnd5)
		}
	}
	/*슬라이더 1~5*/
	
	
	
	
	
	/****슬라이더 제어****/
	function slideEnd1(){
		var nowLeft = $('.trending').position().left;
		
		var end = -($1_slidebox-$container);
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
		
		var end = -($2_slidebox-$container);
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
		
		var end = -($3_slidebox-$container);
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
		
		var end = -($4_slidebox-$container);
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
		
		var end = -($5_slidebox-$container);
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
 /*하루동안 보지않기  exdays*24*60*60*1000) */
function couponClose(){
    if($("input[name='chkbox']").is(":checked") ==true){
        setCookie("close","Y",1);
    }
     $("#popp27").attr('style', 'display:none');

}
$(document).ready(function(){
    cookiedata = document.cookie;
    if(cookiedata.indexOf("close=Y")<0){
        $("#popp27").show();
    }else{
         $("#popp27").attr('style', 'display:none');
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

List<MovieBean> favoritelist = (List)request.getAttribute("favoritelist");
int favoritecount = ((Integer)request.getAttribute("favoritecount")).intValue();
String classname = null;
/* if(favoritecount>=13){
	classname = "main1";
}else{
	classname = "main2";
} */

List<MovieBean>mainMovieList=(List)request.getAttribute("mainMovieList");
List<MovieBean>mostReviewsList=(List)request.getAttribute("mostReviewsList");
/* List<FavoriteBean>favList=(List)request.getAttribute("favList"); */

List<MovieBean>Mostcount = (List)request.getAttribute("Mostcount");
List<MovieBean>Bestrating = (List)request.getAttribute("Bestrating");
List<MovieBean>Bestmovie = (List)request.getAttribute("Bestmovie");
List<MovieBean>adminSelectMovieList = (List)request.getAttribute("adminSelectMovieList");

int allreviewcount=((Integer)request.getAttribute("allreviewcount")).intValue(); 

%>

<!-- 크롬 기준 -->


<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->


<!-- 아티클 -->
<%-- <article class=<%=classname%>> --%>
<article class="main">
<div class="mainMovie">


<p class="mainCoverTitle">왓츄 TODAY</p>

	<!--################# 메인 영화 추천################## -->
	<div class="mainCover">	
		<%for(int i=0;i<mainMovieList.size();i++){ %>
			<div class="mainPic">
			<%	
					MovieBean moviebean = mainMovieList.get(i);
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
						
					String genre= "";
						if(moviebean.getMv_genre().equals("animation")){
							genre="애니메이션";
						}else if(moviebean.getMv_genre().equals("comedy")){
							genre="코미디";
						}else if(moviebean.getMv_genre().equals("indie")){
							genre="독립영화";
						}else if(moviebean.getMv_genre().equals("sf")){
							genre="SF";
						}else if(moviebean.getMv_genre().equals("action")){
							genre="액션";
						}else if(moviebean.getMv_genre().equals("horror") || moviebean.getMv_genre().equals("thriller")){
							genre="호러/스릴러";
						}else if(moviebean.getMv_genre().equals("romance") || moviebean.getMv_genre().equals("drama")){
							genre="로맨스/드라마";
						}
		
				 	String age = "";
						switch(moviebean.getMv_age()){
							case 0  : age="전체이용가"; break;
							case 12	: age="12세이용가"; break;
							case 15	: age="15세이용가"; break;
							case 19 : age="청소년관람불가"; break;
						}
				 
					String moviename = moviebean.getMv_eng_title();
					String imgname = moviename.replaceAll(" " , "");
			 		imgname = imgname.replaceAll("\\p{Z}", "");%>
					
					<div class="mainPos"><img id="mainPos" src="./images/<%=img_genre%>/<%=imgname%>_p.jpg">
						 <p id="play" onclick="document.getElementById('id0<%=i+1%>').style.display='block'"><a href="#"><img src="./images/play.png"></a></p>
						 
						 <a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>">
						 	<p><span id="mainPosTitle"><%=moviebean.getMv_kor_title()%></span><br><%=genre+" / "+age %></p></a>
					</div>	
					<!-- modal javascript -->
					<div id="id0<%=i+1%>" class="w3-modal">
					    <div class="w3-modal-content">
					      <div class="w3-container">
					        <span onclick="document.getElementById('id0<%=i+1%>').style.display='none'" class="w3-button w3-display-topright">&times;</span>
					        <iframe width="1000" height="700"src="<%=moviebean.getMv_video()%>" allowfullscreen frameborder="0" scrolling="no"></iframe>
					      </div>
					    </div>
				   </div> <!-- modal -->							
				</div>
			<%}%><!--for문 -->
		</div>	
	<div class="clear"></div>	
</div> 

	<!--################# 리뷰 차트 ################## -->
	<div class="chart">
		<div>
			<p id="chartTitle">왓츄 RANKING</p>
			<p>왓츄회원들이 가장 보고 싶어 하는 영화!</p>
			<div id="rank">
				<%for(int i=0;i<mostReviewsList.size();i++){
					MovieBean moviebean = (MovieBean)mostReviewsList.get(i);
					/* FavoriteBean favbean =(FavoriteBean)favList.get(i); */
					String genre= "";
					if(moviebean.getMv_genre().equals("animation")){
						genre="애니메이션";
					}else if(moviebean.getMv_genre().equals("comedy")){
						genre="코미디";
					}else if(moviebean.getMv_genre().equals("indie")){
						genre="독립영화";
					}else if(moviebean.getMv_genre().equals("sf")){
						genre="SF";
					}else if(moviebean.getMv_genre().equals("action")){
						genre="액션";
					}else if(moviebean.getMv_genre().equals("horror") || moviebean.getMv_genre().equals("thriller")){
						genre="호러/스릴러";
					}else if(moviebean.getMv_genre().equals("romance") || moviebean.getMv_genre().equals("drama")){
						genre="로맨스/드라마";
					}
	
			 	String age = "";
					switch(moviebean.getMv_age()){
						case 0  : age="전체이용가"; break;
						case 12	: age="12세이용가"; break;
						case 15	: age="15세이용가"; break;
						case 19 : age="청소년관람불가"; break;
					}
				%>
					<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>"><p><%=moviebean.getMv_kor_title()%><br>
						<%=genre+" / "+age%></p></a>
				<%} %>
			</div>
		</div>
	</div>
	
	<!--################# 리뷰 수 ################## -->
	<div class="totalRv">
		<div>
			<p>오늘자 왓츄 총 리뷰수 <br>
			<%=allreviewcount%></p>
		</div>
	</div>
	<!--################# 룰렛 링크################## -->
	<div class="sheep">
		<a href="./Roulette.ro">
			<div>행운의 양을 만나보세요! </div>
			<div><img src="./images/sheep.png" width="80px" height="80px"></div>
		</a>
	</div>
	
<div class="clear"></div>



<!-- 이번달 인기영화-->
<div class="containerWithBtn">	
  	<div class="container"> 
  		<h2><span><img src="./images/slate.png" width="30px" height="30px"></span><span id="title">이번 달 인기 영화</span></h2>
		<div class="slider trending">
			 <!--for문으로 반복 하시면 됩니다-->
		<%for(MovieBean moviebean  : Bestmovie){
		  		
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
		switch(moviebean.getMv_age()){
		case 0  : age="전체이용가"; break;
		case 12	: age="12세이용가"; break;
		case 15	: age="15세이용가"; break;
		case 19 : age="청소년관람불가"; break;
		}
			
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
 		imgname = imgname.replaceAll("\\p{Z}", "");%>
 			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>">
 				<div class="mv sd1">
					<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
					<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
					<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
					<span class="mv_grade"><%=age%></span><!-- 등급 -->
					<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
				</div>
			</a> 
		<%} %> 
			<!--for문 여기까지 -->			
				 		
    	</div><!-- slider -->
	</div><!-- container -->
		<div>
			<div class="prev1 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
			<div class="next1 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
		</div><!-- button -->
</div><!-- containerWithBtn -->


	
<%if(Bestrating!=null){ %>	
<!-- 회원님이 별점을 높게 준 영화와 비슷한 영화 -->
<div class="containerWithBtn"> 	
  	<div class="container">  <!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  		
  		<h2>회원님이 별점을 높게 준 영화와 비슷한 영화</h2>
		<div class="slider recommendRating">
			 <!--for문으로 반복 하시면 됩니다-->
			<%for(MovieBean moviebean  : Bestrating){
		  		
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
		switch(moviebean.getMv_age()){
		case 0  : age="전체이용가"; break;
		case 12	: age="12세이용가"; break;
		case 15	: age="15세이용가"; break;
		case 19 : age="청소년관람불가"; break;
		}
		
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
 		imgname = imgname.replaceAll("\\p{Z}", "");%>
 			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>">
 				<div class="mv sd2">
					<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
					<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
					<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
					<span class="mv_grade"><%=age%></span><!-- 등급 -->
					<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
				</div>
			</a> 
		<%} %> 
			<!--for문 여기까지 -->
												
    	</div><!-- slider -->
	</div><!-- container -->
		<div>
			<div class="prev2 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
			<div class="next2 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
		</div><!-- button -->
	<%} %>
</div><!-- containerWithBtn -->

		
<%if(Mostcount!=null){ %>		
<!-- 회원님이 많이 본 영화와 비슷한 영화 -->
<div class="containerWithBtn">
  	<div class="container">  <!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  		
  		<h2>회원님이 좋아하는 영화가 될 것 같아요</h2>
		<div class="slider recommendMany">
			<!--for문으로 반복 하시면 됩니다-->
				<%for(MovieBean moviebean  : Mostcount){
		  		
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
		switch(moviebean.getMv_age()){
		case 0  : age="전체이용가"; break;
		case 12	: age="12세이용가"; break;
		case 15	: age="15세이용가"; break;
		case 19 : age="청소년관람불가"; break;
		}
		
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
 		imgname = imgname.replaceAll("\\p{Z}", "");%>
 			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>">
 					<div class="mv sd3">
						<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
						<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
						<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
						<span class="mv_grade"><%=age%></span><!-- 등급 -->
						<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
					</div>
			</a> 
		<%} %> 
			<!--for문 여기까지 -->
			
    	</div><!-- slider -->
	</div><!-- container -->
		<div>
			<div class="prev3 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
			<div class="next3 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
		</div><!-- button -->	
	<%} %>
</div><!-- containerWithBtn -->	


<%if(favoritecount>=13){%>
<!-- 회원님이 보고싶은 영화 (즐겨찾기)-->

<div class="containerWithBtn">
  	<div class="container">  		
  		<h2>즐겨찾기에 담긴 영화</h2>
		<div class="slider wannaWatch">

		<%for(MovieBean moviebean  : favoritelist){
		  		
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
		switch(moviebean.getMv_age()){
		case 0  : age="전체이용가"; break;
		case 12	: age="12세이용가"; break;
		case 15	: age="15세이용가"; break;
		case 19 : age="청소년관람불가"; break;
		}
		
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
 		imgname = imgname.replaceAll("\\p{Z}", "");%>
 			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>">
 					<div class="mv sd4">
						<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
						<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
						<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
						<span class="mv_grade"><%=age%></span><!-- 등급 -->
						<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
					</div>
			</a> 
		<%} %> 
			<!--for문 여기까지 -->
						
    	</div><!-- slider -->
	</div><!-- container -->
		<div>
			<div class="prev4 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
			<div class="next4 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
		</div><!-- button -->
	<%}%>		
</div>			
	
	
<!-- 왓츄 관리자가 추천하는 영화 -->
<div class="containerWithBtn">
  	<div class="container">  <!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  		
  		<h2>왓츄가 추천해요!</h2>
		<div class="slider adminPick">
			<!--for문으로 반복 하시면 됩니다-->
		<%for(MovieBean moviebean  : adminSelectMovieList){
		  		
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
		switch(moviebean.getMv_age()){
		case 0  : age="전체이용가"; break;
		case 12	: age="12세이용가"; break;
		case 15	: age="15세이용가"; break;
		case 19 : age="청소년관람불가"; break;
		}
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
 		imgname = imgname.replaceAll("\\p{Z}", "");%>
		
		
			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>">
					<div class="mv sd5">
						<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
						<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
						<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
						<span class="mv_grade"><%=age%></span><!-- 등급 -->
						<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
					</div>
			</a>
			<!--for문 여기까지 -->	
			<%}%>						
    	</div><!-- slider -->
	</div><!-- container -->
		<div>
			<div class="prev5 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
			<div class="next5 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
		</div><!-- button -->
</div><!--  containerWithBtn-->

	
</article>
<!-- 아티클 영역 끝 -->





<div class="clear"></div>
<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>