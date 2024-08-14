<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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

<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- Theme CSS -->
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
	<!-- 	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div> -->


	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-position: 50% 0%;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>번호조회</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">메인</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영역 end -->

	<form action="${pageContext.request.contextPath}/admin/rentSettings" method="post">
    <h3>아파트 설정</h3>
    <input type="hidden" name="apartmentSettings.propertyType" value="apartment"/>
    <div>
        <label for="apartmentPercentage">비율:</label>
        <input type="number" id="apartmentPercentage" name="apartmentSettings.percentage" value="${apartmentSettings.percentage}" step="0.01" required>
    </div>
    <div>
        <label for="apartmentHousePriceTerm">주택 시세 용어:</label>
        <input type="text" id="apartmentHousePriceTerm" name="apartmentSettings.housePriceTerm" value="${apartmentSettings.housePriceTerm}" required>
    </div>
    <div>
        <label for="apartmentMortgageAmountTerm">근저당 설정 금액 용어:</label>
        <input type="text" id="apartmentMortgageAmountTerm" name="apartmentSettings.mortgageAmountTerm" value="${apartmentSettings.mortgageAmountTerm}" required>
    </div>
    <div>
        <label for="apartmentRentPriceTerm">전세 가격 용어:</label>
        <input type="text" id="apartmentRentPriceTerm" name="apartmentSettings.rentPriceTerm" value="${apartmentSettings.rentPriceTerm}" required>
    </div>

    <h3>빌라 설정</h3>
    <input type="hidden" name="villaSettings.propertyType" value="villa"/>
    <div>
        <label for="villaPercentage">비율:</label>
        <input type="number" id="villaPercentage" name="villaSettings.percentage" value="${villaSettings.percentage}" step="0.01" required>
    </div>
    <div>
        <label for="villaHousePriceTerm">매매가 용어:</label>
        <input type="text" id="villaHousePriceTerm" name="villaSettings.housePriceTerm" value="${villaSettings.housePriceTerm}" required>
    </div>
    <div>
        <label for="villaMortgageAmountTerm">근저당 설정 금액 용어:</label>
        <input type="text" id="villaMortgageAmountTerm" name="villaSettings.mortgageAmountTerm" value="${villaSettings.mortgageAmountTerm}" required>
    </div>
    <div>
        <label for="villaTotalOtherDepositTerm">다른 호실의 보증금 합계 용어:</label>
        <input type="text" id="villaTotalOtherDepositTerm" name="villaSettings.totalOtherDepositTerm" value="${villaSettings.totalOtherDepositTerm}" required>
    </div>
    <div>
        <label for="villaRentPriceTerm">전세 가격 용어:</label>
        <input type="text" id="villaRentPriceTerm" name="villaSettings.rentPriceTerm" value="${villaSettings.rentPriceTerm}" required>
    </div>

    <button type="submit">저장</button>
</form>

	<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

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