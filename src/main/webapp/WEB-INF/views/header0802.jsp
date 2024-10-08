<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

<!-- Template Title -->
<title>LocKB</title>

<!-- Favicon Icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Style Libraries -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<!-- Style css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Custom CSS for Mobile Navigation -->
<style>
/* 기본 스타일 유지 */
body {
	overflow-x: hidden;
}

.mobile-nav {
	position: fixed;
	top: 0;
	left: -300px; /* 사이드바 폭을 300px로 조정 */
	width: 300px;
	height: 100%;
	background-color: #fff;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
	z-index: 2000;
	transition: left 0.3s ease;
	overflow-y: auto;
}

.mobile-nav.active {
	left: 0;
}

.mobile-nav-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem;
	border-bottom: 1px solid #eaeaea;
}

.mobile-nav-close {
	font-size: 1.5rem;
	cursor: pointer;
}

.mobile-nav ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.mobile-nav ul li {
	border-bottom: 1px solid #eaeaea;
}

.mobile-nav ul li a {
	display: block;
	padding: 1rem;
	text-decoration: none;
	color: #333;
}

.mobile-nav ul li a:hover {
	background-color: #f5f5f5;
}

.mobile-nav ul li .dropdown-menu {
	display: none;
	position: relative;
	z-index: 3000; /* 드롭다운 메뉴의 z-index를 높게 설정 */
}

.mobile-nav ul li.active .dropdown-menu {
	display: block;
}

.mobile-nav-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	display: none;
}

.mobile-nav-backdrop.active {
	display: block;
}

/* 추가적인 CSS 수정 */
.dropdown-submenu .dropdown-menu {
	position: relative;
	left: 20px; /* 적절한 위치로 조정 */
	top: 0;
	z-index: 3000; /* 드롭다운 메뉴의 z-index를 높게 설정 */
}

/* Dept 구분을 위한 CSS */
.dept-1>a {
	font-weight: bold;
	background-color: #e9ecef;
}

.dept-2>a {
	padding-left: 2rem;
	background-color: #f8f9fa;
}

.dept-3>a {
	padding-left: 3rem;
	background-color: #e9ecef;
}

/* 모바일 네비게이션 버튼 스타일 */
.navbar-toggler {
	display: block;
	border: none;
	background: none;
	font-size: 1.5rem;
	cursor: pointer;
}

.navbar-toggler-icon {
	width: 30px;
	height: 3px;
	background-color: #333;
	display: block;
	position: relative;
}

.navbar-toggler-icon::before, .navbar-toggler-icon::after {
	content: '';
	width: 30px;
	height: 3px;
	background-color: #333;
	position: absolute;
	left: 0;
	transition: all 0.3s;
}

.navbar-toggler-icon::before {
	top: -10px;
}

.navbar-toggler-icon::after {
	bottom: -10px;
}

.mobile-nav-header {
	display: flex;
	align-items: center;
	padding: 1rem;
	border-bottom: 1px solid #eaeaea;
}

.mobile-nav-actions {
	display: flex;
	align-items: center;
}

.mobile-login-btn {
	font-size: 0.9rem;
	color: #ffffff;
	background-color: #ffb200;
	padding: 5px 10px;
	border-radius: 5px;
	text-decoration: none;
	margin-right: 5px; /* 닫기 버튼과의 간격 */
	display: inline-block;
	border: 1px solid #ffb200;
	transition: background-color 0.3s ease;
}

.mobile-login-btn:hover {
	background-color: #505050;
	border-color: #505050;
	color: #ffffff;
}

.mobile-nav-close {
	font-size: 1.5rem;
	cursor: pointer;
	margin-left: 0; /* 필요에 따라 조정 가능 */
}

.mobile-mypage-btn {
	font-size: 0.9rem;
	color: #ffffff;
	background-color: #ffb200;
	padding: 5px 10px;
	border-radius: 5px;
	text-decoration: none;
	margin-right: 5px; /* 닫기 버튼과의 간격 */
	display: inline-block;
	border: 1px solid #ffb200;
	transition: background-color 0.3s ease;
}

.mobile-mypage-btn:hover {
	background-color: #505050;
	border-color: #505050;
	color: #ffffff;
}

.mobile-admin-btn {
	font-size: 0.9rem;
	color: #ffffff;
	background-color: #ffb200;
	padding: 5px 10px;
	border-radius: 5px;
	text-decoration: none;
	margin-right: 5px; /* 닫기 버튼과의 간격 */
	display: inline-block;
	border: 1px solid #ffb200;
	transition: background-color 0.3s ease;
}

.mobile-admin-btn:hover {
	background-color: #505050;
	border-color: #505050;
	color: #ffffff;
}
</style>

</head>

