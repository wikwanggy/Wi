<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/Account/upload.js"></script>
</head>
<body>
	<div>
	
		<form action="/Account/newproject" method="post" id="form">

		제목<input type="text" name="name"> <br>
		내용<input type="text" name="content"> <br>
		Link<input type="text" name="link"> <br>
		<c:choose>
			<c:when test="${sessionScope.login==null}">
				</c:when>
					<c:when test="${sessionScope.login.id=='dnkrhkdrb'}">
					<input type="text" name="id" value="${sessionScope.login.id}">
					</c:when>
					<c:otherwise>
				</c:otherwise>
		</c:choose> 
		<input type="button" value="글쓰기" id="uploadBtn"><br>
		<div class="uploadDiv">
			<input type="file" name="uploadFile" multiple>
		</div>
		<br> <br>
		<div id="uploadResult">
			<ul>

			</ul>
		</div>
	</form>
	</div>
</body>
</html>