
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.vip.db.VipResBean"%>
<%@page import="java.util.List"%>
<%@page import="net.vip.db.VipResDAO"%>
<%@page import="net.vip.db.VipBean"%>
<%@page import="net.vip.db.VipDAO"%>
<%@page import="net.member.db.MemberBean"%>

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
<link href="./css/vip.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="../js/jquery-3.3.1.js"></script>

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo|Nanum+Pen+Script|Song+Myung" rel="stylesheet">

<script type="text/javascript">
</script>


</head>
<body>
<%

String id=(String)session.getAttribute("m_id");

if(id==null){
	response.sendRedirect("./MemberLogin.me");
}


MemberBean memberbean=(MemberBean)request.getAttribute("memberbean");
String name=memberbean.getM_name();
/* int grade=memberbean.getM_grade();
 */

VipDAO vipdao = new VipDAO();
VipBean vipbean=vipdao.getVipMovie(); 

VipResDAO vipresdao = new VipResDAO();
VipResBean vipresbean=new VipResBean();

int v_num=vipbean.getV_num();


int check=vipresdao.VipSeatTakenListCheck(id);
vipresbean=vipresdao.getYourSeat(id);
%>


<!-- 아티클 영역 -->
<article class="vip_res">

 	<section class="pic_frame">
		<div class="pic">
 			<img id="pic_src" src="./images/vip4_1.png">
 			<div class="vip_name"><%=name%><span><%="님"%></span></div>
 		</div>
	</section> <!-- pic_frame -->
	
	
	<section class="content">	
		
	<div class="movie_title"><p>이 달의 영화</p></div>
		<div class="poster"><img src="./images/vip/<%=vipbean.getV_eng_title().replaceAll(" ","")+"_p.jpg"%>" width="370" height="500"></div>
		<div class="movie_info">
			<P><%=vipbean.getV_kor_title()%></P>
			<p><%=vipbean.getV_director()%><%="  감독"%></p>
			<p><%=vipbean.getV_year()%><%="년도 개봉" %></p>
			<p>
				<%
				String age = "";
				switch(vipbean.getV_age()){
				case 0  : age="전체이용가"; break;
				case 12	: age="12세이용가"; break;
				case 15	: age="15세이용가"; break;
				case 19 : age="청소년관람불가"; break;
				}
				%>
				<%=age%>
			</p>
			<p><%=vipbean.getV_genre()%></p>
			<p><%=vipbean.getV_actor().replaceAll(","," , ")%></p>
			<p><%=vipbean.getV_story()%></p>
		</div>
	
		<div class="still">
			<img src="./images/vip/<%=vipbean.getV_eng_title().replaceAll(" ","")+"_s.jpg"%>">
			<img src="./images/vip/<%=vipbean.getV_eng_title().replaceAll(" ","")+"_s2.jpg"%>">
		</div>
	
		<div class="frame">
			<iframe width="1040px" height="760px" src="<%=vipbean.getV_video()%>" allowfullscreen frameborder="0" scrolling="no"></iframe>
		</div>
		
	<div class="movie_title"><p>이 달의 영화 PICK! REVIEWS</p></div>
		<div class="critic">
				<div id="critic1">
					<p><img src="./images/left_quote.png" width="25px" height="20px"><%="  "%><%=vipbean.getV_critic_1()%><%="  "%><img src="./images/right_quote.png" width="25px" height="20px"></p>
					<p>-  <%=vipbean.getV_critic_1_by()%></p>
				</div>
				<div id="critic2">
					<p><img src="./images/left_quote.png" width="25px" height="20px"><%="  "%><%=vipbean.getV_critic_2()%><%="  "%><img src="./images/right_quote.png" width="25px" height="20px"></p>
					<p>-  <%=vipbean.getV_critic_2_by()%></p>
				</div>
		</div>

<div class="clear"></div>
	
	
	
	
<div class="movie_title"><p>VIP시사회 예매하기</p></div>
<div class="seatRes">

	

