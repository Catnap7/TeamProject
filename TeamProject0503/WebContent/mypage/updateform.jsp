<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄 : WATCHU</title>

<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mypage.css" rel="stylesheet" type="text/css">

<!-- jquery -->
<script src="./js/jquery-3.3.1.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>

</head>
<body>
<%
String id = (String)request.getAttribute("id");
String name = (String)request.getAttribute("name");
%>
<script>
function check(){
	var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;//이름에 한글만 입력하는 부분
	var e_check= /[a-z]/;
	var E_check=/[A-Z]/;
	var t_check=/[0-9]/;
	var space_check=/[\s]/g;
	var a_check=/[~!@#$%^&*()_+|<>?:{}]/;
	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;//이메일 혹인

	var orginName="<%=name%>";
	if(document.fr.pass.value!=""||document.fr.pass2.value!=""||document.fr.m_name.value!=orginName){
		if(document.fr.pass.value!=""||document.fr.pass2.value!=""){
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
				alert("비밀번호를 동일하게  입력하세요");
				return false;
			}
			if (document.fr.pass.value.length< 8 
					||document.fr.pass.value.length>15) {//비밀번호 확인하는부분
				alert("비밀번호는 8자 이상 15자 이하로 입력하세요.")
				document.fr.pass.focus();
				return false;
			}
			if(!document.fr.pass.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/))
		    {
				  alert("숫자 특수문자 영문자  조합으로 비밀번호를 입력하세요");
		    	document.fr.pass.focus();
		        return false;
		    }
			if (!e_check.test(document.fr.pass.value)) {
				  alert("숫자 특수문자 영문자  조합으로 비밀번호를 입력하세요");
				document.fr.pass.focus()
				return false;
			}
			if (!t_check.test(document.fr.pass.value)) {
				  alert("숫자 특수문자 영문자  조합으로 비밀번호를 입력하세요");
				document.fr.pass.focus()
				return false;
			}
			if(space_check.test(document.fr.pass.value)){
				alert("비밀번호엔 공백은 들어 갈 수 없습니다.")
				document.fr.pass.focus();
				return false;
			}
			
			if (fr.pass.value == fr.id.value) {
				alert("아이디와 같은 비밀번호는 사용 하실 수 없습니다.");
				document.fr.pass.focus()
				return false;
			}
		}
		if (document.fr.m_name.value!=orginName) {
			if (document.fr.dup_name_check.value==-1) {
			alert("이름 중복체크하세요.")
			return false;	
			}
		}
		if (document.fr.dup_name_check.value==1) {
			alert("중복된 이름은 사용하실 수 없습니다.")
			return false;	
		}
	}else{
		if (confirm("변경사항이 없습니다. 수정 완료하시겠습니까?")) {
		   
		} else {
		    return false;
		}
	}
}

function resetdup(){
	document.fr.dup_name_check.value=-1;
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

<article>

<div class="mypage_">
	<div class="mypage_update">
		<h2 class="pw_check">수정 할 정보 입력</h2>
		
		<form action="./UpdateAction.my" method="post" name="fr" onsubmit="return check()">
			<input type="text" value placeholder="<%=id%>" class="update" readonly name="id" onkeypress="check2()"><br>
			<input type="password" value placeholder="변경 할 비밀번호 입력" class="update" name="pass"><br>
			<input type="password" value placeholder="변경 할 비밀번호 재입력" class="update" name="pass2"><br>
			<input type="text" value="<%=name%>" class="update_name" name="m_name"  id="name" onkeyup="resetdup()">
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