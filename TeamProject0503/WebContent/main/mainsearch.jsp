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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mainsearch.css" rel="stylesheet" type="text/css" media="screen"> 

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

<script type="text/javascript">


$(document).ready(function(){
	
//	갯수 구하는 제이쿼리
//	alert($(".stitle>img").length); 
//	alert($(".sdirector>img").length); 
//	alert($(".sactor>img").length); 
	
	
	var $container = 1720; 
	/* var length=$(".searchTitle .mv").size();   */
	var $count =20; /* 영화개수 */ 
	/* var count =$(".mv").length; */
	/* var $container = count*344; */
	var $display = 5;
	var $mv = $container/$display;
	var $mv_mv = ($container/$display)+5;
	
	var $t_count =$(".stitle>img").length; /* 제목별 영화개수 */
	var $d_count =$(".sdirector>img").length; /* 감독별 영화개수 */
	var $a_count =$(".sactor>img").length; /* 제목별 영화개수 */
	
	var $t_slidebox=($mv_mv*$t_count);  /* 제목별 슬라이더 길이 */
	var $d_slidebox=($mv_mv*$d_count);  /* 감독별 슬라이더 길이 */
	var $a_slidebox=($mv_mv*$a_count);  /* 배우별 슬라이더 길이 */
	
	
		/*마우스 오버시 슬라이더 길이 조정*/
		 $(".stitle>img").mouseenter(function(){ $('.searchTitle').css('width',$t_slidebox+500);});	 
		 $(".stitle>img").mouseleave(function(){ $('.searchTitle').css('width',$t_slidebox);});

		 $(".sdirector>img").mouseenter(function(){ $('.searchDirector').css('width',$d_slidebox+500);});	 
		 $(".sdirector>img").mouseleave(function(){ $('.searchDirector').css('width',$d_slidebox);});
		 
		 $(".sactor>img").mouseenter(function(){ $('.searchActor').css('width',$a_slidebox+500);});	 
		 $(".sactor>img").mouseleave(function(){ $('.searchActor').css('width',$a_slidebox);});
		 
		 
		 
		 
	 /***함수설정***/
		function init(){
			console.log('init 함수 시작');
			$('.container').css('width',$container);
			
			$('.searchTitle').css('width',$t_slidebox);
			$('.searchDirector').css('width',$d_slidebox);
			$('.searchActor').css('width',$a_slidebox);
			
			$('.mv').css('width',$mv);
		 	$('.mv img').css('width',$mv*1.6);
			$('.mv img').css('height',$mv*1.1);	 	
		}
	 
	 
	 
	/****슬라이더 1~3****/
	function moveSlider1(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.searchTitle').animate({left:'+='+$mv_mv},500,slideEnd1)
		}else if(check==1){
			$('.searchTitle').animate({left:'-='+$mv_mv},500,slideEnd1)
		}
	}
	
	function moveSlider2(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.searchDirector').animate({left:'+='+$mv_mv},300,slideEnd2)
		}else if(check==1){
			$('.searchDirector').animate({left:'-='+$mv_mv},300,slideEnd2)
		}
	}
	
	function moveSlider3(){
		var check=$(this).attr('data-btn');
		
		if(check==0){
			$('.searchActor').animate({left:'+='+$mv_mv},300,slideEnd3)
		}else if(check==1){
			$('.searchActor').animate({left:'-='+$mv_mv},300,slideEnd3)
		}
	}
	/*슬라이더 1~3*/
	
	
	
	
	
	/****슬라이더 제어****/
	function slideEnd1(){
		var nowLeft = $('.searchTitle').position().left;
		
		var end = -($t_slidebox-$container);
		console.log(nowLeft);
		console.log(end);
		
		if(nowLeft<=end){
			$('.searchTitle').animate({left:end});
		}else if(nowLeft>0){
			$('.searchTitle').animate({left:0});
		}
	}
	
	function slideEnd2(){
		var nowLeft = $('.searchDirector').position().left;
		
		var end = -($d_slidebox-$container);
		console.log(nowLeft);
		console.log(end);
		
		if(nowLeft<=end){
			$('.searchDirector').animate({left:end});
		}else if(nowLeft>0){
			$('.searchDirector').animate({left:0});
		}
	}
	
	function slideEnd3(){
		var nowLeft = $('.searchActor').position().left;
		
		var end = -($a_slidebox-$container);
		console.log(nowLeft);
		console.log(end);
		
		if(nowLeft<=end){
			$('.searchActor').animate({left:end});
		}else if(nowLeft>0){
			$('.searchActor').animate({left:0});
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

	/***클릭이벤트 제어***/

});	

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



