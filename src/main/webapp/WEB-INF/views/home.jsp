<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.0.6/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.0.6/swiper-bundle.css" />
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
	<header>
	<div id="side_bar" style="left: -270px;">
		<button type="button" id="side_btn">
			<span>OPEN</span>
		</button>
		<div id="inner_header">
			<div id="photo">
				<a href="#"><img src="/resources/css/img/photo.png" alt="photo"></a>
			</div><br>
			<div id="login_menu">
			<c:choose>
				<c:when test="${sessionScope.login==null}">
					<a href="/Account/login">로그인</a>
					<a href="/Account/Signup">회원가입</a>
				</c:when>
				<c:when test="${sessionScope.login.id=='admin'}">
					<a href="/Memberlist">관리자메뉴</a>
					<a href="/Account/logout">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="/mypage/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a>
					<a href="/Account/logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<span id="navi_bar1"></span>
		<ul id="tab">
			<li><a href="#">tab1</a></li>
			<li><a href="#">tab2</a></li>
			<li><a href="#">tab3</a></li>
			<li><a href="#">tab4</a></li>
		</ul>
		<span id="navi_bar2"></span>
		<ul id="tab1">
			<li><a href="#">KakaoTalk</a></li>
			<li><a href="#">GitHub</a></li>
			<li><a href="#">Naver</a></li>
			<li><a href="#">Instargram</a></li>
		</ul>
		<ul id="menu">
			<li data-menuanchor="sec1" class="active"><a href="#sec1"></a></li>
			<li data-menuanchor="sec2"><a href="#sec2"></a></li>
			<li data-menuanchor="sec3"><a href="#sec3"></a></li>
		</ul>
		</div>
	</header>
	<div id="fullpage">
		<div class="section sec1 active">
			<div class="p_left innerbox">
				<h2>Section 1-왼쪽</h2>
			</div>
			<div class="p_right innerbox">
				<h2>Section 1-오른쪽</h2>
			</div>
		</div>
		<div class="section sec2">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide " id="sec1-1">
						<div class="p_left innerbox box_img1">
							<h2>Section 2-1왼쪽</h2>
						</div>
						<div class="p_right innerbox ">
							<h2>Section 2-1오른쪽</h2>
						</div>
					</div>
					<div class="swiper-slide  " id="sec1-2">
						<div class="p_left innerbox box_img2">
							<h2>Section 2-1왼쪽</h2>
						</div>
						<div class="p_right innerbox">
							<h2>Section 2-2오른쪽</h2>
						</div>
					</div>
					<div class="swiper-slide " id="sec1-3">
						<div class="p_left innerbox box_img3">
							<h2>Section 3-1왼쪽</h2>
						</div>
						<div class="p_right innerbox">
							<h2>Section 3-2오른쪽</h2>
						</div>
					</div>
					<div class="swiper-slide " id="sec1-4">
						<div class="p_left innerbox box_img4">
							<h2>Section 4-1왼쪽</h2>
						</div>
						<div class="p_right innerbox">
							<h2>Section 4-2오른쪽</h2>
						</div>
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</div>
		</div>
		<div class="section sec3">
			<div class="p_left innerbox">
				<h2>Section 5-1왼쪽</h2>
			</div>
			<div class="p_right innerbox">
				<h2>Section 5-2오른쪽</h2>
			</div>
		</div>
	</div>
</body>
</html>