<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/Account/mypage.css">
</head>
<body>
	<div id="mypage_box">
		<div id="mypage_sb">
			<form>
				<h2>My Page</h2>
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
				<br>
				<br>
				<div>
					<a href="/Account/leave?id=${sessionScope.login.id}">
					<input type="button" value="회원탈퇴" class="btn"></a> 
					<a href="/Account/mmdetail?id=${sessionScope.login.id}">
					<input type="button" value="회원정보수정" class="btn"></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>