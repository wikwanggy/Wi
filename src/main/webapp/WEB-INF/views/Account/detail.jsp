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
<script type="text/javascript" src="/resources/js/Account/reply.js"></script>
<script type="text/javascript" src="/resources/js/Account/attach.js"></script>
<link rel="stylesheet" href="/resources/css/Account/detail.css">
</head>
<body>
	<header id="side_bar" style="left: -270px;">
		<div >
			<button type="button" id="side_btn">
				<span>OPEN</span>
			</button>
			<div id="inner_header">
				<div id="photo">
					<a href="/"><img src="/resources/css/img/photo.png" alt="photo"></a>
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
							<a href="/Account/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a><br><br>
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
	<section style="margin-top: 20px;">
		<div>
			<h2 style="font-size: 40px;">게시물 상세 보기</h2>
		</div>
		<div id="detailbox">
			<form method="post">
				<table id="table">
					<tr style="height: 40px;">
						<th style="width: 80px;">번호</th>
						<td><input value="${detail.bno}" type="text" readonly name="bno" id="input_bno"></td>
						<th>조회수</th>
						<td>${detail.cnt}</td>
					</tr>
					<tr style="height: 40px;">
						<th>이름</th>
						<td>${detail.name}</td>
						<th>ID</th>
						<td>${detail.id}</td>
					</tr>
					<tr >
						<th>내용</th>
						<td colspan="3"><textarea name="content"style="background-color: transparent; height: 98%; width: 99%;border: none; resize: none; font-size: 20px; font-family: 'establishRoomNo703OTF';">${detail.content}</textarea></td>
					</tr>
					<tr >
						<th>첨부파일</th>
						<td colspan="3"><div id="uploadResult"><ul></ul></div></td>
					</tr>
					<tr style="height: 40px;">
						<th>작성일자</th>
						<td>${detail.regdate}</td>
						<th>링크</th>
						<td><a href="${detail.link}" id="link">${detail.link}</a></td>
						
					</tr>
				</table>
					<c:choose>
						<c:when test="${sessionScope.login==null}">
						</c:when>
						<c:when test="${sessionScope.login.id=='dnkrhkdrb'}">
							<input type="submit" value="글수정" formaction="/Account/modify" class="submit">
							<input type="submit" value="글삭제" formaction="/Account/remove" class="submit">
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
			</form>
			<div id="replybox">

				<table id="detail_reply">
					<tr class="trtd">
						<td class="trtd"><c:choose>
								<c:when test="${sessionScope.login!=null}">
									<div class="detail_input">
										<div>
											<label>댓글 <c:if test="${detail.count!=0}">
								${detail.count}개
							</c:if>
											</label> <input type="hidden" name="sessionid"
												value="${sessionScope.login.id}">
										</div>
										<div class="text_box">
											<textarea  cols="115" rows="7" style="font-family: 'establishRoomNo703OTF';" placeholder="댓글 입력" id="reply"></textarea>
											<div class="count"><span>0</span>/300</div>
										</div>
										<div id="reply_wrt">
											<input type="button" class="btn_board" id="replywrt"
												value="COMMENT 남기기">
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="detail_input">
										<div>
											<label>COMMENT<c:if test="${detail.count!=0}">
								${detail.count}개
							</c:if>
											</label> <input type="hidden" name="sessionid" value="guest">
										</div>
										<div class="text_box">
											<textarea  cols="115" rows="7" style="font-family: 'establishRoomNo703OTF';" placeholder="댓글 입력" id="reply"></textarea>
											<div class="count"><span>0</span>/300</div>
										</div>
										<div id="reply_wrt">
											<input type="button" class="btn_board" id="replywrt"
												value="COMMENT남기기">
										</div>
									</div>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr class="trtd">
						<td class="trtd">
							<div id="chat">
								<ul id="replyUL" class="detail_input">

								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</body>
</html>