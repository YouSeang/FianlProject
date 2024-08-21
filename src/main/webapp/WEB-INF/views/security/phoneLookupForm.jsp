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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<!-- SweetAlert2 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

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

#phoneNumber {
	padding: 15px;
	border: 2px solid #FFB200;
	border-radius: 5px;
	font-size: 18px;
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

#phoneNumber:hover {
	border-color: #031550; /* 호버 시 테두리 색상 변경 */
	box-shadow: 0 0 8px rgba(3, 21, 80, 0.5); /* 호버 시 그림자 추가 */
}

#phoneNumber:focus {
	outline: none; /* 포커스 시 기본 아웃라인 제거 */
	border-color: #031550; /* 포커스 시 테두리 색상 변경 */
	box-shadow: 0 0 8px rgba(3, 21, 80, 0.5); /* 포커스 시 그림자 추가 */
}
</style>

</head>
<body>
	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- 배너영역 start -->

<section class="promo-area" data-stellar-background-ratio="0.5" 
			style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/securebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
	<div class="container">

			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>발신번호 조회</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item active" aria-current="page">LocKB</li>
								<li class="breadcrumb-item"><a href="index.html">:락비</a></li>
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
							발신번호<span class="color"> 조회 </span>
						</h3>
						<div
							style="display: flex; align-items: center; justify-content: center; text-align: center;">
							<img
								src="${pageContext.request.contextPath}/resources/images/incident/warn.jpg"
								alt="" style="width: 50px; height: 50px; margin-right: 15px;">
							<p style="margin: 0;">잠깐! 피싱으로 생각되는 연락을 받았다면 유효한 번호여부를 먼저 조회
								해보세요.</p>
						</div>


					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10 offset-lg-1">

					<div class="points-container" style="margin-top: 5px !important;">
						<div class="points-note "
							style="font-weight: bold; font-size: 17px;">
							<p style="color: red;">※ +82 뒤에 조회하고자 하는 번호를 입력해주세요.</p>
							<p>※ 사기 이력에 대한 조회는 불가하며 해당 번호가 개통된 국가와 유형(모바일/유선 등)의 결과만
								조회됩니다.</p>
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
						<label for="phoneNumber"> ▼ 조회할 번호 ▼</label> <input type="text"
							placeholder="+82012345678" id="phoneNumber" name="phoneNumber"
							required
							style="margin-bottom: 10px; padding: 15px; border: 2px solid #FFB200; border-radius: 20px; font-size: 18px; transition: border-color 0.3s ease, box-shadow 0.3s ease;">
						<button type="submit"
							style="margin-top: 15px; border-radius: 10px; font-size: 25px;">조회하기</button>
					</form>

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
																						+ '다만, 아래 정보는 참고용이며,'
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
