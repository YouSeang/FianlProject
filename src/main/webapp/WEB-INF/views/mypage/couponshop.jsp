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
<title>HelpPlus Charity Template</title>

<!-- Favicon Icon -->
<link rel="shortcut icon" href="images/components/favicon.ico">


<!-- Plugins CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/fontawesome/all.min.css">
<link rel="stylesheet" href="css/font/flaticon.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/jquery-ui.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" href="css/style.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<meta charset="UTF-8">
<title>쿠폰교환</title>
<style>
.product-summery {
	text-align: center; /* 중앙 정렬 */
}

.radio-container {
	margin-top: 10px; /* 제목과 라디오 버튼 사이의 간격 */
}

.radio-container label {
	display: inline-flex; /* 라디오 버튼을 중앙에 배치 */
	align-items: center;
}

.radio-container input[type="radio"] {
	margin-right: 5px; /* 라디오 버튼과 텍스트 사이의 간격 */
}

.button-container {
	display: flex;
	justify-content: center;
	margin-top: 1rem;
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
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-position: 50% 0%;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							KB큽스쿨 <span>쿠폰교환</span>
						</h1>
						<nav aria-label="breadcrumb"></nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영역 end -->

	<!-- 쿠폰선택영역 start -->
	<main class="shop-page section-padding">
		<div class="container">
			<div class="shop-body row g-4">
				<div class="col-lg-4 col-sm-6">
					<div class="product-entry">
						<div class="product-media position-relative"
							style="margin-right: 20px;">
							<a href="single-product.html"> <img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/images/coupons/쿠폰1.png"
								alt="product">
							</a>
						</div>
						<div class="product-summery p-3">
							<h3 class="product-title">
								<a class="text-reset" href="single-product.html"> 스타벅스
									아메리카노(Tall)</a>
							</h3>
							<div class="radio-container">
								<label> <input type="radio" name="coupon-selection"
									value="starbucks" />
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="product-entry">
						<div class="product-media position-relative"
							style="margin-right: 20px;">
							<a href="single-product.html"> <img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/images/coupons/쿠폰2.png"
								alt="product">
							</a>
						</div>
						<div class="product-summery p-3">
							<h3 class="product-title">
								<a class="text-reset" href="single-product.html">
									금융쿠폰(10,000원)</a>
							</h3>
							<div class="radio-container">
								<label> <input type="radio" name="coupon-selection"
									value="money" />
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="product-entry">
						<div class="product-media position-relative">
							<a href="single-product.html"> <img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/images/coupons/쿠폰3.png"
								alt="product">
							</a>
						</div>
						<div class="product-summery p-3">
							<h3 class="product-title">
								<a class="text-reset" href="single-product.html">
									CU모바일상품권(5,000원)</a>
							</h3>
							<div class="radio-container">
								<label> <input type="radio" name="coupon-selection"
									value="cu" />
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				ㅇ모든 쿠폰은 포인트 5000점과 교환됩니다. <br /> ㅇ쿠폰으로 교환 후에는 취소가 불가하며 포인트는 소멸됩니다.
				</br/> ㅇ기타 상세 문의사항이 있으신 경우에는 고객센터(1588-9999)로 문의해주세요.
			</div>
			<div class="button-container">
				<button class="btn btn-warning">쿠폰교환</button>
			</div>
		</div>
	</main>
	<!-- 쿠폰선택영역 end -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!--Javascript======================================================== -->

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
