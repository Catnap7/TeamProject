<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 프로필 수정</title>

<!-- css -->
<link href="./css/profile.css" rel="stylesheet" type="text/css">

<!-- jquery -->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>

<script type="text/javascript">

$(window).on("beforeunload",function (){
	/* $.ajax({
		type: 'POST',
		url: './CheckAlarm.my'																	 					 		
	});//end ajax 	 */	
	opener.location.reload();
});
function closeP(){
	window.close();
}
function updateP($num){
	$.ajax({
	type: 'POST',
	url: './UpdateProfileAction.my',
	data: {
		"profile_num" : $num
	}
});//end ajax 		
}
</script>
</head>
<body>
<h2>프로필 사진을 선택해주세요</h2>
<%for(int i=0;i<10;i++){ %>
<input type="radio" id="pro<%=i+1%>" name="ra" class="rdo">
<label for="pro<%=i+1%>"><img src="./images/proflie_img/proflie<%=i+1%>.png" width=150px; onclick="updateP(<%=i+1%>)">
</label>
<%} %>
<br>
<input type="button" value="선택" onclick="closeP()" class="btn">
<br>
<br>
</body>
</html>