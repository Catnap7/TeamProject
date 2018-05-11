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

  
<!-- 웹 폰트 : 나눔고딕 / Abril Fatface -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">
</head>
<body>
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





<!-- 아티클 영역 -->
<article>


 	<div class="pic_frame_info">
		<div class="pic_info">
 			<img id="pic_src_info" src="./images/vip1.png">
 		</div>
	</div> 
	

<%
if(m_grade==1 || m_grade==0){
	grade="준회원";
	%>
	<div class="gradeInfo">
		<p><%="회원님의 등급은 "%><span><%=grade%></span><%="입니다"%><br><br>
		<span><a href=".info">VIP혜택을 알아보세요</a></span></p>
	</div>
<%}else if(m_grade==2){
	grade="VIP";
	%>
	<div class="gradeInfo">
		<p><%="회원님의 등급은 "%><br>
		<span><%=grade%></span><br>
		<%="입니다"%><br><br>
		<a href="./Vip.vi">VIP시사회 예매하기</a></p>
	</div>
<%} %>


<div class="crown"><img src="./images/crown.png" width="80px" height="70px"></div>

<section class="whoIsVip">
		<p>who is watchu vip?</p>
		<p>한달에 한번! 가장 많은 리뷰추천을 받은 유저 10명 선정!</p>
</section>


<section class="info">
	
	<p>왓츄 <span>VIP</span>의 놀라운 혜택</p>
	
		<div class="cinemaPrev">
			무료 프리미엄 시사회
		</div>
		<div class="event">
			이벤트 초대
		</div>
		<div class="coupon">
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