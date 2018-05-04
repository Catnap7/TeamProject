<%@page import="net.mypage.db.CouponBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<CouponBean> couponlist = (List)request.getAttribute("couponlist");
%>
<h1>나의 쿠폰함</h1>
<table border="1">
<tr><th>번호</th><th>쿠폰명</th><th>만료일자</th></tr>
<%
if(couponlist == null){
%>
<tr><td colspan="3">쿠폰이 없습니다.</td></tr>
<% 
}else{
	String name=null;
	int num = 0;
	for(CouponBean couponbean:couponlist){	
		num++;
		int c_name = couponbean.getC_name();		
		switch(c_name){
		case 0 :  name = "50% 쿠폰";
		break;
		case 1 :  name = "100% 쿠폰";
		break;
		case 2 :  name = "VIP 쿠폰";
		break;
		}
%>
<tr><td><%=num%></td><td><%=name%></td><td><%=couponbean.getC_end_day()%></td></tr>	
<%	
	}
}
%>
</table>
</body>
</html>