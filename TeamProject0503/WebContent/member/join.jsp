<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/member.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check1() {

		var id = document.fr.id.value;
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

		if (document.getElementById("id").value == "") {
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return false;
		}
		if (document.fr.id.value.length < 5) {
			alert("아이디는 최소 8자 이상 입니다 ");
			document.fr.id.focus();
			return false;
		}

		if (document.fr.id.value.indexOf(" ") >= 0) {
			alert("아이디에 공백을 사용할 수 없습니다.");
			document.fr.id.focus()
			document.fr.id.select()
			return false;
		}

		//비밀번호 입력여부 체크
		if (document.fr.pwd.value == "") {
			alert("비밀번호를 입력하지 않았습니다.");
			document.fr.pwd.focus()
			return false;
		}
		if (fr.pwd.value == fr.id.value) {
			alert("아이디와 비밀번호가 같습니다.");
			document.fr.pwd.focus()
			return false;
		}
		if (regex.test(id) === false) {
			alert("잘못된 이메일 형식입니다.");
			document.fr.id.value = ""
			document.fr.id.focus()
			return false;
		}
		if (document.fr.name.value == "") {
			alert("이름을 입력하지 않았습니다.");
			document.fr.name.focus()
			return false;
		}
		if (document.fr.name.value.length < 2) {
			alert("이름을 2자 이상 입력해주십시오.");
			document.fr.name.focus()
			return false;
		}
		 if (document.fr.pwd.value.length < 4) {
			alert("비밀번호를 5자 이상 입력해주십시오.");
			document.fr.pwd.focus()
			return false;
		}

		if (document.fr.m_num1.value == "") {
			alert("주민번호를 입력하지 않았습니다.");
			document.fr.m_num1.focus()
			return false;
		}
		if (document.fr.m_num2.value == "") {
			alert("주민번호를 입력하지 않았습니다.");
			document.fr.m_num2.focus()
			return false;
		}

		// 숫자가 아닌 것을 입력한 경우
		if (!isNumeric(document.fr.m_num1.value)) {
			alert("주민번호는 숫자로 입력하세요.");
			document.fr.m_num1.value = ""
			document.fr.m_num1.focus()
			return false;
		}
		// 숫자가 아닌 것을 입력한 경우
		if (!isNumeric(document.fr.m_num2.value)) {
			alert("주민번호는 숫자로 입력하세요.");
			document.fr.m_num2.value = ""
			document.fr.m_num2.focus()
			return false;
		}
		
	}
	function fun2() {
		if (document.fr.m_num1.value.length == 6) {
			document.fr.m_num2.focus();
		}
	}
</script>
</head>
<body>
	<div class="m_cover">
		<div class="logo">
			<a href="./MemberLogin.me"><img src="./images/watchu_logo.png"
				alt="logo"></a>
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
				<form action="./MemberJoinAction.me" id="join" method="post"
					name="fr" onsubmit="return check1()">
					<label> <input type="text" name="m_name" id="name"
						placeholder="이름 (김와츄)" class="text">
					</label><br> <label> <input type="text" name="m_id" id="id"
						placeholder="이메일 (example@gmail.com)" class="text">
					</label><br> <label> <input type="text" name="m_pass" id="pwd"
						placeholder="비밀번호 (6자 이상)" class="text" onkeyup="chkPwd(pwd)">
					</label><br> <label> <input type="text" name="m_num1"
						placeholder="주민등록번호 앞자리" class="text" onkeyup="fun2()"
						maxlength="6">
					</label><br> <label> <input type="text" name="m_num2"
						placeholder="주민등록번호 뒷자리" class="text" maxlength="1">
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