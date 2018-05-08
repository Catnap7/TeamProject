<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄:결제</title>

<script type="text/javascript">


</script>

</head>
<body>

	<form name="form">
	
		이용권 종류 선택 
		<select name="pay" >
			 <option value="">한달만결제</option> 
			 <option value="1">매달 자동결제</option>
		</select><br>

<br><br>
	
		쿠폰
		<select name="couponBox" >
			 <option value="">가지고 계신 쿠폰을 선택하세요</option> 
			 <option value="1">쿠폰없음</option>
			 <option value="0.5">50%할인</option>
			 <option value="0">한달 무료</option>
		</select><br>

총 결제 금액:<p></p>
<input type="submit" value="결제하기">
	</form><br>
	

 


</body>
</html>