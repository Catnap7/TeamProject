<%@page import="net.pay.db.PayBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄:이용권 결제</title>

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

%>
<article>
	<table border="1">
		<tr>
			<td rowspan="2">이용권 상태</td>
	<%
		if(currentpaybean!=null){
	%>
			<td><%=currentpaybean.getP_end_day() %>까지 이용이 가능합니다</td>
		</tr>
		<tr>
				<!-- //자동결제, 한달결제 -->
			<td><%=currentpaybean.getP_auto() %></td></tr>
		<%}else{ %>
			<td>보유하신 이용권이 없습니다</td>
		</tr>
		<tr>
			<td><a href="./Pay.pa">이용권 구매하러 가기</a></td></tr>
		<%} %>
		<tr>
			<td>쿠폰</td><td><%=couponcheckString %></td>
		</tr>
	</table>
	
	<table border="1">
		<tr><td colspan="4">결제내역</td></tr>
			<%if(paylist.size()!=0){
				String p_auto="";%>
		<tr><td>결제일</td><td>만료일</td><td>결제방식</td><td>결제 금액</td></tr>		
			<%for(int i=0;i<paylist.size();i++){
				PayBean paybean=(PayBean)paylist.get(i);
				if(paybean.getP_auto().equals("정기")){p_auto="정기결제";}
				else if(paybean.getP_auto().equals("해지")){p_auto="정기결제(해지)";}
				else if(paybean.getP_auto().equals("한달")){p_auto="한달결제";}
				%>		
		<tr><td><%=paybean.getP_start_day() %></td><td><%=paybean.getP_end_day() %></td><td><%=p_auto%></td><td><%=paybean.getP_charge() %></td></tr>
			<%}
			}else{%>
		<tr><td colspan="3">결제 내역이 없습니다.</td></tr>
			<%}	%>
	</table>

<%

if(currentpaybean!=null){
if(currentpaybean.getP_auto().equals("정기")){ %>
<input type="button" onclick="pcancel()" value="해지하기">
<% }else if(currentpaybean.getP_auto().equals("한달")){ %>

<a href="./Pay.pa">정기결제하기</a>

<% }
}%>


</article>



</body>
</html>