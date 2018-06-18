<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 당신의 모든 영화, 세상의 모든 취향 </title>

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >

<style type="text/css">


*{
	margin: 0;
	padding:0;
	box-sizing: border-box;
	/* background-image: url("./images/vip_done.png");
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
	margin: 0 auto;
	position:absolute;
	background-image:none;
	top:30%; left:0%; bottom:0%; right:0%;
}
	.start #logo{
		width: 550px; height:100px;
		background-image: none;
		margin-bottom: 50px;
		margin: 0 auto;
	}
	
	.caption{
		width: 600px; height:100px;
		background-image:none;
		color: white;
		margin: 50px auto;
		font-weight:bold;
		font-size:1.5em;
	}
	
	.start #start_caption{
		background-image:none;
		margin-bottom: 20px;
	}
	
	.start #start_caption span{
		background-image: none;
		background-color: #e80068;
		color:white;
	}
	
	.start #start_caption2{
		background-image:none;
	}
	
	.start #start_caption2 span{
		color:#ff8800;
		background-color:#33485c;
		background-image: none;
	}
	
	.btn{
		display: inline-block;
		background-image:none;
		margin: 0 auto;
	}

	.btn a{
		display: inline-block;
	    border: 1px solid #ff8800;
	    border-radius: 20px;
	    width: 250px;
	    height: 60px;
	    background-color: #33485c;
	    text-decoration: none;
	    margin-top: 0px;
	    padding-left: 10px;
	    text-align: center;
	    padding-top: 13px;
	    letter-spacing: 10px; 
	}
	
	.btn a:LINK, .btn a:VISITED, .btn a:ACTIVE{
		color:white;
		/* font-weight:bold; */
		font-size: 1.4em;	
	}





#pic_caption{
	background-image:none;
	font-weight: bold;
	position: relative;
	right:0; bottom:0;
	
}


</style>
</head>
<body>


<video autoplay muted loop id="myVideo">
  <source src="./media/Star.mp4" type="video/mp4">
  Your browser does not support HTML5 video.
</video>

	<div class="start">
		<img src="./images/watchu_logo2_2.png" id="logo">
		<div class="caption">
			<p id="start_caption">당신의 모든 <span>영화</span>, 세상의 모든 <span>취향</span></p>
			<p id="start_caption2">국내 최대 영화 취향 분석 사이트, <span>WATCHU</span></p>
		</div>
		<div class="btn">
			<a href="./start.st">START</a>
		</div>
	</div>
	
	<!-- <p id="pic_caption">Photo by Denise Jans on Unsplash</p> -->
	
</body>
</html>