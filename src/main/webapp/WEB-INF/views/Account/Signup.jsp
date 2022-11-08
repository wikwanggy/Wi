<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/Account/Signup.css">
</head>
<body>
	<div id="signup">
		<div id="signup_box">
			<div id="signuparea">
				<form id="form" action="/Account/Signup" method="post">
					<div>
						<h1>회원 가입</h1>
					</div>
					<div class="div_box" id="id_box">
						<span>아이디<input type="text" name="id" id="id"></span>
					</div>
					<div class="div_box" id="pw_box">
						<span>비밀번호<input type="password" name="password"
							id="password"></span>
					</div>
					<div class="div_box" id="pwcheck_box">
						<span>비밀번호 확인<input type="password" name="pwcheck"
							id="pwcheck"></span>
					</div>
					<div class="div_box" id="name_box">
						<span>이름<input type="text" name="name" id="name"></span>
					</div>
					<div class="div_box" id="number_box">
						<span>전화번호<input tpye="text" name="number" id="number" class="phoneNumber"></span>
					</div>
					<div class="div_box"id="emailbox">
						<span>이메일<input type="text" name="email"id="email" class="input"></span>
					</div>
					<div>
						<input type="submit" value="가입하기" class="signup_btn">
					</div>
				</form>
				<div>
					<a href="/" style="text-decoration: none;"><input type="button" value="뒤로가기" class="signup_btn"
						id="back_btn"></a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/Account/signup.js"></script>
</body>
</html>