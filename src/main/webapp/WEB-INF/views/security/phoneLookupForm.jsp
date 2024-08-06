<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Phone Number Lookup">
<meta name="author" content="Your Name">

<!-- Template Title -->
<title>번호조회</title>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- SweetAlert2 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
.points-container {
	padding: 20px;
	border: 1px solid #dee2e6;
	background-color: #fff;
	margin-top: 20px;
}

.points-note {
	font-size: 0.9em;
	color: #555;
}

.points-note ul {
	list-style-type: disc;
	padding-left: 20px;
}

.points-note ul li {
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<!-- header start -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

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

	<section class="donations-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro intro-full">
						<h2 class="section-title">
							번호 <span class="color">조회해보기</span>
						</h2>
						<p>잠깐! 피싱으로 생각되는 연락을 받았다면 조회 먼저 해보세요</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="bg-light donation-form rounded-3 shadow-sm">
						<form id="lookupForm" method="get">
							<label for="phoneNumber">조회할 번호:</label> <input type="text"
								placeholder="8212345678" id="phoneNumber" name="phoneNumber"
								required>
							<button type="submit">찾기</button>
						</form>
						<br /> <br /> <br />

						<div class="points-container">
							<div class="points-note">
								<p>※ +82 뒤에 조회하고자 하는 번호를 입력해주세요.</p>
								<p>※ 해당 조회결과는 참고용으로만 사용해주세요.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer start -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.stellar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrollUp.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.syotimer.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/wow.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/form.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

	<script>
		$(document)
				.ready(
						function() {
							// 폼 로드 시 기본적으로 '82'로 시작
							$('#phoneNumber').val('+82');
							$('#phoneNumber').focus(
									function() {
										if ($(this).val() === '82') {
											// 포커스가 있을 때 커서를 끝으로 이동
											this.setSelectionRange(
													this.value.length,
													this.value.length);
										}
									});
							$('#lookupForm')
									.on(
											'submit',
											function(e) {
												e.preventDefault();
												var phoneNumber = $(
														'#phoneNumber').val();

												// 영어에서 한국어로 변환하는 매핑 데이터
												var countryNames = {
													"Korea (Republic of)" : "대한민국",
													"United States" : "미국",
												// 필요한 다른 국가명도 추가
												};

												var locations = {
													"Seoul" : "서울",
													"Busan" : "부산",
												// 필요한 다른 위치도 추가
												};

												var lineTypes = {
													"mobile" : "모바일",
													"paging" : "유선전화",
													"voip" : "인터넷 전화",
												// 필요한 다른 유형도 추가
												};

												$
														.ajax({
															url : 'lookup',
															type : 'GET',
															data : {
																phoneNumber : phoneNumber
															},
															success : function(
																	response) {
																if (response.valid) {
																	var countryName = countryNames[response.country_name]
																			|| response.country_name;
																	var location = locations[response.location]
																			|| response.location;
																	var lineType = lineTypes[response.line_type]
																			|| response.line_type;

																	Swal
																			.fire({
																				title : '유효한 번호체계입니다. 아래 정보는 참고용으로 확인해주시고 이체 또는 정보를 제공 시 꼭 유의하세요!',
																				html : '해당 번호가 개통된 국가이름: '
																						+ countryName
																						+ '<br>'
																						+ '통신사: '
																						+ response.carrier
																						+ '<br>'
																						+ '유형: '
																						+ lineType,
																				icon : 'success'
																			});
																} else {
																	Swal
																			.fire({
																				title : '유효하지 않은 번호체계입니다',
																				text : '해당 번호는 주의깊게 확인하세요',
																				icon : 'error'
																			});
																}
															},
															error : function() {
																Swal
																		.fire({
																			title : '오류 발생',
																			text : '조회 중 오류가 발생했습니다.',
																			icon : 'error'
																		});
															}
														});
											});
						});
	</script>

</body>
</html>
