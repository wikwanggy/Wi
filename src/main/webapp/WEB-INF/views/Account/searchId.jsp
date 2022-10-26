<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/Account/findId.js"></script>
<link rel="stylesheet" href="/resources/css/Account/findid.css">
</head>
<body>
	<div class="findid">
		<div id="box">
			<h1>ID 찾기</h1>
			<form action="/Account/findId" method="get" id="findId">
				<table>
					<tr>
						<th>이름</th>
					</tr>
					<tr>
						<td><input type="text" id="name" name="name"></td>
					</tr>
					<tr>
						<th>Email</th>
					</tr>
					<tr>
						<td><input type="text" id="email" name="email"></td>
					</tr>
				</table>
				<br> <br>
				<div>
					<input type="submit" value="ID찾기" class="btn">
					<a href="/"><input type="button" value="홈으로" class="btn"></a>
				</div>
			</form>
		</div>
	</div>

</body>