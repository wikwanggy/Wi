<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/sidebar.js"></script>
<script type="text/javascript" src="/resources/js/Account/upload.js"></script>
<link rel="stylesheet" href="/resources/css/Account/newproject.css">
</head>
<body>
	<header id="side_bar" style="left: -270px;">
		<div >
			<button type="button" id="side_btn">
				<span>OPEN</span>
			</button>
			<div id="inner_header">
				<div id="photo">
					<a href="/"><img src="/resources/css/img/photo.png" alt="photo"></a>
				</div>
				<br>
				<div id="login_menu">
					<c:choose>
						<c:when test="${sessionScope.login==null}">
							<a href="/Account/login">로그인</a><br><br>
							<a href="/Account/Signup">회원가입</a>
						</c:when>
						<c:when test="${sessionScope.login.id=='dnkrhkdrb'}">
							<a href="/Account/logout">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a href="/Account/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a><br><br>
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
	<div>
		<h2>새로운 프로젝트 리스트 만들기</h2>
		<form action="/Account/newproject" method="post" id="form">
		<table>
		<tr id="name">	
			<th >제목</th>
			<td style="width: 850px; height: 50px; "><input type="text" name="name"></td>
		</tr>
		<tr id="content">
		<th>내용</th>
		<td><input type="text" name="content" placeholder="300자만 입력가능합니다." maxlength="300"></td>
		</tr>
		<tr id="link">
		<th>Link</th>
		<td><input type="text" name="link">
		</td>
		</tr> 
		</table>
		<c:choose>
			<c:when test="${sessionScope.login==null}">
				</c:when>
					<c:when test="${sessionScope.login.id=='dnkrhkdrb'}">
					<input type="hidden" name="id" value="${sessionScope.login.id}">
					</c:when>
					<c:otherwise>
				</c:otherwise>
		</c:choose>
		<div class="uploadDiv">
			<input type="file" value="파일 전송" name="uploadFile" multiple>
		</div>
		<br>
		<input type="button" value="글쓰기" id="uploadBtn">
		<div id="uploadResult">
			<ul>

			</ul>
		</div>
	</form>
	</div>
</body>
</html>