<%@page import="net.follow.db.TimeLineBean"%>
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
<%List timeline=(List)request.getAttribute("timelinelist"); 
	for(int i=0; i<timeline.size(); i++){
		TimeLineBean timeLineBean =  (TimeLineBean)timeline.get(i);
		%>
			<label value="<%=timeLineBean.getTitle()%>"></label>
		<%
		System.out.println(timeLineBean.getFo_following()+"님이"+timeLineBean.getTitle()+"에"+timeLineBean.getKind()+"주었습니다.");
	}
%>
</body>
</html>