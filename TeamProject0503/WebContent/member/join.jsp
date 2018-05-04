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
	
	var id = document.fr.id.value;
    var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	
	   if(document.getElementById("id").value ==""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return false;
	   }if(document.fr.id.value.length<4 || document.fr.id.value.length>9){
			alert("아이디는 4자 이상 9자 이하입니다 ")
			document.fr.id.focus();
		   return false;
	   }

	   if (document.fr.id.value.indexOf(" ") >= 0) {
           alert("아이디에 공백을 사용할 수 없습니다.")
           document.fr.id.focus()
           document.fr.id.select()
           return false;
       }
       
       //비밀번호 입력여부 체크
       if (document.fr.pwd.value == "") {
           alert("비밀번호를 입력하지 않았습니다.")
           document.fr.pwd.focus()
           return false;
       }
       if (fr.pwd.value == fr.id.value) {
           alert("아이디와 비밀번호가 같습니다.")
           document.fr.pwd.focus()
           return false;
       }
       if (regex.test(id) === false) {
           alert("잘못된 이메일 형식입니다.");
           document.fr.id.value=""
           document.fr.id.focus()
           return false;
       }
       if (document.fr.name.value == "") {
           alert("이름을 입력하지 않았습니다.")
           document.fr.name.focus()
           return false;
       }
       if(document.f.my_name.value.length<2){
           alert("이름을 2자 이상 입력해주십시오.")
           document.f.my_name.focus()
           return false;
       }
       
       if (document.f.my_num.value == "") {
           alert("주민번호를 입력하지 않았습니다.")
           document.f.my_num.focus()
           return false;
       }
       if (document.f.my_num.value.length<13||document.f.my_num.value.length>13) {
           alert("주민번호 길이가 맞지 않습니다.")
           document.f.my_num.value = ""
           document.f.my_num.focus()
           return false;
       }
   
         // 숫자가 아닌 것을 입력한 경우
         if (!isNumeric(jumin1)) {
           alert("주민번호는 숫자로 입력하세요.");
           document.f.my_num.value = ""
           document.f.my_num.focus()
           return false;
         }
         
         // 첫번째 자료에서 연월일(YYMMDD) 형식 중 기본 구성 검사
         if (yy < "00" 
             || yy > "99" 
             || mm < "01" 
             || mm > "12" 
             || dd < "01" 
             || dd > "31") {
           alert("주민등록번호다시 입력하세요.");
           document.f.my_num.value = ""
               document.f.my_num.focus()
           return false;
         }
         
         // 숫자가 아닌 것을 입력한 경우
         if (!isNumeric(jumin2)) {
           alert("주민등록번호는 숫자로 입력하세요.");
           document.f.my_num.value = ""
               document.f.my_num.focus()
           return false;
         }
         
         // 성별부분이 1 ~ 4 가 아닌 경우
         if (genda < "1" || genda > "4") {
           alert("주민등록번호 다시 입력하세요.");
           document.f.my_num.value = ""
               document.f.my_num.focus()
           return false;
         }
         
         // Check Digit 검사
         if (!isSSN(jumin1, jumin2)) {
           alert("존재하는 주민번호가 아닙니다.");
           document.fr.my_num.value = ""
               document.fr.my_num.focus()
           return false;
         }
         fr.my_year.value ="19" +jumin1.charAt(0) + jumin1.charAt(1);
           fr.my_month.value = parseInt(jumin1.charAt(2))+parseInt(jumin1.charAt(3));
           fr.my_date.value = parseInt(jumin1.charAt(4)+jumin1.charAt(5));
        
       function isNumeric(s) { 
         for (i=0; i<s.length; i++) { 
           c = s.substr(i, 1); 
           if (c < "0" || c > "9") return false; 
         } 
         return true; 
       }
        
       function isSSN(s1, s2) {
         n = 2;
         sum = 0;
         for (i=0; i<s1.length; i++)
           sum += parseInt(s1.substr(i, 1)) * n++;
         for (i=0; i<s2.length-1; i++) {
           sum += parseInt(s2.substr(i, 1)) * n++;
           if (n == 10) n = 2;
         }
         
         c = 11 - sum % 11;
         if (c == 11) c = 1;
         if (c == 10) c = 0;
         if (c != parseInt(s2.substr(6, 1))) return false;
         else return true;

       document.f.submit()
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
<a href="./MemberLogin.me"><img src="./images/watchu_logo.png" alt="logo"></a>
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
			<input type="text" name="m_name" id="name" placeholder="이름 (김와츄)" class="text">
			</label><br>
			<label>
			<input type="text" name="m_id" id="id" placeholder="이메일 (example@gmail.com)" class="text">
			</label><br>
			<label>
			<input type="text" name="m_pass" id="pwd" placeholder="비밀번호 (6자 이상)" class="text">
			</label><br>
			<label>
			<input type="text" name="m_num1" placeholder="주민등록번호 앞자리"  class="text" onkeyup="fun2()" maxlength="6">
			</label><br>
			<label>
			<input type="text" name="m_num2" placeholder="주민등록번호 뒷자리" class="text" maxlength="1">
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