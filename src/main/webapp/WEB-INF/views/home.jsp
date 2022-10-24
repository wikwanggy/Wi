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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.0.6/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.0.6/swiper-bundle.css" />
<link rel="stylesheet" media="screen and (min-width:1024px)"
	href="/resources/css/main.css">
<link rel="stylesheet"
	media="screen and (min-width:768px) and(max-width:1024px)"
	href="/resources/css/main.css">
<link rel="stylesheet" media="screen and(max-width:768px)"
	href="/resources/css/main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
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
			<ul id="menu">
				<li data-menuanchor="sec1" class="active"><a href="#sec1"></a></li>
				<li data-menuanchor="sec2"><a href="#sec2"></a></li>
				<li data-menuanchor="sec3"><a href="#sec3"></a></li>
				<li data-menuanchor="sec4"><a href="#sec4"></a></li>
				<li data-menuanchor="sec5"><a href="#sec5"></a></li>
				<li data-menuanchor="sec6"><a href="#sec6"></a></li>
			</ul>
		</div>
	</header>
	<div id="fullpage">
		<div class="section sec1 active sec_color1">
			<div class="contents">
				<div id="sec1_tb" class="animate__animated animate__bounce">
				<h2 id="head_text1 "><span>안</span>녕하세요</h2>
			<span id="text">
			풀스택 개발자를 꿈 꾸는
			<br><span id="text_name">위광규</span> 입니다.</span>
			</div>
			</div>
			<div id="Scroll">
				<a href="#">
				<span></span><span></span><span></span></a>
			</div>
		</div>
		<div class="section sec2 sec_color2">
			<div class="swiper-container">
				<div class="swiper-wrapper contents">
					<div class="swiper-slide " id="sec2-1">
						<div class="p_left innerbox">
							<div id="sec2_pb" class="animate__animated animate__headShake">
								
							</div>
						</div>
						<div class="p_right innerbox ">
							<div class="right_box">
								<div class="text_box" id="sec2_tb">
									<h2 id="">My Profile</h2>
									<span>저의 개인 프로필입니다.</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</div>
			<div id="Scroll">
				<a href="#" >
				<span></span><span></span><span></span></a>
			</div>
		</div>
		<div class="section swiper-slide sec3 sec_color1" >
			<div class="contents">
				<h2 id="sec3_h2" class="animate__animated animate__fadeInDown">Stacks</h2>
				<div class="top_box  stack_box animate__animated animate__fadeInDown">
				<div class="stack" id="html">
					<div class="desc">
						<div>
							<p>HTML</p>
						</div>
					</div>
				</div>
				<div class="stack" id="css">
					<div class="desc">
						<div>
							<p>CSS</p>
						</div>
					</div>
				</div>
				<div class="stack" id="js">
					<div class="desc">
						<div>
							<p>JS</p>
						</div>
					</div>
				</div>
				<div class="stack" id="java">
					<div class="desc">
						<div>
							<p>JAVA</p>
						</div>
					</div>
				</div>
			</div>
			<div class="stack_box animate__animated animate__fadeInDown">
				<div class="stack" id="jquery">
					<div class="desc">
						<div>
							<p>JQUERY</p>
						</div>
					</div>
				</div>
				<div class="stack" id="mysql">
					<div class="desc">
						<div>
							<p>MYSQL</p>
						</div>
					</div>
				</div>
				<div class="stack" id="spring">
					<div class="desc">
						<div>
							<p>SPRING</p>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div id="Scroll">
				<a href="#" >
				<span></span><span></span><span></span></a>
			</div>
		</div><!--  -->
		<div class="section swiper-slide sec4 sec_color2" id="sec4-1">
			<div class="contents ">
				<div class="animate__animated animate__fadeInDown">
				<h2>PROJECT</h2>
			</div>
				<div class="projectlist animate__animated animate__fadeInDown ">
					<div class="project ">
						<div class="project_num">
							<span>01</span>
						</div>
						<div id="project1_box">
							
						</div>
						<div class="project_desc">
							<div>
								<h2>Mongle</h2>
									<a href="https://github.com/wikwanggy/Mongle"><img src="/resources/css/img/git.svg" alt="git" class="project_git">
									</a>
							</div>
						</div>
					</div>
					<div class="project">
						<div class="project_num">
							<span>02</span>
						</div>
						<div id="project2_img">
						</div>
						<div class="project_desc">
							<div>
								<h2>규월드</h2>
									<a href="https://github.com/wikwanggy/wi"><img src="/resources/css/img/git.svg" alt="git" class="project_git"></a>
							</div>
						</div>
					</div>
					<div class="project" style="background-color: rgb(255, 255, 128);">
						<div class="project_num">
							<span>03</span>
						</div>
						<div>
							<h2	style="color:black;font-size:40px;margin-top: 100px;">Coming Soon</h2>
						</div>
						<div class="project_desc">
							<div>
								<h2>준비중</h2>
							</div>
						</div>
					</div>
					<div class="project" style="background-color:#424242;">
						<div class="project_num">
							<span>04</span>
						</div>
						<div>
							<h2 style="font-size:40px;margin-top: 100px;">열심히 <br>채우겠습니다.</h2>
						</div>
						<div class="project_desc">
							<div id="projectlist_box">
								<p style="font-size:35px;">프로젝트 리스트</p>
								<a href="/Account/projectlist"><button id="project_btn">더 보기</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
					<div id="Scroll">
				<a href="#" >
				<span></span><span></span><span></span></a>
			</div>
				</div>
			<div class="section swiper-slide sec5 sec_color1">
				<div class="contents">
					<div class="p_left innerbox box_img4">
						<div id="myimg"></div>
					</div>
					<div class="p_right innerbox">
						<div class="sec5_right_box">
							<div class="" id="sec5_text">
								<h2>본인 정보</h2>
								<span>
								이름 : 위광규<br>
								나이 : 25세<br>
								전화번호 : 010-7742-8827<br>	
								</span>
								<span>
								경력 : 현대자동차(21.04~22.02)<br>
								병역 : 군필(만기제대)<br>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div id="Scroll">
					<a href="#" >
					<span></span><span></span><span></span></a>
				</div>
			</div>
		<div class="section sec6 " id="sec6_box">
			<div class="contents section">
				<div><h1 id="sec6_h1">CONTACT</h1></div>
				<div id="sec6_box_text">
					<span>저는 배운 과정으로 이 기술들을 활용할 수 있는 회사에 취업을 하는게  계획입니다.<br>
					아직은 잘 모르고 서툴지만 지켜봐주시면 감사하겠습니다.</span>
				</div>
				<div id="sec6_textbox">
					<div id="kakao_h1" class="SNS"><a href="https://open.kakao.com/o/sJxzFBEe" id="kakao_a">KAKAO</a></div>
					<div id="git_h1" class="SNS"><a href="https://github.com/wikwanggy" id="git_a">GIT</a></div>
					<div id="blog_h1" class="SNS"><a href="https://blog.naver.com/hyye0913" id="blog_a">BLOG</a></div>
					<div id="insta_h1" class="SNS"><a href="https://www.instagram.com/calix_98/" id="insta_a"> INSTA</a></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>