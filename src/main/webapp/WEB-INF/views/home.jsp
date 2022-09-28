<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/lib/jquery.mousewheel.min.js"></script>
<script src="/resources/js/lib/jquery.fullpage.min.js"></script>
<script src="/resources/js/lib/swiper.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<link rel="stylesheet" href="/resources/css/lib/swiper.min.css">
<link rel="stylesheet" href="/resources/css/lib/jquery.fullpage.min.css">
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
 	<%-- <header>
		<div id="header_box">
			<h2>Main Page</h2>
			<ul id="header_menu">
				<li>
					<div id="header_list">
						<c:choose>
							<c:when test="${sessionScope.login==null}">
								<a href="/Account/Signup">회원가입</a>
								<a href="/login">로그인</a>
							</c:when>
							<c:when test="${sessionScope.login.id=='admin'}">
								<a href="/Memberlist">관리자메뉴</a>
								<a href="/logout">로그아웃</a>
							</c:when>
							<c:otherwise>
								<a href="/mypage/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a>
								<a href="/logout">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</div>
				</li>
				<li><a href="/service/servicemain">고객센터</a></li>
			</ul>
		</div>
	</header> --%>
	<div id="fullpage">
		<div class="section"> 
		1번째 section
		</div>
		<div class="swiper section slide">
			<div class="slide">123</div>
			<div class="slide">123</div>
			<div class="slide">123</div>
			<div class="slide">123</div>
		</div>
		<div class="section"> 
		3번째 section
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/vanilla.js"></script>
</body>
</html>
<!-- <div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide slide01"></div>
					<div class="swiper-slide slide02"></div>
					<div class="swiper-slide slide03"></div>
					<div class="swiper-slide slide04"></div>
				</div>
				Add Pagination
				<div class="swiper-pagination"></div> 
			</div>-->