<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄: 카테고리 검색</title>

  
<!-- js -->
<script src="../js/jquery-3.3.1.js"></script>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/category.css" rel="stylesheet" type="text/css" media="screen"> 
  
  
<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">


</script> 
</head>





<body>


<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->



<!-- 크롬 기준 -->
<%List CategoryList= (List)request.getAttribute("CategoryList");
//가상주소 연결 완료시 주석 해제
String mv_genre="";
String mv_genre_request=request.getParameter("mv_genre");
if(mv_genre_request.equals("animation")){
	mv_genre="애니메이션";
}else if(mv_genre_request.equals("comedy")){
	mv_genre="코미디";
}else if(mv_genre_request.equals("indie")){
	mv_genre="독립영화";
}else if(mv_genre_request.equals("sf")){
	mv_genre="SF";
}else if(mv_genre_request.equals("action")){
	mv_genre="액션";
}else if(mv_genre_request.equals("horror") || mv_genre_request.equals("thriller")){
	mv_genre="공포/스릴러";
}else if(mv_genre_request.equals("romance") || mv_genre_request.equals("drama")){
	mv_genre="로맨스/드라마";
} 
%>
<h2 id="categoryTitle"><%=mv_genre%><%=" 카테고리 검색 결과"%></h2> <!-- Sf부분에 카테고리 이름 넣어주세요. '카테고리 검색 결과'는 지우지 말 것 -->

<!-- 아티클 -->
<article>

	<div class="container">
		<!-- 한페이지에 나오는 영화수 150개로 임시 설정 -->
		
		<!--for문으로 반복 하시면 됩니다.아래의 디자인 예시 코드를 지우고 for문만 남기면 정상작동-->
 	<%for(int i=0; i<CategoryList.size(); i++){ 
		MovieBean moviebean = (MovieBean)CategoryList.get(i);
		String genre="";
		if(moviebean.getMv_genre().equals("animation")){
			genre="animation";
		}else if(moviebean.getMv_genre().equals("comedy")){
			genre="comedy";
		}else if(moviebean.getMv_genre().equals("indie")){
			genre="indie";
		}else if(moviebean.getMv_genre().equals("sf")){
			genre="sf";
		}else if(moviebean.getMv_genre().equals("action")){
			genre="action";
		}else if(moviebean.getMv_genre().equals("horror") || moviebean.getMv_genre().equals("thriller")){
			genre="thriller";
		}else if(moviebean.getMv_genre().equals("romance") || moviebean.getMv_genre().equals("drama")){
			genre="romance";
		}
		String age = "";
		switch(moviebean.getMv_age()){
		case 0  : age="전체이용가"; break;
		case 12	: age="12세이용가"; break;
		case 15	: age="15세이용가"; break;
		case 19 : age="청소년관람불가"; break;
		}
			
	%>
			<a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>"><div class="mv">
						<img src="./images/<%=genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")+"_s2.jpg"%>"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
							<span class="mv_title"><%=moviebean.getMv_kor_title()%></span><!-- 한글제목 --> 
							<span class="mv_year"><%=moviebean.getMv_year()%></span><!-- 년도 -->
							<span class="mv_grade"><%=age%></span><!-- 등급 -->
							<span class="mv_time"><%=moviebean.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
							</div>
			</a>
		<%
		//System.out.println(moviebean.getMv_eng_title().replaceAll(" ","")+"_p");
		} 
		%>  
		<!-- ↓↓↓↓↓디자인 예시를 위해 만든 코드. for문 결과를 확인하고 지워도 무방 ↓↓↓↓↓-->
	 		<!-- ↑↑↑↑↑디자인 예시를 위해 만든 코드. for문 결과를 확인하고 지워도 무방↑↑↑↑↑-->
	</div><!-- container -->
</article>
<!-- 아티클 영역 끝 --> 





<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>