<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄 : WATCHU</title>

<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/rating.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/ratingStar.css">

<!-- 웹 폰트 : 나눔고딕 / Do Hyeon/ Abril Fatface -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Do+Hyeon|Abril+Fatface" rel="stylesheet">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/rating.js"></script>

<!-- icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>
<div class="movie_wrap">
	<div class="movie_star">
		<p><img src="./images/analysis.png" width="80px" height="80px"></p>
		<p>관람하신 영화의 별점을 매겨주시면 왓츄가 회원님의 취향을 분석해 드려요!</p>
	</div>
	<section class="movie_sec">
<%
List movielist=(List)request.getAttribute("movielist");

if(movielist.size()!=0){
	for(int i=0;i<movielist.size();i++){
		MovieBean moviebean=(MovieBean)movielist.get(i);
		int mv_num=moviebean.getMv_num();
		
		String imgname = moviebean.getMv_eng_title().replaceAll(" " , "");
		imgname = imgname.replaceAll("\\p{Z}", "");
		
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
	%>
		<div class="movie_sec_inner">
			<img src="./images/<%=img_genre%>/<%=imgname %>_p.jpg" width="250px" height="350px"><br>
			<div class="star">
				<form action="" id="starform<%=mv_num %>">
				<input type="hidden" name="ra_p_num" value="<%=mv_num %>">
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
			</div>
		</div>
<%
	}//end for
}else{
	%>
	<div id="noMoreMovie"><p><i class="material-icons" style="font-size:48px;">warning</i></p><br>
		<p>더 이상 평가할 영화가 남지 않았습니다</p><br><br><br>
		<p>당신이 진정한 무비 매니아!</p><br><br>
		<p><img src="./images/champ.png" width="140px" height="140px"></p>
	</div>
	<%
}
%>
		<div class="movie_refresh">
			<a class="fa fa-refresh" href="./Rating.ra"></a>
		</div>
	</section>
	
</div>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>