<%
if(check==0){%>	
<span id="seat">원하시는 좌석을 선택 해 주세요</span>
	<div id="screen">SCREEN</div>
		<form action="VipResult.vi" method="post" name="fr">
			<% List<VipResBean> VipSeatTakenList = (List)request.getAttribute("VipSeatTakenList");%>
			<table class="seatTable">	
				<tr>
					 <% 
				 	for(int i=0;i<=4;i++){
				 	vipresbean=(VipResBean)VipSeatTakenList.get(i);
				 	
				 	if(vipresbean.getV_seatSelected().equals("0")){%>
						<td class="seatUnselected"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><p><%=vipresbean.getV_seatNum()%></p></label></td>
						
						<%-- <td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td> --%>
						<script>
							function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
						</script>
						
						
						<div><p id="selectedSeat"></p></div>
						
					
					<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
						<td><p class="seatSelected" name="seat"><span><%="X"%><%-- <%=vipresbean.getV_seatNum()%> --%></span></p></td>
						<%-- <td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td> --%>
						
					<%}} %>
				</tr>
				<tr>
					 <% 
				 	for(int i=5;i<=9;i++){
				 	vipresbean=(VipResBean)VipSeatTakenList.get(i);
				 	
					 	if(vipresbean.getV_seatSelected().equals("0")){%>
							<td class="seatUnselected"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><p><%=vipresbean.getV_seatNum()%></p></label></td>
							
							<%-- <td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td> --%>
							<script>
								function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
							</script>
						
						<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
							<td><p class="seatSelected" name="seat"><span><%="X"%><%-- <%=vipresbean.getV_seatNum()%> --%></span></p></td>
							<%-- <td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td> --%>
						<%}
				 	}//for %>
				</tr>
			</table> 
		<script>
				function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
		</script>
		
		 <input class="button" type="submit" value="예매하기">	
	</form>

	<table class="prev_date">
		<tr><td>시사회 날짜</td></tr>
		<tr><td><%=vipbean.getV_date()%></td></tr>
		<tr><td><%=vipbean.getV_when()%></td></tr>	
		<tr><td>선택 하신 좌석</td></tr>		
	</table>
	<div><p id="selectedSeat"></p></div>
	
	
	
<%}else if(check==1){%>	

	<!-- 예매 완료된 vip에게 보여지는 화면 -->
		<h2>예매 확인</h2>
		<div id="screen2">SCREEN</div>
			<table class="seatTable table2">
				<tr><%
					int a=Integer.parseInt(vipresbean.getVr_seat_num());
					for(int i=1;i<=5;i++){ 
							if(i==a){%> 
								<td><p class="confirm_num"><%=i%></p></td>
							<%}else{%>
								<td><%=i%></td>
							<%} }%>
				</tr>
				<tr>
					<%for(int i=6;i<=10;i++){ 
							if(i==a){%>
								<td><p class="confirm_num"><%=i%></p></td>
							<%}else{%>
								<td><%=i%></td>
							<%} }%>
				</tr>
			</table>
		<table class="prev_date confirm">
			<tr><td>시사회 날짜</td></tr>
			<tr><td><%=vipbean.getV_date()%></td></tr>
			<tr><td><%=vipbean.getV_when()%></td></tr>	
			<tr><td>선택 하신 좌석</td></tr>		
		</table>
			<p id="yourSeat"><%=vipresbean.getVr_seat_num()%></p>
			
		<div class="button2"><a href="VipResDelete.vi">예매취소</a></div>
		<p id="warning">예매를 취소 하신 후 새로 예매하지 않으시면 시사회 참석이 불가합니다</p>
	
	
	<!-- Google Map -->
	<div class="way">
		<h2>오시는 길</h2>
		<div id="address">
			<p><%="<"%>부산 영화의 전당<%=">"%></p>
			<p>부산 해운대구 수영강변대로 120</p>
			<p>*주차공간이 혼잡하오니 대중교통을 이용바랍니다</p>
		</div>
		
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
	<%} %>
	
	
	

</div><!-- seatTable -->

<div class="clear"></div>
	


<div class="clear"></div>


<div class="up"><a href="#">▲<br>▲</a></div>

</section><!-- content -->


</article>
<!-- 아티클 영역 -->


<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>