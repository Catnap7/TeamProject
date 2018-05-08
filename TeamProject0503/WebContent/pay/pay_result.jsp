<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄:이용권 결제</title>


</head>
<body>


<article>


	<table border="1">
		<tr>
			<td rowspan="2">이용권 상태</td><td>이용권 유무 나타나게 해주세요</td>
		</tr>
		<tr>
			<td><a href="pay.jsp">이용권 구매하러 가기</a></td>
		</tr>
		<tr>
			<td>쿠폰</td><td>쿠폰 유무 나타나게 해주세요</td>
		</tr>
	</table>
	
	<table border="1">
		<tr><td colspan="3">결제내역</td></tr>
		<tr><td>날짜</td><td>결제방식</td><td>결제 금액</td></tr>
		<tr>	
			<%-- <%for(int i=0;){ %> for문으로 결제내역 list 불러오시면됩니다--%>
			<td><% %></td><td><% %></td><td><% %></td>
			<%-- <%} %> --%>
		</tr>
	</table>


</article>



</body>
</html>