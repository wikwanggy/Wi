<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/Account/mmdetail.js"></script>
<link rel="stylesheet" href="/resources/css/Account/mmdetail.css">
</head>
<body>
	<div id="mypage_box">
		<div id="mypage_sb">
			<form action="/Account/mmodify" method="post">
				<h1>회원정보수정</h1>
				<div>
				<span>이름 <input type="text" value="${mmdetail.name}"name="name" id="name" readonly class="input"> </span>
				</div>
				<div>
				<span>아이디 <input type="text" value="${mmdetail.id}" name="id" id="id" readonly class="input"> </span>
				</div>
				<div id="pw_box">
				<span>비밀번호 <input type="password" value="${mmdetail.password}" name="password" id="password" class="input"><br> </span>
				<input type="button" value="비밀번호확인" id="showPassword" class="btn"> 
				</div>
				<div>
				<span>이메일 <input type="text" value="${mmdetail.email}" name="email" id="email" readonly class="input"> </span>
				</div>
				<div>
				<span>전화번호 <input type="text" value="${mmdetail.number}" id="number" name="number" readonly class="input"></span>
				</div>
				<div>
					<a href="/"><input type="button" value="홈으로" class="btn input"></a>
					<input type="submit" value="회원정보 수정" id="modi" class="btn input">
				</div>
			</form>
		</div>
	</div>
</body>
</html>