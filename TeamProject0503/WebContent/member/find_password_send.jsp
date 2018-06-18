<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
<<<<<<< HEAD
    <title>왓츄 : 임시비밀번호 발급</title>
    
<style type="text/css">
    
    *{margin: 0px;padding: 0px;}
    article{
    	width:1900px; 
    	height:770px;
    }
    
    .box{
    	width: 1900px;
	    height: 80px;
	    background-color: #455a64;
	    color: white;
	    font-weight: bold;
	    line-height: 400%;
	    font-size: 1.2em;
	}
	.box p{margin-left: 50px;}
    .content{
    	position: relative;
		top: 100px;
		 /* left: 1000px; */
		border: 1px solid #d0d0d0;
		text-align: center;
		line-height: 3em;
		padding: 50px;
		margin: 20px;
		box-sizing:border-box;
    }
    #logo{
		width: 550px; height:100px;
		background-image: none;
		margin-bottom: 50px;
		margin: 0 auto;
	}
	
	div.ment{
		border: 1px solid #eee;
	    background-color: #daffdf;
	    margin: 30px;
	    padding: 30px;
	    font-size: 1.1em;
	    color: #333;}
		
	div.btn{
		border:2px solid #eee;
		border-radius:10px;
		background-color: #eee;
		position: relative;
		top:0px;left:730px;
		width: 300px;}
	div.btn a{
		text-decoration: none;
		color:#333;
		font-weight: bold;
		}
	div.btn:HOVER{
		border:2px solid #ddd;}
			
	div.sns {
		width: 260px;
	    float: right;
	    position: relative;
	    bottom: -100px;
	    right: 800px;
	    padding: 5px;
	}
	div.sns img {
		border: 1px solid white;
		border-radius: 30px;
		margin-right: 20px;
	}

	div.sns img:HOVER{
		border: 1px solid #ff8800;
		opacity:0.8;
	}
    
</style>
    
</head>
<body> 
  	<div class="box">
  		<p>임시비밀번호 발급</p>
  	</div>
  	
  	<article>
		    <div class="content">
		    	<img src="./images/watchu_logo2.png" id="logo">
		    	<div class="ment">
				  가입하신 E-Mail 계정으로 임시비밀번호가 발급되었습니다.<br>
				    메일을 확인 하신 후 임시비밀번호로 로그인 해주세요.<br>
				</div>
				<div class="btn"><a href="./MemberLogin.me">로그인 페이지로 가기</a></div>
		    </div>	
		    <div class="clear"></div>
		    <div class="sns">
					<a href="https://ko-kr.facebook.com" target="_blank">
					<img alt="fb" src="./images/sns_fb.png" width="60px" height="60px"></a>
					<a href="https://www.instagram.com" target="_blank">
					<img alt="insta" src="./images/sns_insta.png" width="60px" height="60px"></a>
					<a href="https://twitter.com" target="_blank">
					<img alt="twitter" src="./images/sns_twi.png" width="60px" height="60px"></a>
			</div>    
    </article>
    
    <div class="box"></div>
    
    <div class="clear"></div>

=======
    <title>왓츄 : 임시비밀번호 발송</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/css/custom.css">
    <link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="./intro.st"> 웹 사이트</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="./intro.st">메인</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
              회원 관리
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdown">
              <a class="dropdown-item" href="./MemberLogin.me">로그인</a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
	<div class="container">
	    <div class="alert alert-success mt-4" role="alert">
		  가입하신 E-Mail 계정으로 임시비밀번호가 발송되었습니다. <br>
		    메일을 확인하신후, 로그인을 진행해주세요.<br>
		</div>
    </div>
    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
      Copyright ⓒ 2018 WatChu All Rights Reserved.
    </footer>
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="./js/jquery.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
>>>>>>> refs/remotes/origin/master
  </body>
</html>

