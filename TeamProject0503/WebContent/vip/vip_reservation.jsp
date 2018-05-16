
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
<title>왓츄 : VIP </title>

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
				
				if(vipbean.getV_age()==0){
					   age = "전체이용가";
					}else if(vipbean.getV_age()==12){
					   age = "12세이용가";
					}else if(vipbean.getV_age()==15){
					   age="15세이용가";
					}else if(vipbean.getV_age()==19){
					   age="청소년이용불가";
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

	<span id="seat">원하시는 좌석을 선택 해 주세요</span>
	<div id="screen">SCREEN</div>
	
	
	<form action="VipResult.vi" method="post" name="fr">

		 <% List<VipResBean> VipSeatTakenList = (List)request.getAttribute("VipSeatTakenList");%>
		<table border="1" class="seatTable">
			 	<%vipresbean=(VipResBean)VipSeatTakenList.get(0);%>
			<tr>
				<%if(vipresbean.getV_seatSelected().equals("0")){%> <!-- 좌선이 선택되지 않음 -->
					<td class="seatUnselected"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><span><%=vipresbean.getV_seatNum()%></span></label></td>
					
					<td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td>
					
					<script>
						function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
					</script>
				
				<%}else if(vipresbean.getV_seatSelected().equals("1")){%> <!-- 좌선이 선택 됨 -->
					<td><p class="seatSelected" name="seat"><span><%="X"%><%=vipresbean.getV_seatNum()%></span></p></td>
					<td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td>
				<%} %>
			</tr>
		</table>  


	
	<table border="1" class="seatTable">
			
		<tr>
			 <% 
		 	for(int i=2;i<=5;i++){
		 	vipresbean=(VipResBean)VipSeatTakenList.get(i);
		 	
		 	if(vipresbean.getV_seatSelected().equals("0")){%>
				<td class="seatUnselected"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><span><%=vipresbean.getV_seatNum()%></span></label></td>
				
				<%-- <td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td> --%>
				<script>
					function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
				</script>
			
			<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
				<td><p class="seatSelected" name="seat"><span><%="X"%><%-- <%=vipresbean.getV_seatNum()%> --%></span></p></td>
				<%-- <td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td> --%>
				
			<%}} %>
		</tr>
		<tr>
			 <% 
		 	for(int i=6;i<=9;i++){
		 	vipresbean=(VipResBean)VipSeatTakenList.get(i);
		 	
		 	if(vipresbean.getV_seatSelected().equals("0")){%>
				<td class="seatUnselected"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><span><%=vipresbean.getV_seatNum()%></span></label></td>
				
				<%-- <td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td> --%>
				<script>
					function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
				</script>
			
			<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
				<td><p class="seatSelected" name="seat"><span><%="X"%><%-- <%=vipresbean.getV_seatNum()%> --%></span></p></td>
				<%-- <td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td> --%>
				
			<%}} %>
		</tr>
	</table> 
	
	
	
	
	
	
	
	<table border="1">
		<tr>
			<th>좌석 번호</th><th>예약여부</th>
		</tr>
		
		 <% 
		 	vipresbean=(VipResBean)VipSeatTakenList.get(1);

		 	%>
		<tr>
			<td class="seatNum"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><span><%=vipresbean.getV_seatNum()%></span></label></td>
			
			<%if(vipresbean.getV_seatSelected().equals("0")){%>
				<td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td>
			
			<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
				<td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td>
			<%} %>
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
	<div class="clear"></div>
	
</div><!-- seatTable -->

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