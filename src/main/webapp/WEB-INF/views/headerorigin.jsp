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

<!-- Template Title
    ==================================================================-->
<title>KB큽스쿨</title>

<!-- Favicon Icon
    ==================================================-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Style Libraries
    ==================================================================-->
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

<!-- Style css
    ==================================================================== -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!-- Header Start -->
	<header class="hearer">
		<div class="offcanvas offcanvas-top bg-info" id="offcanvas-search"
			data-bs-scroll="true">
			<div class="container d-flex flex-row py-5">
				<form class="search-form w-100">
					<input id="search-form" type="text" class="form-control"
						placeholder="Type keyword and hit enter">
				</form>
				<button type="button" class="btn-close icon-xs bg-light rounded-5"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg">
			<div class="container px-lg-0">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
					src="${pageContext.request.contextPath}/resources/images/components/logo.png"
					alt="Logo"></a>
				<button class="navbar-toggler offcanvas-nav-btn" type="button">
					<i class="fa fa-bars"></i>
				</button>
				<div class="offcanvas offcanvas-start offcanvas-nav">
					<div class="offcanvas-header">
						<a href="./index.html" class="text-inverse"><img
							src="${pageContext.request.contextPath}/resources/images/components/logo.png"
							alt="Logo"></a>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body pt-0 align-items-center">
						<ul class="navbar-nav mx-auto align-items-lg-center">
							<li class="nav-item"><a href="./about.html" class="nav-link"
								style="color: #333333;">큽스쿨소개</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle"
								href="${pageContext.request.contextPath}/voice/incidentsOverview"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"
								style="color: #333333;">사고예방</a>
								<ul class="dropdown-menu"
									style="background-color: rgba(255, 255, 255, 0.9);">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/voice/incidentsOverview">금융사고현황</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/voice/recentIncidents">최신피싱기법
											및 사례</a></li>
									<li class="dropdown-submenu dropend"><a
										class="dropdown-item dropdown-toggle"
										href="${pageContext.request.contextPath}/voice/smishing">금융사고예방
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
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"
								style="color: #333333;">금융교육</a>
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
												href="${pageContext.request.contextPath}/edu/sbjoin">회원가입</a></li>
											<li><a class="dropdown-item"
												href="${pageContext.request.contextPath}/edu/sbtransfer">이체</a></li>
											<li><a class="dropdown-item"
												href="${pageContext.request.contextPath}/edu/sbsavings">상품가입</a></li>
										</ul></li>
									<li class="dropdown-submenu dropend"><a
										class="dropdown-item dropdown-toggle"
										href="${pageContext.request.contextPath}/edu/ibjoin">인터넷뱅킹
											체험 체험</a>
										<ul class="dropdown-menu"
											style="background-color: rgba(255, 255, 255, 0.9);">
											<li class="dropdown-header">KB인터넷뱅킹 체험</li>
											<li><a class="dropdown-item"
												href="${pageContext.request.contextPath}/edu/ibtransfer">이체</a></li>
											<li><a class="dropdown-item"
												href="${pageContext.request.contextPath}/edu/ibsavings">상품가입</a></li>
										</ul></li>
									<li class="dropdown-submenu dropend"><a
										class="dropdown-item dropdown-toggle"
										href="${pageContext.request.contextPath}/game/quiz">금융퀴즈</a>
										<ul class="dropdown-menu"
											style="background-color: rgba(255, 255, 255, 0.9);">
											<li class="dropdown-header">금융게임</li>
											<li><a class="dropdown-item"
												href="${pageContext.request.contextPath}/game/quiz">OX퀴즈</a></li>
											<li><a class="dropdown-item"
												href="${pageContext.request.contextPath}/game/findcrime">범죄자
													잡기</a></li>
										</ul></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/edu/eduvideo">교육영상</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle"
								href="${pageContext.request.contextPath}/security/securityTemp"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"
								style="color: #333333;">나의보안</a>
								<ul class="dropdown-menu"
									style="background-color: rgba(255, 255, 255, 0.9);">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/security/securityTemp">나의
											보안점수</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/security/securityGuide">보안
											강화방법</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"
								style="color: #333333;">소통창구</a>
								<ul class="dropdown-menu"
									style="background-color: rgba(255, 255, 255, 0.9);">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/board/attendance">출석체크</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/board/share">사례공유</a></li>
								</ul></li>
						</ul>
						<div
							class="mt-3 mt-lg-0 d-flex align-items-center header-actions justify-content-between">
							<c:choose>
								<c:when test="${not empty sessionScope.user}">
									<a href="${pageContext.request.contextPath}/logout"
										class="custom-btn">로그아웃</a>
									<a class="text-reset icon" href="#" data-bs-toggle="offcanvas"
										data-bs-target="#offcanvas-search"><i class="fa fa-search"></i></a>
									<c:choose>
										<c:when test="${sessionScope.user.role eq 'admin'}">
											<a href="${pageContext.request.contextPath}/admin/admin"
												class="text-reset icon position-relative me-2"><i
												class="fa fa-user"></i></a>
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/mypage"
												class="text-reset icon position-relative me-2"><i
												class="fa fa-user"></i></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/loginView"
										class="custom-btn">로그인</a>
									<a class="text-reset icon" href="#" data-bs-toggle="offcanvas"
										data-bs-target="#offcanvas-search"><i class="fa fa-search"></i></a>
									<a href="${pageContext.request.contextPath}/loginView"
										class="text-reset icon position-relative me-2"
										onclick="alert('로그인이 필요합니다. \n로그인화면으로 이동합니다.');"><i
										class="fa fa-user"></i></a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- Header End -->
	<!-- JavaScript Libraries
    ======================================================== -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>