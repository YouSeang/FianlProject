<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


<!-- Template Title -->
<title>HelpPlus Charity Template</title>

<!-- Favicon Icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">


<!-- Plugins CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">

<!-- Theme CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>


	<!-- Banner Area Start -->
	<section class="banner-area">
		<div class="banner-2 owl-carousel">
			<div class="single-banner"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/voiceBanner.jpg')">
				<div class="container">
					<div class="banner-info">
						<h1 class="banner-title text-white" style="color: white;">
							KB보이스피싱
							<div />
							<span>시뮬레이션 </span><br />체험해보세요
						</h1>
						<p>설명 설명 설명</p>
						<div class="banner-btn">
							<a href="../voiceDetail?voice=impersonation" class="custom-btn">기관사칭</a>
							<a href="../voiceDetail?voice=loan" class="custom-btn">대출사기</a>
						</div>
						<div class="banner-btn"></div>
					</div>
				</div>
			</div>
			<!-- Single Banner End -->
			<%-- <div class="single-banner"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/voiceBanner2.jpg')">
				<div class="container">
					<div class="banner-info">
						<h1 class="banner-title text-white" style="color: white;">
							KB보이스피싱 <span><br />시뮬레이션</span><br /> 체험해보세요
						</h1>
						<p>설명 설명 설명</p>
						<div class="banner-btn">
							<a href="../voiceDetail?voice=loan" class="custom-btn">대출사기</a>
						</div>
					</div>
				</div>
			</div> --%>
	</section>
	<!-- Banner Area End -->


	<!--
Javascript
======================================================== -->
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