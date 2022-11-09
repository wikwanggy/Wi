<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
				swal("문자발송",result,"success");
			},
		})
	});
})
</script>
<link rel="stylesheet" href="/resources/css/Account/findpw.css">
<title>Insert title here</title>
</head>
<body>
	<div class="findpw">
		<div id="box">
			<div id="title">
				<h1>비밀번호 찾기</h1>
			</div>
			<div id="content">
				<span>아이디 : <input type="text" name="id" id="id"> </span><br><br>
				<span>Email : <input type="text" name="email" id="email"></span><br><br>
				<button type="button" id="findBtn" class="btn">찾기</button>
				<button type="button" onclick="history.go(-1);" class="btn">뒤로가기</button>
			</div>
		</div>
	</div>
</body>
</html>