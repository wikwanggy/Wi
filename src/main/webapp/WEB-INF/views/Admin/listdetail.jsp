<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/Admin/listdetail.css">

</head>
<body>
	<div id="main">
			<form>
				<h2>회원 정보 상세 보기</h2>
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" value="${mypage.name}" name="name"
							readonly></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" value="${mypage.id}" name="id"
							readonly></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" value="${mypage.email}" name="email"
							readonly></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" value="${mypage.number}" name="number"
							readonly></td>
					</tr>
				</table>
				<br> <br>
				<div>
					<a href="/Admin/mleave?id=${mypage.id}"><input type="button"
						value="회원삭제" class="btn" id="delete"></a>
				</div>
			</form>
		</div>
</body>
</html>