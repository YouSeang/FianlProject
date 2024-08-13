<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">

<!-- Template Title -->
<title>LocKB</title>

<!-- Favicon Icon -->
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
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- Style css
    ==================================================================== -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">


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

	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp" %> 


	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							KB큽스쿨 <span> 회원가입</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">메인</a></li>
								<li class="breadcrumb-item active" aria-current="page">회원가입</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo Area End -->

	<!-- Main Area Start -->
	<main class="main-content">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 mx-auto">
					<div class="login-wrap bg-light">
						<h2 class="h6 fw-normal mb-5">
							<span class="fw-bold tex-primary d-block display-5"> 회원가입</span>
						</h2>
						<form role="form" action="./signup" method="post">
							<div class="form-group">
								<label for="user_id">아이디 :</label> <input class="form-control"
									type="text" id="user_id" name="user_id">
							</div>
							<div class="form-group">

								<label for="name">이름 :</label> <input id="name"
									class="form-control" type="text" name="name">

							</div>

							<div class="form-group">
								<label for="email">이메일 :</label> <input class="form-control"
									type="email" id="email" name="email" placeholder="test@kb.com">
							</div>
							<div class="form-group">
								<label for="phone_number">휴대폰번호 :</label> <input
									class="form-control" type="text" id="phone_number"
									name="phone_number" placeholder="010-1234-5678">
							</div>
							<div class="form-group">
								<label for="password">비밀번호 :</label> <input class="form-control"
									type="password" id="password" name="password">
							</div>
							<div class="form-group">
								<label for="pass-c">비밀번호 확인 :</label> <input
									class="form-control" type="password" id="pass-c">
							</div>
							<button class="custom-btn mt-3" type="submit">가입완료</button>
							<div class="login-bottom mt-4">
								<label><i class="fa fa-user me-2"></i> 계정이 이미 있으시다면 <a
									href="signin.html">로그인</a> 해주세요</label>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- LOGING AREA END -->
		</div>
	</main>
	<!-- Main Area End -->

	<!-- Become Volunteer Area Start -->
	<div class="volunteer-area bg-cover section-padding"
		data-stellar-background-ratio="0.4"
		style="background-image: url('images/banner/volunteer.jpg');">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="volunteer-wrap text-center">
						<span>Become a Volunteer</span>
						<p>Join us to participate yourself for mankind</p>
						<a href="#" class="custom-btn">join now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Become Volunteer Area End -->

	<!-- Footer Area Start -->
	<footer class="footer-area">
		<div class="footer-top">
			<div class="newsletter">
				<h4>SignUp Our Newsletter</h4>
				<!-- Mailchimp From Start -->
				<form class="mailchimp inputSubscribeDiv">
					<input type="email" name="subscribe" id="subscriber-email"
						placeholder="Your Mail" class="form-control">
					<button type="submit" id="subscribe-button">
						<i class="fa fa-paper-plane"></i>
					</button>
					<div class="subscription-success"></div>
					<div class="subscription-error"></div>
					<label class="subscription-label" for="subscriber-email"></label>
				</form>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-sm-6">
					<div class="footer-widget footer-about">
						<div class="f-logo">
							<a href="#"> <img src="images/components/f-logo.png"
								alt="Logo">
							</a>
						</div>
						<p>Help us to save lifes during a natural disaster, get clean
							water running in the most remote areas, and much more.</p>
						<div class="footer-social">
							<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
								href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
								class="fa-brands fa-youtube"></i></a> <a href="#"><i
								class="fa-brands fa-pinterest"></i></a> <a href="#"><i
								class="fa-brands fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1 col-sm-5 offset-sm-1">
					<div class="footer-widget">
						<h3 class="widget-title">about us</h3>
						<ul>
							<li><a href="#">About Employee</a></li>
							<li><a href="#">About Carrier</a></li>
							<li><a href="#">How it works</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-sm-6">
					<div class="footer-widget">
						<h3 class="widget-title">Useful Links</h3>
						<ul>
							<li><a href="#">Project</a></li>
							<li><a href="#">Donner</a></li>
							<li><a href="#">Relief</a></li>
							<li><a href="#">Sanitaion</a></li>
							<li><a href="#">News</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-sm-5 offset-sm-1 offset-lg-0">
					<div class="footer-widget">
						<h3 class="widget-title">Contact Us</h3>
						<ul class="footer-contact">
							<li><i class="fa fa-home"></i> <span>129, London
									Street, South London UK.</span></li>
							<li><i class="fa fa-phone"></i><span><a
									href="tel:+6494461709.7890">+00- 123.456.7890</a> <br> <a
									href="tel:+6494461709.7890">+00- 223.456.7890</a></span></li>
							<li><i class="fa fa-envelope"></i> <span><a
									href="mailto:help@gmail.com">help@gmail.com</a></span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row copy-right g-0">
				<div class="col-xl-6 col-md-7 order-2 order-md-1">
					<p>
						Copyright © 2024. All Rights Reserved by <a href="#">theme-village</a>
					</p>
				</div>
				<div class="col-xl-6 col-md-5 order-1 order-md-2">
					<nav class="quick-link text-lg-end">
						<ul>
							<li><a href="#" class="nav-link">Terms & Conditions</a></li>
							<li><a href="#" class="nav-link">Privacy Policy</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Area Start -->

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