<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/Account/login.js"></script>
<script type="text/javascript" src="/resources/js/lib/TweenMax.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/Account/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<title>Home</title>
<meta charset="UTF-8">
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.login==null}">
			<div id="home_box">
				<form action="/Account/loginpost" method="post" id="login" class="animate__animatedanimate__zoomInDown">
					<div id="loginbox">
						<div id="loginarea">
							<h1>로그인</h1>
							<div style="margin-top: 30px;">
								<input type="text" name="id" placeholder="아이디" id="id" class="input">
							</div>
							<div style="margin-top: 30px;">
								<input type="password" name="password" placeholder="비밀번호" id="password" class="input">
							</div>
							<input type="submit" value="로그인" id="loginbtn">
							<div class="loginmenu">
								<a href="/Account/searchId" class="search" id="search_img">ID</a>
								<a href="/Account/findPw" class="search" id="search_icon">PW찾기</a>
								<a href="/Account/Signup" class="sign_a" id="sign_img">회원가입</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${sessionScope.login.id=='admin'}">
		<form action="/loginpost" method="post" id="login">
			<div id="loginbox">
				<div id="adminarea">
					<a href="#">관리자${sessionScope.login.id}님.</a><br> <a
						href="/logout">로그아웃</a>
				</div>
			</div>
			</form>
		</c:when>
		<c:otherwise>
				<div class="loginmenu">
					<a href="/logout" class="sign_a"><button>로그아웃</button></a>
				</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