<!-- 아티클 -->
<article class = "main2">

<!-- 크롬 기준 -->

<!-- ************* 제목별 검색결과 ************* -->
<%if(titlesearchList.size()!=0){%>  
 <div class="containerWithBtn">	
	<div class="container"> 
  		<h2>제목별</h2>
			<div class="slider searchTitle">
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
		 				<div class="mv stitle">
							<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
							<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
							<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
							<span class="mv_grade"><%=age%></span><!-- 등급 -->
							<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
						</div>
					</a> 
			<%}%><!--for문 여기까지 -->				 		
	    </div><!-- slider -->
	</div><!-- container -->
	<%-- <%=titlesearchList.size() %> --%>
		<%if(titlesearchList.size()>=5){%>
			<div>
				<div class="prev1 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
				<div class="next1 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
			</div><!-- button -->		
		<%}
	}%>
</div>



<!-- ************* 감독별 검색결과 ************* -->
 <%if(directorsearchList.size()!=0){%>  	
 
 <div class="containerWithBtn">
 	<div class="container"> 
  		<h2>감독별</h2>
			<div class="slider searchDirector">
			 <!--for문으로 반복 하시면 됩니다-->
				 <%for(int i = 0; i<directorsearchList.size();i++){
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
			 				<div class="mv sdirector">
								<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
								<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
								<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
								<span class="mv_grade"><%=age%></span><!-- 등급 -->
								<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
							</div>
						</a> 
			<%}%><!--for문 여기까지 -->						 		
    	</div><!-- slider -->
	</div><!-- container -->
		<%if(directorsearchList.size()>=5){%>
			<div>
				<div class="prev2 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
				<div class="next2 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
			</div><!-- button -->		
		<%}
	}%>
</div><!-- containerWithBtn -->




<!-- ************* 배우별 검색결과 ************* -->
<%if(actorsearchList.size()!=0){%>  	
 <div class="containerWithBtn">	
	<div class="container"> 
  		<h2>배우별</h2>
			<div class="slider searchActor">
			 <!--for문으로 반복 하시면 됩니다-->
			 <%for(int i = 0; i<actorsearchList.size();i++){
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
 					<div class="mv sactor">
						<img src="./images/<%=img_genre%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
						<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
						<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
						<span class="mv_grade"><%=age%></span><!-- 등급 -->
						<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
					</div>
				</a> 
			<%}%><!--for문 여기까지 -->			
		</div><!-- slider -->
	</div><!-- container -->
		<%if(actorsearchList.size()>=5){%>
			<div>
				<div class="prev3 button" data-btn="0"><img src="./images/arrow_left.png" width="60px" height="60px"></div>
				<div class="next3 button" data-btn="1"><img src="./images/arrow_right.png" width="60px" height="60px"></div>
			</div><!-- button -->		
		<%}
	}%> 
</div>	


<%if(titlesearchList.size()==0 && directorsearchList.size()==0 && actorsearchList.size()==0){%>
	<div id="noSearch"><!-- <p><i class="material-icons" style="font-size:48px;">warning</i></p><br> -->
		<p>검색결과가 없습니다</p><!-- <br><br> -->
<!-- 		<p><img src="./images/noFavorite.png" width="140px" height="140px"></p><br>
		<p>회원님이 보고 싶은 영화에 하트를 꾹 눌러주세요!</p><br><br> -->
				
	</div>
<%} %>



</article>
<!-- 아티클 영역 끝 -->

<div class="clear"></div>



<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>