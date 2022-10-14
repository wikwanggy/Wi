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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/sidebar.js"></script>
<link rel="stylesheet" href="/resources/css/Account/detail.css">
</head>
<body>
	<header id="side_bar" style="left: -270px;">
		<div >
			<button type="button" id="side_btn">
				<span>OPEN</span>
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
							<input type="button" value="글삭제" formaction="/Account/remove"><br><br>
							<input type="button" value="글수정" formaction="/Account/remove">
							<br><br>
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
			<ul id="menu">
				<li data-menuanchor="sec1" class="active"><a href="#sec1"></a></li>
				<li data-menuanchor="sec2"><a href="#sec2"></a></li>
				<li data-menuanchor="sec3"><a href="#sec3"></a></li>
				<li data-menuanchor="sec4"><a href="#sec4"></a></li>
				<li data-menuanchor="sec5"><a href="#sec5"></a></li>
				<li data-menuanchor="sec6"><a href="#sec6"></a></li>
			</ul>
		</div>
	</header>
	<section>
		<div>
			<h2>게시물 상세 보기</h2>
		</div>
		<div id="detailbox">
			<form>
				<table>
					<tr style="height: 40px;">
						<th style="width: 80px;">번호</th>
						<td>${detail.bno}</td>
						<th>조회수</th>
						<td>${detail.cnt}</td>
					</tr>
					<tr style="height: 40px;">
						<th>이름</th>
						<td>${detail.name}</td>
						<th>ID</th>
						<td>${detail.id}</td>
					</tr>
					<tr >
						<th>내용</th>
						<td colspan="3">${detail.content}</td>
					</tr>
					<tr style="height: 40px;">
						<th>작성일자</th>
						<td colspan="3">${detail.regdate}</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>
</html>