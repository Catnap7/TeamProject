<%@page import="net.member.db.MemberBean"%>
<%@page import="net.vip.db.VipResBean"%>
<%@page import="net.vip.db.VipResDAO"%>
<%@page import="net.vip.db.VipBean"%>
<%@page import="net.vip.db.VipDAO"%>
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
<link href="./css/vip_done.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="../js/jquery-3.3.1.js"></script>

<!-- 웹 폰트 : 나눔고딕 / Do Hyeon/ Abril Fatface -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Do+Hyeon|Abril+Fatface" rel="stylesheet">

</head>
<body>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->


<article>


<%
MemberBean memberbean=(MemberBean)request.getAttribute("memberbean");
VipBean vipbean=(VipBean)request.getAttribute("vipbean");
VipResBean vipresbean=(VipResBean)request.getAttribute("vipresbean");

String selectedSeat=(String)request.getAttribute("selectedSeat");

%>

<div class="vip_done">
<div class="title">시사회 예매가 완료 되었습니다</div>

	<div class="ticket">
		<div class="pic">
 			<img id="pic_ticket" src="./images/ticket.png" width="650px" height="350px">
 			<div class="vipMvTitle"><%=vipbean.getV_kor_title()%></div>
 			<div class="vipMvEngTitle"><%=vipbean.getV_eng_title()%></div>
 			<div class="vipMvDate"><%=vipbean.getV_date()%></div>
 			<div class="vipMvWhen"><%=vipbean.getV_when()%></div>
 			<div class="vipMvWhere">영화의 전당 이벤트 홀</div>
 			<div class="vipSeat">[좌석번호 : <%=selectedSeat%>]</div>
 		</div>
	</div> 


	<p class="title">오시는 길</p>
	<div class="way">
		<div id="address">
			<p><%="<"%>부산 영화의 전당<%=">"%></p>
			<p>부산 해운대구 수영강변대로 120</p>
			<p>*주차공간이 혼잡하오니 대중교통을 이용바랍니다</p>
		</div>
		
		<!-- 구글 맵 API -->
		<div id="map"></div>
		    <script>
		      function initMap() {
		        var uluru = {lat: 35.171450, lng: 129.127206};
		        var map = new google.maps.Map(document.getElementById('map'), {
		          zoom: 17,
		          center: uluru
		        });
		        var marker = new google.maps.Marker({
		          position: uluru,
		          map: map
		        });
		      }
		    </script>
		    <script async defer
		    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxRlHe08HPY3WWMDA9MR5jutkGOj9OIHs&callback=initMap">
		    </script>
	</div><!-- way -->
	
</div>
</article>


<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>