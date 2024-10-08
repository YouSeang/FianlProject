<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ourfont.css"> --%>
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
	window.onload = function() {
		// 쿼리 파라미터를 읽어와서 팝업을 띄우기
		const urlParams = new URLSearchParams(window.location.search);
		if (urlParams.get('success') === 'true') {
			alert('정보 수정이 완료되었습니다');
		}
	}
</script>
<style>
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}

.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 1rem;
	background-color: transparent;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 0.75rem;
	vertical-align: middle; /* 수직 중앙 정렬 */
	border-top: 1px solid #dee2e6;
}

.table thead th {
	vertical-align: bottom;
	border-bottom: 2px solid #dee2e6;
}

.table tbody+tbody {
	border-top: 2px solid #dee2e6;
}

.table-bordered {
	border: 1px solid #dee2e6;
}

.table-bordered th, .table-bordered td {
	border: 1px solid #dee2e6;
}

.table-responsive {
	display: block;
	width: 100%;
	overflow-x: auto;
	-webkit-overflow-scrolling: touch;
}

.table th.width-20 {
	width: 20%;
}

.table th.width-25 {
	width: 25%;
}

.table td.width-30 {
	width: 30%;
}

.bg-light-gray {
	background-color: rgb(245, 245, 245); /* 연한 회색 배경색 */
}

.flex-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.flex-container button {
	margin-left: auto;
}

.button-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 1rem;
}

/* 버튼 스타일 */
.btn-primary, .btn-secondary {
	padding: 5px;
	border-radius: 10px;
	font-size: 18px;
	width: 130px;
}

.btn-primary {
	background-color: #FFB200;
	border: none;
	color: white;
}

.btn-primary:hover {
	background-color: #031550;
	color: white;
}

.btn-secondary {
	background-color: #6c757d;
	border: none;
	color: white;
}

.btn-secondary:hover {
	background-color: #5a6268;
	color: white;
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

	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/mypagebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							LocKB <span> 마이페이지</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">

								<li class="breadcrumb-item active" aria-current="page">LocKB</li>
								<li class="breadcrumb-item"><a>:락비</a></li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영역 End -->

	<!-- 마이페이지영역 start -->

	<main class="main-content checkout-content">

		<div class="container">

			<div class="row g-5 mb-4">
				<div class="col-lg-6"></div>
				<div class="col-lg-5 offset-lg-1">
					<div class="checkout-info">
						<div class="lead" style="margin-left: 250px;">
							<strong style="font-weight: 900;"><c:out
									value="${userInfo.name}" /></strong>님의 마이페이지
						</div>
					</div>
				</div>
			</div>
			<!-- 내정보역역 Start -->
			<div class="checkout-billingform bg-light rounded p-lg-5 p-3 mt-5">
				<!-- 노란배경역역 -->
				<div class="woocommerce-cart-wrapper py-5">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">내 정보</h5>
							<div class="table-responsive">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th scope="row" class="width-20 bg-light-gray">이름</th>
											<td class="width-30"><c:out value="${userInfo.name}" /></td>
											<th scope="row" class="width-20 bg-light-gray">아이디</th>
											<td class="width-30"><c:out value="${userInfo.user_id}" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="width-20 bg-light-gray">Email</th>
											<td class="width-30"><c:out value="${userInfo.email}" />
											</td>
											<th scope="row" class="width-20 bg-light-gray">휴대폰 번호</th>
											<td class="width-30"><c:out
													value="${userInfo.phone_number}" /></td>
										</tr>
									</tbody>
								</table>
								<div class="button-container">
									<button class="btn btn-primary"
										onclick="location.href='${pageContext.request.contextPath}/modify'">정보수정</button>
								</div>
							</div>
							<hr>
							<h5 class="card-title mt-4">내 현황</h5>
							<div class="table-responsive">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th scope="row" class="width-20 bg-light-gray">보유포인트</th>
											<td class="width-30">
												<div class="flex-container">
													<span><c:out value="${totalPoints}" /></span>
													<button class="btn btn-primary"
														onclick="location.href='${pageContext.request.contextPath}/mypoint'">상세내역</button>
												</div>
											</td>
											<th scope="row" class="width-20 bg-light-gray">보유쿠폰</th>
											<td class="width-30">
												<div class="flex-container">
													<span><c:out value="${coupon.unused_coupons}" />장</span>
													<button class="btn btn-primary"
														onclick="location.href='${pageContext.request.contextPath}/myCoupon'">상세내역</button>
												</div>
											</td>
											</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>

	<!-- mypage영역 end -->
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

      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>
</html>
