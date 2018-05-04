<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/member.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

function check1(){
	   if(document.getElementById("id").value ==""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return false;
	   }if(document.fr.id.value.length<4 || document.fr.id.value.length>9){
			alert("아이디는 4자 이상 9자 이하입니다 ")
			document.fr.id.focus();
		   return false;
	   }



}
function fun2(){
	if(document.fr.m_num1.value.length==6){
		document.fr.m_num2.focus();
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
<a href="./MemberLogin.me">로그인</a>
</div>

<div class="clear"></div>

<div class="div_01">
		<div class="div_02">
			<span>회원가입</span>
		</div>
	<div>
		<form action="./MemberJoinAction.me" id="join" method="post" name="fr" onsubmit="return check1()">
			<label>
			<input type="text" name="m_name" id="id" placeholder="이름 (김와츄)" >
			</label><br>
			<label>
			<input type="text" name="m_id" placeholder="이메일 (example@gmail.com)">
			</label><br>
			<label>
			<input type="text" name="m_pass" placeholder="비밀번호 (6자 이상)">
			</label><br>
			<label>
			<input type="text" name="m_num1" placeholder="주민등록번호 앞자리" onkeyup="fun2()" maxlength="6">
			</label><br>
			<label>
			<input type="text" name="m_num2" placeholder="주민등록번호 뒷자리" maxlength="1">
			</label><br>
		<div>
			<input type="submit" value="회원가입">
		</div>
		</form>
	</div>
</div>
</div>
</body>
</html>