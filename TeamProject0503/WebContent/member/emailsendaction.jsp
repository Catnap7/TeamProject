<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <title>왓츄 : 이메일 인증메일 발송</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/css/custom.css">
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
		  이메일 주소 인증 메일이 전송되었습니다. 이메일에 들어가셔서 인증해주세요.
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
  </body>
</html>

