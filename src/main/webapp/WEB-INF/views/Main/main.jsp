<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="/resources/css/main/main.css">
</head>
<body>
	<header>
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
	</header>
	<div id="nav_menu">
		<nav></nav>
	</div>
	<div>
		<section id="left_slide">
		
		</section>
	</div>
	<div>
		<section id="main1">
		
		</section>
		<section id="main2">
		
		</section>
		<section id="main3">
		
		</section>
	</div>
</body>
</html>