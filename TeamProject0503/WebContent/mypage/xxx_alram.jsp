<%@page import="net.mypage.db.AlarmBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 알림</title>
</head>
<body>
<%
List<AlarmBean> alarmlist = (List)request.getAttribute("alarmlist");
%>
<h1>알림창</h1>
<table border="1">
<tr><th>내용</th></tr>
<%
if(alarmlist == null){
%>
<tr><td colspan="3">알람내용이 없습니다.</td></tr>
<% 
}else{
	String name=null;	
	for(AlarmBean alarmbean:alarmlist){			
		int a_name = alarmbean.getA_alarm_name();		
		switch(a_name){
		case 0 :  name = "영화 "+alarmbean.getA_movie_name()+"의 후기가 추천받았습니다!";
		break;
		case 1 :  name = "이용자님께서는 후기쓰기 이용을 7일간 하실 수 없습니다.(누적신고 3회)";
		break;
		case 2 :  name = "후기쓰기를 다시 이용하실 수 있습니다!";
		break;
		case 3 :  name = "이용자님께서는 로그인 정지가 임박합니다.(누적신고 9회)";
		break;		
		}
%>
<tr><th><%=name%></th></tr>	
<%	
	}
}
%>
</table>
</body>
</html>