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
	<div id="mypage_box">
		<div id="mypage_sb">
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
		</div>
	<div class="stage">
    <div class="scene">
        <div class="halo">
            <i></i>
            <span class="halo-star"></span>
            <span class="halo-star"></span>
            <span class="halo-star"></span>
            <i></i>
            <i></i>
            <i></i>
        </div>
        <div class="lantern">
            <div class="lantern-handle"></div>
            <div class="lantern-inner">
                <div class="lantern-chain"></div>
                <div class="lantern-head"></div>
                <div class="lantern-body">
                    <div class="lantern-spark"></div>
                    <div class="lantern-spark"></div>
                    <div class="lantern-spark"></div>
                    <div class="lantern-flame"></div>
                </div>
                <div class="lantern-base"></div>
            </div>
        </div>
        <div class="planets">
            <div class="planet"></div>
            <div class="planet"></div>
            <div class="planet"></div>
            <div class="planet"></div>
            <div class="planet"></div>
            <div class="planet"></div>
        </div>
</div>
</div>
</body>
</html>