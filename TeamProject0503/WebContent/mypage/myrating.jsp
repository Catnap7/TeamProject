<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.admin.manage.db.MovieDAO"%>
<%@page import="net.mypage.db.RatingDAO"%>
<%@page import="net.mypage.db.RatingBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mypage.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
String id = (String)session.getAttribute("id");
List<RatingBean> ratinglist = (List)request.getAttribute("ratinglist");
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
<div class="<%=class_name%>">
	<div class="movie_star">
		<h2>회원님의 평점 내역</h2>
	</div>
	<section class="movie_sec">
	<%
	for(RatingBean rb : ratinglist){
		MovieBean mb= mdao.getMovie(rb.getRa_p_num());
		String moviename = mb.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
		imgname = imgname.replaceAll("\\p{Z}", "");
		
	%>
		<div class="movie_sec_inner">
			<img src="./images/<%=mb.getMv_genre()%>/<%=imgname%>_p.jpg" width="250px" height="350px"><br>
			<div class="star">
			<%
			for(int i=0;i<rb.getRa_rating();i++){
			%>
				<span class="fa fa-star checked star_rating"></span>				
				<%} 
			for(int i=0;i<5-rb.getRa_rating();i++){
			%>
			<span class="fa fa-star star_rating"></span>
			<%
			}
			%>
			</div>
		</div>	
		<%
	}
		%>															
		
	<div class="prev_next">
		<%
		if(startPage>pageBlock){			
			%><a href="./Myrating.my?pageNum=<%=startPage-pageBlock%>">prev</a><%
		}
		for(int i=startPage;i<=endPage;i++) {
			%><a href="./Myrating.my?pageNum=<%=i%>"><%=i%></a><%
		}
		if(pageCount>endPage){
			%><a href="./Myrating.my?pageNum=<%=startPage+pageBlock%>">next</a><%
		}
		%>
	</div>
	</section>
</div>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>















