<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/sidebar.js"></script>
<link rel="stylesheet" href="/resources/css/Account/projectlist.css">
</head>
<body>
	<header id="side_bar" style="left: -270px;">
		<div >
			<button type="button" id="side_btn">
				<span>OPEN</span>
			</button>
			<div id="inner_header">
				<div id="photo">
					<a href="#"><img src="/resources/css/img/photo.png" alt="photo"></a>
				</div>
				<br>
				<div id="login_menu">
					<c:choose>
						<c:when test="${sessionScope.login==null}">
							<a href="/Account/login">로그인</a><br><br>
							<a href="/Account/Signup">회원가입</a>
						</c:when>
						<c:when test="${sessionScope.login.id=='dnkrhkdrb'}">
							
							<a href="/Account/logout">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a href="/mypage/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a><br><br>
							<a href="/Account/logout">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<span id="navi_bar1"></span>
			<ul id="tab1">
				<li><a href="https://open.kakao.com/o/sJxzFBEe" id="kakao"> KakaoTalk</a></li>
				<li><a href="https://github.com/wikwanggy" id="git"> GitHub</a></li>
				<li><a href="https://blog.naver.com/hyye0913" id="blog"> Blog</a></li>
				<li><a href="https://www.instagram.com/calix_98/" id="insta"> Instargram</a></li>
			</ul>
			
		</div>
	</header>
	<div id="head_h2">
		<h2 style="font-size: 60px;">ProJect List</h2>
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
							<td class="bno list">${list.rownum}</td>
							<td class="name list">${list.name}</td>
							<td class="id list">${list.id}</td>
							<td class="content list"><a href="/Account/detail?bno=${list.bno}" id="content_a">${list.content}</a></td>
							<td class="date list">${list.regdate}</td>
							<td class="cnt list">${list.cnt}</td>
							
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
				<c:choose>
						<c:when test="${sessionScope.login==null}">
							
						</c:when>
						<c:when test="${sessionScope.login.id=='dnkrhkdrb'}">
							<input type="submit" value="글쓰기" formaction="/Account/newproject" method="get">
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
		</form>
	</div>
</body>
</html>