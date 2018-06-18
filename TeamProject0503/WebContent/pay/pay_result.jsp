<%@page import="net.pay.db.PayBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄:이용권 결제</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/pay2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function pcancel(){
	var a=confirm("해지하시겠습니까?");
	if(a){
		location.href='./PayCancel.pa';	
	}else{
		return;
	}
}
</script>

</head>
<body>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<%

boolean couponcheck=(boolean)request.getAttribute("couponcheck");
String couponcheckString="";
if(couponcheck==true){
	couponcheckString="사용가능한 쿠폰이 있습니다.";
}else{
	couponcheckString="사용가능한 쿠폰이 없습니다.";
}


List paylist=(List)request.getAttribute("paylist");
PayBean currentpaybean=(PayBean)request.getAttribute("currentpaybean");

String pageNum_s= (String)request.getAttribute("pageNum");
int pageNum = Integer.parseInt(pageNum_s);
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
int count = ((Integer)request.getAttribute("count")).intValue();
%>
<article>
	<table class="state">
		<tr>
			<th rowspan="2" class="radius_lt lett_min">이용권 상태</th>
	<%
		if(currentpaybean!=null){
	%>
			<td class="radius_rt"><%=currentpaybean.getP_end_day() %>까지 이용이 가능합니다</td>
		</tr>
		<tr>
				<!-- //자동결제, 한달결제 -->
			<td><%=currentpaybean.getP_auto() %></td></tr>
		<%}else{ %>
			<td class="radius_rt">보유하신 이용권이 없습니다</td>
		</tr>
		<tr>
			<td><a href="./Pay.pa">이용권 구매하러 가기</a></td></tr>
		<%} %>
		<tr>
			<th class="radius_lb lett_plus">&nbsp;쿠 폰</th><td class="radius_rb"><%=couponcheckString %></td>
		</tr>
	</table>
	
	<table class="list" id="list">
		<tr><th colspan="4" class="radius_ltrt lett_plus bold_line">결 제 내 역</th></tr>
			<%if(paylist.size()!=0){
				String p_auto="";%>
		<tr class="bg_light"><th>결제일</th><th>만료일</th><th>결제방식</th><th>결제금액</th></tr>		
			<%for(int i=0;i<paylist.size();i++){
				PayBean paybean=(PayBean)paylist.get(i);
				if(paybean.getP_auto().equals("정기")){p_auto="정기결제";}
				else if(paybean.getP_auto().equals("해지")){p_auto="정기결제(해지)";}
				else if(paybean.getP_auto().equals("한달")){p_auto="한달결제";}
				%>		
		<tr><td class="tb_line"><%=paybean.getP_start_day() %></td><td class="tb_line"><%=paybean.getP_end_day() %></td><td class="tb_line"><%=p_auto%></td><td class="tb_line"><%=paybean.getP_charge() %></td></tr>
			<%}
			}else{%>
		<tr><td colspan="4">결제 내역이 없습니다.</td></tr>
			<%}	%>
		<tr><td colspan="4" class="radius_lbrb bold_line">	</td></tr>		
	</table>

<%
//정기결제 일때 해지하기만 구현, 
//한달결제일때 정기결제로 바꾸는것은 구현x
//해지한 사용자의 재결제 구현x
if(currentpaybean!=null){
if(currentpaybean.getP_auto().equals("정기")){ %>
<input type="button" onclick="pcancel()" value="해지하기" id="pcancel">

<% 
}
}%>

<%
if(count != 0){
%>	
	 <div class="prev_next">
		<%
		if(startPage>pageBlock){			
			%><a href="./PayList.pa?pageNum=<%=startPage-pageBlock%>#list">prev</a><%
		}
		for(int i=startPage;i<=endPage;i++) {
			%><a href="./PayList.pa?pageNum=<%=i%>#list"><span <%if(i==pageNum){%>style=color:red;<%} %>><%=i%></span></a><%
		}
		if(pageCount>endPage){
			%><a href="./PayList.pa?pageNum=<%=startPage+pageBlock%>#list">next</a><%
		}
		%>
	
<%
}
%>
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>