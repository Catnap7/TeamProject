<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄 : 당신의 모든 영화, 세상의 모든 취향 </title>
<style type="text/css">


*{
	margin: 0;
	padding:0;
	box-sizing: border-box;
/* 	background-image: url("./images/jakob-owens-199505-unsplash.jpg");
	background-repeat: none;
	background-size:cover; */
	font-family: 'Nanum Gothic', sans-serif;
}

.clear{clear: both;}


body{
	background-color: white;
}

#myVideo {
    position: fixed;
    right: 0;
    bottom: 0;
    min-width: 100%; 
    min-height: 100%;
}

.start{
	text-align:center;
	position:absolute;
	background-image:none;
	top:30%; left:0%; bottom:0%; right:0%;
}

	.start #logo{
		width: 610px; height:80px;
		background-image: none;
		margin-bottom: 50px;
	}
	
	.btn{
		display: block;
		background-image:none;
		
	}

	.btn a{
		display: inline-block;
	    border: 1px solid #333;
	    border-radius: 10px;
	    width: 150px;
	    height: 60px;
	    background-image: none;
	    text-decoration: none;
	    background-color: #ababab;
	    margin: auto auto;
	    margin-top: 50px;
	    padding-left: 5px;
	    padding-top: 16px;
	    letter-spacing: 3px;
	}
	
	.btn a:FIRST-CHILD{
		background-color:#ff8800;
	}

	.btn a:LINK, .btn a:VISITED, .btn a:ACTIVE{
		color:white;
		font-weight:bold; 
		font-size: 1.2em;	
	}

</style>
</head>
<body>

<video autoplay muted id="myVideo">
  <source src="./media/Turntable.mp4" type="video/mp4">
  Your browser does not support HTML5 video.
</video>

	<div class="start">
		<img src="./images/watchu_logo_22_2.png" id="logo">

		<div class="btn">
			<a href="./MemberLogin.me">로그인</a>
			<a href="./MemberJoin.me">회원가입</a>
		</div>
	</div>

</body>
</html>