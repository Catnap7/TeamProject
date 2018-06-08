<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 회원정보수정</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mypage.css" rel="stylesheet" type="text/css">
<script src="./js/jquery-3.3.1.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
</head>
<body>
<script>
function check(){
	if (document.fr.pass.value=="") {
		alert("비밀번호를 입력해주십시오");
		document.fr.pass.focus();
		return false;
	}
	if (document.fr.pass2.value=="") {
		alert("비밀번호를 입력해주십시오");
		document.fr.pass2.focus();
		return false;
	}
	if(document.fr.pass.value!=document.fr.pass2.value){
		alert("비밀번호를 같게 입력하세요");
		return false;
	}
	if (document.fr.dup_name_check.value==-1) {
		alert("이름 중복체크하세요.")
		return false;	
	}
	if (document.fr.dup_name_check.value==1) {
		alert("중복된 이름은 사용하실 수 없습니다.")
		return false;	
	}
}
function check2(){
	alert("아이디는 수정할 수 없습니다");
	document.fr.pass.focus();
}

$(document).ready(function() {
		var a_check=/[~!@#$%^&*()_+|<>?:{}]/;
		var space_check=/[\s]/g;
	$('#name_dup').click(function() {
	  if (document.fr.m_name.value == "") {
			alert("이름을 입력하지 않았습니다.");
			document.fr.m_name.focus()
			return false;
	}
	  if (document.fr.m_name.value.length <= 2 
				|| document.fr.m_name.value.length >= 9) {
			alert("이름을 3자 이상 8자이하 입력해주십시오.");
			document.fr.m_name.focus()
			return false;
		}
		
		if(space_check.test(document.fr.m_name.value)){
			alert("이름엔 공백은 들어 갈 수 없습니다.")
			document.fr.m_name.focus();
			return false;
		}
		if(a_check.test(document.fr.m_name.value)){
			alert("이름엔 특수문자는 들어 갈 수 없습니다.")
			document.fr.m_name.focus();
			return false;
		}  
	var m_name =$('#name').val();
	$.ajax({
		type:'post',
		url:'./MemeberNameDup.me',
		data:{
			'm_name':m_name
		},
		success:function(data){
			if(data==1){
				$('#dup_name_check').val('1');
				alert("중복된 이름입니다.")
			}else if(data==0){
				$('#dup_name_check').val('0');
				alert("사용가능한 이름입니다.")
			}
		}
	}); 
});
}); 
</script>
<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->
<%
String id = (String)request.getAttribute("id");
String name = (String)request.getAttribute("name");
%>
<article>

<div class="mypage_">
	<div class="mypage_update">
		<h2 class="pw_check">수정 할 정보 입력</h2>
		
		<form action="./UpdateAction.my" method="get" name="fr" onsubmit="return check()">
			<input type="text" value placeholder="<%=id%>" class="update" readonly name="id" onkeypress="check2()"><br>
			<input type="password" value placeholder="변경 할 비밀번호 입력" class="update" name="pass"><br>
			<input type="password" value placeholder="변경 할 비밀번호 재입력" class="update" name="pass2"><br>
			<input type="text" value="<%=name%>" class="update_name" name="m_name"  id="name">
			<input type="button" value="중복체크" id="name_dup" class="name_text">
         	<input type="hidden" value="-1" id="dup_name_check"> 
			<input type="submit" value="확인" class="update_text">
			<input type="reset" value="다시쓰기" class="update_text2">
		</form>
	</div>
</div>

<div class="clear"></div>

</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>