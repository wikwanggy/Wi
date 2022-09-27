<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#findBtn").click(function(){
		$.ajax({
			url : "/Account/findPw",
			type : "POST",
			data : {
				id : $("#id").val(),
				email : $("#email").val()
			},
			success : function(result) {
				alert(result);
			},
		})
	});
})
</script>
<!-- <link rel="stylesheet" href="/resources/css/login/findpw.css"> -->
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<div>
				<h1>비밀번호 찾기</h1>
			</div>
			<div>
				아이디<input type="text" name="id" id="id">
				Email<input type="text" name="email" id="email">
				<button type="button" id="findBtn">찾기</button>
				<button type="button" onclick="history.go(-1);">뒤로가기</button>
			</div>
		</div>
	</div>
</body>
</html>