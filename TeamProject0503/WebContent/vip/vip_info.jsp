<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄: VIP</title>


<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>  
<!-- 웹 폰트 : 나눔고딕 / Do Hyeon/ Abril Fatface -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Do+Hyeon|Abril+Fatface" rel="stylesheet">

<!-- icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
if(m_grade==1){
	grade="정회원";
	%>
	<div class="gradeInfo">
		<p><%="회원님의 등급은 "%><br>
		<span><%=grade%></span><br>
		<%="입니다"%><br><br>
		<a href="#whoIsVip">VIP혜택을 알아보세요</a></p>
	</div>
<%}else if(m_grade==2){
	grade="VIP";
	%>
	<div class="gradeInfo">
		<p><%="회원님의 등급은 "%><br>
		<span><%=grade%></span><br>
		<%="입니다"%><br><br>
		<a href="./Vip.vi">VIP시사회</a></p>
	</div>
<%} %>

<div class="clear"></div>
<div class="crown"><img src="./images/crown.png" width="80px" height="70px"></div>

<section class="whoIsVip" id="whoIsVip">
		<p>who is watchu vip?</p>
		<p>한달에 한번!<br>
			가장 많은 <span>WHACHU 리뷰추천</span>을 받은<br>
			유저 <span>10명</span>선정해<br>
			특별한 혜택을 드립니다</p>
</section>


<section class="info">
	
	<p>왓츄 <span>VIP</span>의 놀라운 혜택</p>
	
		<div class="event">
			<div>
			<h3>이벤트 참여</h3>
				<p>VIP만 참여 가능한 게릴라 이벤트</p>
				<p>가입시 작성한 이메일로<br>
					이벤트 참여 코드 발송</p>
			</div>
		</div>
		<div class="cinemaPrev">
			<div>
			<h3>VIP 시사회</h3>
				<p>VIP로 선정된 유저들만을 위한<br>
					최고의 영화, 최고의 영화관</p>
				<p>매달 평론가와 왓츄가 선정한<br>
					프리미엄 시사회</p>
			</div>
		</div>
		<div class="coupon">
			<div>
			<h3>다양한 쿠폰</h3>
				<p>VIP전용 쿠폰</p>
				<p>쿠폰의 종류는 매달 달라 질 수 있습니다</p>
			</div>
		</div>

</section>


<section class="ChallengeVip">
		<p><i class="fa fa-diamond" style="font-size:36px"></i>  활발한 리뷰 활동으로 왓츄VIP에 도전해보세요!  <i class="fa fa-diamond" style="font-size:36px"></i></p>
</section>


</article>
<!-- 아티클 영역 -->





<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->



</body>
</html>