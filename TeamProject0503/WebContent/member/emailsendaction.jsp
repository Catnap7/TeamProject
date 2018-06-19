<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
  <link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<title>왓츄 : WATCHU</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/css/custom.css">


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
  		<p>인증 메일 전송</p>
  	</div>
  	
  	<article>
		    <div class="content">
		    	<img src="./images/watchu_logo2.png" id="logo">
		    	<div class="ment">
				  E-Mail 주소 인증 메일이 전송되었습니다. <br>
		 		   본인 확인을 위해 E-Mail 인증 후 로그인 진행해주세요.
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

  </body> 
</html>

