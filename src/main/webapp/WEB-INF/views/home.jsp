<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
<link rel="stylesheet" href="/resources/css/home.css">
<title>Home</title>
<meta charset="UTF-8">
</head>
<body>
	<div id="video_box">
	<video src="/resources/css/video/main.mp4" muted autoplay loop> </video>

	</div>
	<c:choose>
		<c:when test="${sessionScope.login==null}">
			<div id="home_box">
				<form action="/loginpost" method="post" id="login">
					<div id="loginbox">
						<div id="loginarea">
							<h1>로그인</h1>
							<div>
								<input type="text" name="id" placeholder="아이디" id="id" class="input">
							</div>
							<div>
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
