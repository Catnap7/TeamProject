<%@page import="net.mypage.db.AlarmDAO"%>
<%@page import="net.mypage.db.AlarmBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 알람 등록하기 코드 -->
<%
Calendar cal= new GregorianCalendar();
cal.add(Calendar.MONTH,1);
cal.clear(Calendar.MILLISECOND);
SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
String a_end_day=date.format(cal.getTime()).toString();

AlarmBean ab = new AlarmBean();
ab.setA_id("wahchu"); //아이디값 넣기
ab.setA_alarm_name(0); // 0 : 새추천 알람, 1 : 후기쓰기 정지 알람, 2:후기쓰기 정지 해제 알람, 3: 로그인정지 임박 알람
ab.setA_end_day(a_end_day);
//ab.setA_movie_name("영화제목"); //새추천 알림일 경우 주석제거하고 영화제목 넣어주세요.

AlarmDAO adao = new AlarmDAO();
adao.insertAlarm(ab);
%>
<!-- 알람 등록하기 코드 -->
</body>
</html>