<body>





	<!-- Header Start -->
	<header class="header">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" style="margin-left: 100px;"
					href="${pageContext.request.contextPath}/"> <img
					src="${pageContext.request.contextPath}/resources/images/components/logo6.png"
					alt="Logo">
				</a>
				<button class="navbar-toggler" type="button" id="mobile-nav-toggle">
					<span class="fa fa-bars"></span>
				</button>




				<div class="collapse navbar-collapse">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/aboutLocKB"
							class="nav-link" style="color: #333333;">LocKB소개</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle"
							href="${pageContext.request.contextPath}/voice/incidentsOverview"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="color: #333333;">금융사기 예방하기</a>
							<ul class="dropdown-menu"
								style="background-color: rgba(255, 255, 255, 0.9);">
								<li class="dropdown-submenu dropend"><a
									class="dropdown-item dropdown-toggle"
									href="${pageContext.request.contextPath}/voice/smishing">금융사기
										시뮬레이션</a>
									<ul class="dropdown-menu"
										style="background-color: rgba(255, 255, 255, 0.9);">
										<li class="dropdown-header">금융사고예방 시뮬레이션</li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/voice/voicePhishing">보이스피싱</a></li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/voice/smishing">스미싱</a></li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/voice/messagePhishing">메신저피싱</a></li>
									</ul></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/phoneLookupForm">발신번호
										조회</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/board/guide">예방 요령</a></li>





							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="color: #333333;">금융 익숙해지기</a>
							<ul class="dropdown-menu"
								style="background-color: rgba(255, 255, 255, 0.9);">
								<li class="dropdown-submenu dropend"><a
									class="dropdown-item dropdown-toggle"
									href="${pageContext.request.contextPath}/edu/sbjoin">KB스타뱅킹
										체험</a>
									<ul class="dropdown-menu"
										style="background-color: rgba(255, 255, 255, 0.9);">
										<li class="dropdown-header">KB스타뱅킹 체험</li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/edu/sbtransfer">이체</a></li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/edu/sbsavings">상품가입</a></li>
									</ul></li>

								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/preCheckQuiz">전세계약
										사전확인</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/game/quiz">금융 퀴즈</a></li>


							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle"
							href="${pageContext.request.contextPath}/security/securityTemp"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="color: #333333;">정보 모아보기</a>
							<ul class="dropdown-menu"
								style="background-color: rgba(255, 255, 255, 0.9);">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/voice/incidentsOverview">금융
										사고 현황</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/voice/recentIncidents">최신
										금융사고 뉴스</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/security/securityGuide">보안
										어플/사이트</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/edu/eduvideo">금융
										영상</a></li>



							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="color: #333333;">함께 참여하기</a>
							<ul class="dropdown-menu"
								style="background-color: rgba(255, 255, 255, 0.9);">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/board/attendance">출석
										체크</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/board/share">피해 사례
										공유</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/security/securityTemp">나의
										보안점수</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/game/game">범죄자 잡기
										게임</a></li>
							</ul></li>
					</ul>
					<div
						class="mt-3 mt-lg-0 d-flex align-items-center header-actions justify-content-between">
						<c:choose>
							<c:when test="${not empty sessionScope.user}">
								<a href="${pageContext.request.contextPath}/logout"
									class="custom-btn">로그아웃</a>
								<!--  <a class="text-reset icon" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-search"><i class="fa fa-search"></i></a> -->
								<c:choose>
									<c:when test="${sessionScope.user.role eq 'admin'}">
										<a href="${pageContext.request.contextPath}/admin/admin"
											class="text-reset icon"  style="margin-right: 100px;"><i
											class="fa fa-user"></i></a>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/mypage"
											class="text-reset icon" style="margin-right: 100px;"><i
											class="fa fa-user"></i></a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/loginView"
									class="custom-btn">로그인</a>
								<!--  <a class="text-reset icon" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-search"><i class="fa fa-search"></i></a> -->
								<a href="${pageContext.request.contextPath}/loginView"
									class="text-reset icon" style="margin-right: 100px;"
									onclick="alert('로그인이 필요합니다. \n로그인화면으로 이동합니다.');"><i
									class="fa fa-user"></i></a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- Header End -->

	<!-- Mobile Navigation -->
	<div class="mobile-nav" id="mobile-nav">
		<div class="mobile-nav-header">
			<h5 class="mb-0">메뉴</h5>
			<div class="mobile-nav-actions">
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<!-- Admin 사용자일 경우 -->
						<c:choose>
							<c:when test="${sessionScope.user.role eq 'admin'}">
								<a href="${pageContext.request.contextPath}/admin/admin"
									class="mobile-admin-btn"> 관리자메뉴 </a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/mypage"
									class="mobile-mypage-btn"> 마이페이지 </a>
							</c:otherwise>
						</c:choose>
						<a href="${pageContext.request.contextPath}/logout"
							class="mobile-login-btn">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/loginView"
							class="mobile-login-btn">로그인</a>
					</c:otherwise>
				</c:choose>
				<span class="mobile-nav-close" id="mobile-nav-close">&times;</span>
			</div>
		</div>

		<ul>
			<li class="dept-1"><a
				href="${pageContext.request.contextPath}/aboutLocKB">LocKB소개</a></li>
			<li class="dept-1"><a href="#" class="dropdown-toggle" id="nav-prevent">금융사기
					예방하기</a>
				<ul class="dropdown-menu">
					<li class="dept-2 dropdown-submenu"><a href="#"
						class="dropdown-toggle" id="nav-simulation">금융사기 시뮬레이션</a>
						<ul class="dropdown-menu">
							<li class="dept-3"><a
								href="${pageContext.request.contextPath}/voice/voicePhishing">보이스피싱</a></li>
							<li class="dept-3"><a
								href="${pageContext.request.contextPath}/voice/smishing">스미싱</a></li>
							<li class="dept-3"><a
								href="${pageContext.request.contextPath}/voice/messagePhishing">메신저피싱</a></li>
						</ul></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/phoneLookupForm">발신번호
							조회</a></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/board/guide">예방 요령</a></li>
					
				</ul></li>
			<li class="dept-1"><a href="#" class="dropdown-toggle">금융
					익숙해지기</a>
				<ul class="dropdown-menu">
					<li class="dept-2 dropdown-submenu"><a href="#"
						class="dropdown-toggle" id="nav-simulation">KB스타뱅킹 체험</a>
						<ul class="dropdown-menu">
						
							<li class="dept-3"><a
								href="${pageContext.request.contextPath}/edu/sbtransfer">이체</a></li>
							<li class="dept-3"><a
								href="${pageContext.request.contextPath}/edu/sbsavings">상품가입</a></li>
						</ul></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/preCheckQuiz">전세계약
							사전확인</a></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/game/quiz">금융 퀴즈</a></li>
				</ul></li>
			<li class="dept-1"><a href="#" class="dropdown-toggle">정보
					모아보기</a>
				<ul class="dropdown-menu">
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/voice/incidentsOverview">금융
							사고 현황</a></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/voice/recentIncidents">최신
							금융사고 뉴스</a></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/security/securityGuide">보안
							어플/사이트</a></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/edu/eduvideo">금융 영상</a></li>
				</ul></li>
			<li class="dept-1"><a href="#" class="dropdown-toggle">함께
					참여하기</a>
				<ul class="dropdown-menu">
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/board/attendance">출석
							체크</a></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/board/share">피해 사례 공유</a></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/security/securityTemp">나의
							보안점수</a></li>
					<li class="dept-2"><a
						href="${pageContext.request.contextPath}/game/game">범죄자 잡기 게임</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="mobile-nav-backdrop" id="mobile-nav-backdrop"></div>

	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
	$(document).ready(function() {
		// 모바일 네비게이션 바 열기
		$('#mobile-nav-toggle').click(function() {
			$('#mobile-nav').addClass('active');
			$('#mobile-nav-backdrop').addClass('active');

			// 세션 스토리지에서 저장된 드롭다운 상태 복원
			$('.mobile-nav .dropdown-toggle').each(function() {
				var menuId = $(this).attr('id');
				var isActive = sessionStorage.getItem(menuId);
				if (isActive === 'true') {
					$(this).parent().addClass('active');
					$(this).siblings('.dropdown-menu').show();
				}
			});
		});

		// 모바일 네비게이션 바 닫기
		$('#mobile-nav-close, #mobile-nav-backdrop').click(function() {
			$('#mobile-nav').removeClass('active');
			$('#mobile-nav-backdrop').removeClass('active');
		});

		// 드롭다운 토글
		$('.mobile-nav .dropdown-toggle').click(function(e) {
			e.preventDefault();
			e.stopPropagation();

			var $this = $(this);
			var $dropdownMenu = $this.siblings('.dropdown-menu');
			var menuId = $this.attr('id');

			// 현재 드롭다운 메뉴의 열림/닫힘 상태 저장
			if ($this.parent().hasClass('active')) {
				$dropdownMenu.slideUp();
				$this.parent().removeClass('active');
				sessionStorage.setItem(menuId, 'false');
			} else {
				$dropdownMenu.slideDown();
				$this.parent().addClass('active');
				sessionStorage.setItem(menuId, 'true');
			}
		});

		// 드롭다운 메뉴 내 클릭 시 닫히지 않도록 방지
		$('.mobile-nav .dropdown-menu').click(function(e) {
			e.stopPropagation();
		});
	});
</script>



</body>
</html>
