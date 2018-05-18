<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PUZZLIT</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../script/postcode.js"></script>
<script type="text/javascript">
var han_pattern =/.*[(ㄱ-ㅎ)ㅏ-ㅣ(가-힣)]+.*/; 

function fun() {
	

	/* 	if(pattern.test(document.getElementById('id').value)==true){
		alert("아이디는 영문, 숫자로만 입력하세요");
		document.getElementById('id').value='';
		document.getElementById('id').focus();
		return false;
	}
	 */
	
	if (document.fr.resultCH.value==-1) {
		alert("아이디 중복체크하세요.")
		document.fr.resultCH.focus()
		return false;	}
	if (document.fr.resultCH.value==0) {
		alert("중복되지 않은 아이디를 사용하세요")
		document.fr.resultCH.focus()
		return false;	}
	if (document.fr.id.value.length==0) {
		alert("아이디를 입력하세요")
		document.fr.id.focus()
		return false;	}
/* 	if (document.fr.h.value==0) {
		alert("ID를 중복확인을 하세요");
		document.fr.doublecheck.focus();
		return false;	} */
/* 	if (document.fr.pass1.value.length<4||document.fr.pass1.value.length>7) {
		alert("비밀번호를 4~10자로 입력하세요")
		document.fr.pass1.focus()
		return false;	} */
	if (document.fr.pass.value.length==0) {
		alert("비밀번호를 입력하세요")
		document.fr.pass.focus()
		return false;	}
	if (document.fr.pass2.value.length==0) {
		alert("비밀번호 확인을 입력하세요")
		document.fr.pass2.focus()
		return false;	}
	if (document.fr.pass.value!=document.fr.pass2.value) {
		alert("비밀번호가 일치하지않습니다. 다시 확인해주세요")
		document.fr.pass2.focus()
		return false;	}
	if (document.fr.name.value.length==0) {
		alert("이름을 입력하세요")
		document.fr.name.focus()
		return false;	}
	if (document.fr.email.value.length==0) {
		alert("이메일을 입력하세요")
		document.fr.email.focus()
		return false;	}
	if (document.fr.email2.value.length==0) {
		alert("이메일 확인을 입력하세요")
		document.fr.email2.focus()
		return false;	}
	if (document.fr.email.value!=document.fr.email2.value) {
		alert("이메일 주소가 일치하지않습니다. 다시 확인해주세요")
		document.fr.email2.focus()
		return false;	}

	
}
/* 
function fn_press_han(obj)
{
	//이방법으로는 2자까지 한글입력이 가능하다.
    //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}

 */
 function chk_hangul(event){ 
	 var key = window.event ? event.keyCode : event.which; 

	 if ((key >= 32) && (key <= 126)){ 
	 alert("한글만 입력이 가능합니다"); 
	 //document.getElementById("username").value = ""; 
	 return false; 
	 } 
} 
 
 
</script>

<script src="../script/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//string2.jsp에
	//파라미터값 넘겨서data:{name:"홍길동", age:21}
	//결과 받아서 body 태그 뒷부분에 추가
	
	$('#idch').click(function(){
	 	if (document.fr.id.value.length==0) {
			alert("아이디를 입력하세요")
			document.fr.id.focus();
			return;
	 	} 
		
// 		만약, 체크값이 -1 인증안한거, 
// 		0 중복된 아이디
// 		1 통과;
		
		$.ajax('idcheck2.jsp',{
			data:{id: $("input[name=id]").val()},
			success:function(appe){	
//				$('#idch').after(appe);
				if(appe==1){
					$('#resultCH').val("1");
					$('#resultDIV').html("<span>선택한 아이디는 사용가능합니다.</span>");
				}else if(appe==0){
					$('#resultCH').val("0");
					$('#resultDIV').html("<span>중복된 아이디입니다</span>");
				}
				
			}
		}); 
	});
});
</script>



</head>
<body>

<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<!-- <li><a href="#">Privacy policy</a></li> -->
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" method="post" name="fr" onsubmit="return fun()">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" onkeyup="this.value=String(this.value).replace(han_pattern,'');"  onblur="this.onkeyup();"> <!--  onkeydown="return chk_hangul(event)" style="ime-mode:disabled;"  -->
<input type="hidden" id="resultCH" value="-1">
<input type="button" value="dup. check" class="dup" id="idch" onclick="idcheck()"><br>
<div id="resultDIV"></div>
<label>Password</label>
<input type="password" name="pass" onkeyup="this.value=String(this.value).replace(han_pattern,'');"  onblur="this.onkeyup();"><br>
<label>Retype Password</label>
<input type="password" name="pass2" onkeyup="this.value=String(this.value).replace(han_pattern,'');"  onblur="this.onkeyup();"><br>
<label>Name</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email" onkeyup="this.value=String(this.value).replace(han_pattern,'');"  onblur="this.onkeyup();"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2" onkeyup="this.value=String(this.value).replace(han_pattern,'');"  onblur="this.onkeyup();" ><br>
</fieldset>


<fieldset>
<legend>Optional</legend>
<!-- <label>Address</label>
<input type="text" name="address"><br> -->
<label>Phone Number</label>
<input type="text" name="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile"><br>

<!-- 우편번호 api -->
<label>Postcode</label>
<input type="text" id="postcode" placeholder="우편번호" name="postcode">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<label>Address</label>
<input type="text" id="address" placeholder="주소" name="address">
<input type="text" id="address2" placeholder="상세주소" name="address2">

<!-- 우편번호 api -->




</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit" name="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>