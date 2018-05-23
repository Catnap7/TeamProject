<%@page import="java.util.List"%>
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
<title>Vip 관리 페이지</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">
<link href="./css/vip.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
</head>
<body>
<%
VipDAO vipdao = new VipDAO();
VipBean vipbean=vipdao.getVipMovie(); 

VipResDAO vipresdao = new VipResDAO();
VipResBean vipresbean=new VipResBean();

List<VipResBean> VipSeatTakenList = (List)request.getAttribute("VipSeatTakenList");

%>
<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<!-- vip 서브메뉴 -->
<jsp:include page="../vip/vipAdmin_sub.jsp"/>
<!-- vip 서브메뉴 -->


<div id="content">
이번달 영화
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
		</div>
</div>
		
			
vip시사회 좌석현황 

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

vip시사회 예매현황 

</div>




<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>