<%@page import="net.rating.db.RatingBean"%>
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.admin.manage.db.MovieDAO"%>
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
<!-- <link href="./css/mypage.css" rel="stylesheet" type="text/css"> -->
<link href="./css/myrating.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/ratingStar.css">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/rating.js"></script>

<!-- icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<%
String pageNum_s= (String)request.getAttribute("pageNum");
int pageNum = Integer.parseInt(pageNum_s);
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
int count = ((Integer)request.getAttribute("count")).intValue();
String class_name=null;
String id = (String)session.getAttribute("m_id");
List<RatingBean> ratinglist = (List)request.getAttribute("ratinglist");
List<MovieBean> movielist = (List)request.getAttribute("movielist");
MovieDAO mdao = new MovieDAO();
if(count-(pageNum-1)*10<=5){
	class_name="movie_wrap1";
}else{
	class_name="movie_wrap2";
}
%>
<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>
<%-- <div class="<%=class_name%>"> --%>
<div class="movie_wrap">
	
	
	<section class="movie_sec">
	
		<script>
	
			function abc(c) {
				//c는 영화 넘버로 설정된 id를 불러와, 영화마다 별점 셋팅을 해준다
				$(document).ready(function(){
					$("[id="+c+"]").attr( "checked", "checked" );
				});
			}
	
		</script>
	
	<%
	if(ratinglist!=null&& movielist!=null){
		%>
		<div class="movie_star">
		<p><img src="./images/star.png" width="55px" height="70px">
		<img src="./images/star.png" width="55px" height="70px">
		<img src="./images/star.png" width="55px" height="70px"></p>
		<p>회원님의 별점 내역</p>
	</div>
	<%
	for(int i=0;i<ratinglist.size();i++){
		RatingBean ratingbean=(RatingBean)ratinglist.get(i);
		MovieBean moviebean=(MovieBean)movielist.get(i);
		
		String moviename = moviebean.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
		imgname = imgname.replaceAll("\\p{Z}", "");
//		int mv_num=moviebean.getMv_num();
		int mv_num=ratingbean.getRa_p_num();
		int ra_rating=ratingbean.getRa_rating();

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

	%>
		<div class="movie_sec_inner" >
			<a href="./CategoryMovie.ca?mv_num=<%=mv_num %>"><img src="./images/<%=img_genre%>/<%=imgname %>_p.jpg" width="250px" height="350px"></a><br>
			<div class="star">
				<form action="" id="starform<%=mv_num %>">
				<input type="hidden" name="ra_p_num" value="<%=mv_num %>">
				<!-- 별점 시작 -->
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
				<!-- 별점 끝 -->
				</form>
				<!-- 영화정보 -->
				<%-- <div><%=moviebean.getMv_kor_title() %>	</div> --%>
				<%-- <div><%=moviebean.getMv_year() %>	</div> --%>
				<%-- <div><%=age %>	</div> --%>
			</div>
			
		</div>
		
		<%
		}
	%>
	
															
		
	<%-- <div class="prev_next">
		<%
		if(startPage>pageBlock){			
			%><a href="./Myrating.my?pageNum=<%=startPage-pageBlock%>">prev</a><%
		}
		for(int i=startPage;i<=endPage;i++) {
			%><a href="./Myrating.my?pageNum=<%=i%>"><span <%if(i==pageNum){%>style=color:red;<%} %>><%=i%></span></a><%
		}
		if(pageCount>endPage){
			%><a href="./Myrating.my?pageNum=<%=startPage+pageBlock%>">next</a><%
		}
		%>
	</div>  --%><!-- 페이지처리 슬라이드버튼으로 변경 -->
	
	</section>
	
		<!-- button -->
			<div class="prev1 button" data-btn="0"><a href="./Myrating.my?pageNum=<%if(pageNum!=1){%><%=pageNum-1 %><%;}else{%><%=1 %><%;}%>"><img src="./images/arrow_left.png" width="60px" height="60px"></a></div>
			<div class="next1 button" data-btn="1"><a href="./Myrating.my?pageNum=<%if(pageNum!=endPage){%><%=pageNum+1 %><%;}else{%><%=endPage %><%;}%>"><img src="./images/arrow_right.png" width="60px" height="60px"></a></div>
		<!-- button -->
		
<% }else{
	%>
	<div id="noMoreMovie"><p><i class="material-icons" style="font-size:48px;">warning</i></p><br>
		<p>평점 내역이 없습니다</p><br><br><br>
		<p>관람한 영화에 별점을 매겨주세요!</p><br><br>
		<p><img src="./images/nostar.png" width="140px" height="140px"></p>
	</div>
	<%
}
%>			
</div>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>















