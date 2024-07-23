<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>

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


<!-- Template Title
    ==================================================================-->
<title>KB스쿨</title>

<!-- Favicon Icon
    ==================================================-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

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
	<!-- Preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							KB스타뱅킹 <span> 이체</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">메인</a></li>
								<li class="breadcrumb-item active" aria-current="page">체험하기</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo Area End -->

	<!-- Team Area Start -->
	<section class="donations-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro intro-full">
						<h2 class="section-title">
							<span class="color">KB스타뱅킹</span> 회원가입
						</h2>
						<p>KB스타뱅킹 회원가입을 가상으로 체험해보고, 실제로 진행해보세요!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div
						class="bg-light donation-form rounded-3 shadow-sm d-flex justify-content-center align-items-center"
						style="min-height: 100vh;">
						<!-- <div class="header-container">
							<a href="javascript:history.go(-1);" class="go-back"><span
								class="ico ico-back ico-circle">뒤로</span></a> <a
								href="/static/dbe/index.html"><h1 class="logo">
									<span class="blind">KB큽스쿨</span>
								</h1></a>
						</div> -->
						<%@ include file="/WEB-INF/views/edu/sbtransfer2.jsp"%>

					</div>


				</div>
			</div>
		</div>
	</section>
	<!-- Team Area End -->

	<%@ include file="/WEB-INF/views/footer.jsp"%>


	<!--
Javascript
======================================================== -->


</body>

</html>