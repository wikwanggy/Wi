<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/sidebar.js"></script>
<link rel="stylesheet" media="screen and (min-width:1024px)"
	href="/resources/css/main.css">
<link rel="stylesheet"
	media="screen and (min-width:768px) and(max-width:1024px)"
	href="/resources/css/main.css">
<link rel="stylesheet" media="screen and(max-width:768px)"
	href="/resources/css/main.css">
<title>Insert title here</title>
</head>
<body>
	<header id="side_bar" style="left: -270px;">
		<div >
			<button type="button" id="side_btn">
				<span>OPEN</span><!--  -->
			</button>
			<div id="inner_header">
				<div id="photo">
					<a href="#"><img src="/resources/css/img/photo.png" alt="photo"></a>
				</div>
				<br>
				<div id="login_menu">
					<c:choose>
						<c:when test="${sessionScope.login==null}">
							<a href="/Account/login">로그인</a><br><br>
							<a href="/Account/Signup">회원가입</a>
						</c:when>
						<c:when test="${sessionScope.login.id=='dnkrhkdrb'}">
							<a href="/Admin/Admin">페이지 수정</a><br><br>
							<a href="/Account/logout">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a href="/mypage/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a><br><br>
							<a href="/Account/logout">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<span id="navi_bar1"></span>
			<ul id="tab1">
				<li><a href="https://open.kakao.com/o/sJxzFBEe" id="kakao"> KakaoTalk</a></li>
				<li><a href="https://github.com/wikwanggy" id="git"> GitHub</a></li>
				<li><a href="https://blog.naver.com/hyye0913" id="blog"> Blog</a></li>
				<li><a href="https://www.instagram.com/calix_98/" id="insta"> Instargram</a></li>
			</ul>
		</div>
	</header>
</body>
</html>