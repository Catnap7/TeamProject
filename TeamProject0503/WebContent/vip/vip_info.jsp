<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄: VIP</title>


<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="../js/jquery-3.3.1.js"></script>

  
<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<!-- 웹 폰트 : 나눔명조 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
</head>
<body>



<!-- 아티클 영역 -->
<article>

<%
String id=(String)session.getAttribute("m_id");

if(id==null){
	response.sendRedirect("./MemberLogin.me");
}

MemberBean memberbean=(MemberBean)request.getAttribute("memberbean");
int m_grade=memberbean.getM_grade();

String grade="";

%>


<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

 	<div class="pic_frame_info">
		<div class="pic_info">
 			<img id="pic_src_info" src="./images/vip1.png">
 		</div>
	</div> 
	
	

<%
if(m_grade==1 || m_grade==0){
	grade="준회원";
}else if(m_grade==2){
	grade="VIP";
	%>
	
	<div class="gradeInfo">
		<p><%="회원님의 등급은 "%><span><%=grade%></span><%="입니다"%></p><br>
		<p><a href="./Vip.vi">VIP페이지로 가기</a></p>
	</div>
<%} %>


	<h3>왓츄 VIP의 놀라운 혜택</h3>
	
	<section>
		<div>
			무료 프리미엄 시사회
		</div>
		<div>
			이벤트 초대
		</div>
		<div>
			할인 쿠폰
		</div>

	</section>






</article>
<!-- 아티클 영역 -->





<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->



</body>
</html>