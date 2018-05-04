<%@page import="net.member.db.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/member.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript">

function fun2(){
	if(document.fr.num1.value.length==6){
		document.fr.num2.focus();
	}
}
</script>
</head>
<body>
<div class="m_cover">
<div class="logo">
<a href="./MemberLogin.me"><img src="../images/watchu_logo.png" alt="logo"></a>
</div>

<div class="nav_r">
</div>

<div class="clear"></div>

<div class="div_01">
		<div class="div_02">
			<span>회원정보수정</span>
		</div>
	<div>
		<form action="./MemberJoinAction.me" id="join" method="post" name="fr">
			<label>
			<input type="text" name="name" placeholder="이름 (김와츄)" >
			</label><br>
			<label>
			<input type="text" name="password" placeholder="비밀번호 (6자 이상)">
			</label><br>
			<label>
			
		<div>
			<input type="submit" value="회원가입">
		</div>
		</form>
	</div>
</div>
</div>
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("./MemberLogin.me");
}
MemberBean mb= (MemberBean)request.getAttribute("mb");


%>
<form action="./MemberUpdateAction.me" method="post" name="fr">
아이디:<input type="text" name="id" value="<%=mb.getM_id()%>" readonly><br>
비밀번호:<input type="password" name="pass"> <br>
이름:<input type="text" name="name" value="<%=mb.getM_name()%>"> <br>
<input type= "submit" value="회원정보수정">





</form>
</body>
</html>