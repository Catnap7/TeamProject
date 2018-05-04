<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/member.css" rel="stylesheet" type="text/css">
<script src="../script/script.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>

<% 
session.invalidate();
%>
<div class="m_cover">
<div class="logo">
<a href="./MemberLogin.me"><img src="../images/watchu_logo.png" alt="logo"></a>
</div>

<div class="nav_r">
<a href="./MemberLogin.me">로그인</a>
</div>

<div class="clear"></div>

<div class="div_01">
		<div class="div_02">
			<span>저런! 비밀번호를 잊어버리셨군요.</span>
		</div>
	<div>
		<form action="./FindPassAction.me" id="join" method="post">
			<label>
			<input type="text" name="m_id" placeholder="이메일 (example@gmail.com)">
			</label><br>
			<p>
			기존에 가입하신 이메일 주소를 입력해주시면<br>
			임시비밀번호가 발송됩니다.임시비밀번호를 입력하신 뒤 
			새로운 비밀 번호를 설정하세요.
			</p>
		<div>
			<input type="submit" value="임시비밀번호 발급" id="submit">
		</div>
		</form>
	</div>
</div>
</div>
</body>
</html>