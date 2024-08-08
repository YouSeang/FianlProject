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
	border-radius: 8px;
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

.promo-area {
	background:
		url('${pageContext.request.contextPath}/resources/images/promo-bg.jpg')
		no-repeat center center;
	background-size: cover;
	padding: 100px 0;
	color: #fff;
	text-align: center;
}

.promo-title {
	font-size: 2.5em;
	font-weight: bold;
}

.donation-form {
	padding: 30px;
}

.form-group label {
	font-weight: bold;
}

.form-group input {
	border-radius: 4px;
	padding: 10px;
	width: 100%;
	margin-bottom: 15px;
}

.form-group button {
	width: 100%;
	padding: 10px;
	background-color: #FFB200;
	border: none;
	border-radius: 4px;
	color: white;
	font-size: 1.2em;
}

.form-group button:hover {
	background-color: #031550;
}
</style>

</head>
<body>
	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp" %> 

	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>번호조회</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
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
					<div class="section-intro intro-full text-center">
						<h3 class="section-title mb-4">
							번호<span class="color">조회 </span>
						</h3>
						<p>잠깐! 피싱으로 생각되는 연락을 받았다면 유효한 번호여부를 조회 먼저 해보세요</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="bg-light donation-form rounded-3 shadow-sm">
						<div class="points-container">
							<div class="points-note">
								<p>※ +82 뒤에 조회하고자 하는 번호를 입력해주세요.</p>
								<p>※ 사기 이력에 대한 조회는 불가하며 해당 번호가 개통된 국가와 유형(모바일/유선 등)의
									결과만 조회됩니다.</p>
								<p>※ 해당 조회결과는 참고용으로만 사용해주세요.</p>
								<p>
									※ 사이버 사기피해 신고여부는 경찰청 홈페이지를 이용해주세요. <a
										href="https://www.police.go.kr/www/security/cyber/cyber04.jsp"
										target="_blank"> <br />경찰청 - 인터넷 사기 의심전화·계좌번호 조회 바로가기
									</a>
								</p>
							</div>
						</div>
						<br />
						<form id="lookupForm" method="get" class="form-group">
							<label for="phoneNumber">조회할 번호:</label> <input type="text"
								placeholder="+82012345678" id="phoneNumber" name="phoneNumber"
								required>
							<button type="submit">조회하기</button>
						</form>
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
																				title : '유효한 번호체계입니다.'
																						+ '<br/>'
																						+ '다만, 아래 정보는 참고용으로만 사용하시고'
																						+ '<br/>'
																						+ '거래 시에는 신중을 기하여주세요!',
																				html : '개통국가: '
																						+ countryName
																						+ '<br>'
																						/* + '통신사: '
																						+ response.carrier
																						+ '<br>' */
																						+ '유형: '
																						+ lineType,
																				icon : 'success'
																			});
																} else {
																	Swal
																			.fire({
																				title : '유효하지 않은 번호체계입니다',
																				text : '해당 번호는 주의깊게 확인하세요.',
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
