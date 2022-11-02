<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/Account/detail.js"></script>
<link rel="stylesheet" href="/resources/css/Account/mmdetail.css">
</head>
<body>
	<div id="mypage_box">
		<div id="mypage_sb">
			<form action="/Account/mmodify" method="post">
				<h1>회원정보수정</h1>
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" value="${mmdetail.name}" name="name" id="name" readonly></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" value="${mmdetail.id}" name="id" id="id"
							readonly></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" value="${mmdetail.password}"
							name="password" id="pw1"> <input
							type="button" value="비밀번호확인" id="showPassword" class="btn">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" value="${mmdetail.email}" name="email" id="email" readonly></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" value="${mmdetail.number}" id="number"
							name="number" readonly></td>
					</tr>
				</table>
				<br>
				<div>
					<a href="/"><input type="button" value="홈으로" class="btn"></a>
					<input type="submit" value="회원정보 수정" id="modi" class="btn">
				</div>
			</form>
		</div>
	</div>
</body>
</html>