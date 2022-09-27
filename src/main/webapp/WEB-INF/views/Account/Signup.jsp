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
						<span>ID<input type="text" name="id" id="id"></span>
					</div>
					<div class="div_box" id="pw_box">
						<span>PW<input type="password" name="password"
							id="password"></span>
					</div>
					<div class="div_box" id="pwcheck_box">
						<span>PW Check<input type="password" name="pwcheck"
							id="pwcheck"></span>
					</div>
					<div class="div_box" id="name_box">
						<span>NAME<input type="text" name="name" id="name"></span>
					</div>
					<div class="div_box" id="number_box">
						<span>number<input tpye="text" name="number" id="number"></span>
					</div>
					<div class="div_box" id="job_box">
						<span>JOB<input tpye="text" name="job" id="job"></span>
					</div>
					<div >
						<input type="submit" value="가입하기" class="signup_btn">
					</div>
				</form>
				<div>
				<input type="submit" value="뒤로가기" class="signup_btn" formaction="/" id="back_btn">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/signup.js"></script>
</body>
</html>