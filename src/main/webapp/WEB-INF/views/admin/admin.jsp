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
<meta name="author" content="KB스쿨 관리자">

<title>LocKB</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font/kbfont.css">
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}
</style>

</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- Admin 기능 영역 Start -->
	<section class="admin-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							관리자 <span class="color">기능</span>
						</h2>
						<p>LocKB 홈페이지를 관리할 수 있습니다.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6">
					<div class="single-admin-feature">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/admin1.png"
							alt=""></span>
						<h3>사용자 관리</h3>
						<p>시스템에 등록된 사용자를 관리할 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/admin/adminUser"
							class="custom-btn">관리하기</a>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single-admin-feature">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/admin2.png"
							alt=""></span>
						<h3>시나리오 관리</h3>
						<p>보이스피싱 시나리오를 추가, 수정, 삭제할 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/admin/adminPhishing"
							class="custom-btn">관리하기</a>
					</div>
				</div>
				
				<div class="col-lg-4 col-sm-6">
					<div class="single-admin-feature">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/admin3.png"
							alt=""></span>
						<h3>OX 퀴즈 관리</h3>
						<p>OX퀴즈를 추가, 수정, 삭제할 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/admin/quiz"
							class="custom-btn">관리하기</a>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single-admin-feature">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/admin3.png"
							alt=""></span>
						<h3>교육영상 관리</h3>
						<p>교육영상을 확인하고 관리할 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/admin/adminVideo"
							class="custom-btn">관리하기</a>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single-admin-feature">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/admin3.png"
							alt=""></span>
						<h3>스미싱 관리</h3>
						<p>스미싱 케이스를 확인하고 관리할 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/admin/adminSmishing"
							class="custom-btn">관리하기</a>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single-admin-feature">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/admin3.png"
							alt=""></span>
						<h3>예방요령 관리</h3>
						<p>예방요령을 추가 및 삭제 할 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/admin/adminGuide"
							class="custom-btn">관리하기</a>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single-admin-feature">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/admin3.png"
							alt=""></span>
						<h3>쿠폰 관리</h3>
						<p>쿠폰을 관리할 수 있습니다.</p>
						<a href="${pageContext.request.contextPath}/admin/adminCoupon"
							class="custom-btn">관리하기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Admin 기능 영역 End -->

	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.scrollUp.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.syotimer.min.js"/>"></script>
	<script src="<c:url value="/resources/js/wow.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.counterup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/isotope.pkgd.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.ajaxchimp.min.js"/>"></script>
	<script src="<c:url value="/resources/js/form.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/resources/js/custom.js"/>"></script>
      
</body>
</html>
