<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/Account/projectlist.css">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	
	<div id="head_h2">
		<h2>ProJect List</h2>
	</div>
	<div id="listbox">
		<form>
			<div id="table_div">	
				<table>
					<tr>
						<th class="bno">번호</th>
						<th class="name">name</th>
						<th class="id">id</th>
						<th class="content">내용</th>
						<th class="date">작성일자</th>
						<th class="cnt">조회수</th>
					</tr>
						<c:forEach items="${list}" var="list">
						<tr>
							<td class="bno">${list.bno}</td>
							<td class="name">${list.name}</td>
							<td class="id">${list.id}</td>
							<td class="content"><a href="/Account/detail?bno=${list.bno}" id="content_a">${list.content}</a></td>
							<td class="date">${list.regdate}</td>
							<td class="cnt">${list.cnt}</td>
							
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="pagenum_box">
					<!-- prev=true면 이전버튼 활성화 -->
			<c:if test="${paging.prev}">
				<a href="/Account/projectlist?type=${paging.pcd.type}&keyword=${paging.pcd.keyword}&pageNum=${paging.endPage-1}&amount=${paging.pcd.amount}" class="page_num">이전</a>
			</c:if>
		
			<!-- begin이 end될동안 반복 10 -->
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="num">
				<a href="/Account/projectlist?type=${paging.pcd.type}&keyword=${paging.pcd.keyword}&pageNum=${num}&amount=${paging.pcd.amount}" class="page_num">${num}</a>
			</c:forEach>
		
			<!-- next=true면 다음버튼 활성화 -->
			<c:if test="${paging.next}">
				<a
					href="/Account/projectlist?type=${paging.pcd.type}&keyword=${paging.pcd.keyword}&pageNum=${paging.endPage+1}&amount=${paging.pcd.amount}" class="page_num">다음</a>
			</c:if>
			</div>
			<a href="/"><button type="button">홈으로</button></a>
				
		</form>
	</div>
</body>
</html>