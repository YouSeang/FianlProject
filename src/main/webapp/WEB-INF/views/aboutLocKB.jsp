<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

<!-- Template Title
    ==================================================================-->
<title>LocKB</title>

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

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<style>
/* Custom Styles */
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}

.ks-cboxtags li {
	margin-bottom: 10px;
	list-style: none;
}

.ks-cboxtags input[type="checkbox"] {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	position: relative;
}

.ks-cboxtags input[type="checkbox"]::before {
	content: "";
	display: block;
	width: 100%;
	height: 100%;
	background-color: white;
	border: 2px solid #000;
	position: absolute;
	top: 0;
	left: 0;
}

.ks-cboxtags input[type="checkbox"]:checked::before {
	background-color: #ffb200;
	border-color: black;
}

.ks-cboxtags input[type="checkbox"]:checked::after {
	content: "";
	display: block;
	width: 5px;
	height: 10px;
	border: solid black;
	border-width: 0 3px 3px 0;
	position: absolute;
	top: 5px;
	left: 9px;
	transform: rotate(45deg);
}

.ks-cboxtags label {
	font-size: 20px;
}

/* Add margin between checkbox section and footer */
.ftco-section {
	margin-bottom: 50px;
	margin-top: 50px;
}

/* Add margin between checkbox section and header */
.promo-area {
	margin-bottom: 50px;
}

.donation-form {
	background-color: #f8f9fa; /* 연한 회색 배경 */
	padding: 20px; /* 내부 여백 조정 */
	border-radius: 8px;
	width: 120%; /* 폭을 100%로 설정 */
	max-width: 1200px; /* 최대 폭 설정 (필요 시 조정 가능) */
	margin: 0 auto; /* 가운데 정렬 */
}

.card {
	margin-bottom: 15px;
	border-radius: 8px;
}

.card-body {
	display: flex;
	align-items: center;
}

.submit-btn {
	background-color: #ffb200;
	border: 2px solid black;
	color: black;
	font-size: 22px;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	text-align: center;
	width: 100%;
}

.submit-btn:hover {
	background-color: #ff9900;
}

.separator {
	border-top: 2px solid #ddd;
	margin: 20px 0;
}

.no-wrap {
	white-space: nowrap;
}

@font-face {
	font-family: '나눔스퀘어라운드OTF';
	src:
		url('${pageContext.request.contextPath}/resources/fonts/NANUMSQUAREROUNDB.TTF')
		format('TTF'),
		url('${pageContext.request.contextPath}/resources/fonts/NANUMSQUAREROUNDL.TTF')
		format('TTF');
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, h4, h5, p, a {
	font-family: '나눔스퀘어라운드OTF' !important;
}

.fa, .flaticon {
	font-family: 'Font Awesome 5 Free', 'Font Awesome 5 Brands',
		'Font Awesome 5 Solid', 'Font Awesome 5 Regular' !important;
	font-weight: 400; /* 기본적으로 normal 대신 400을 사용 */
	font-style: normal !important;
}

.icon-class {
	font-family: inherit !important;
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



	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/aboutbgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>LocKB</span> 소개
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
	<!-- Promo Area End -->

	<!-- Ourself Area Start -->
	<section class="ourself-area section-padding">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-sm-6">
					<div class="about-txt">
						<h3 class="section-title mb-4">
							<span class="color"> LocKB</span>는
						</h3>
						<p>"금융사기 예방 및 디지털 금융 보안 인식 제고"를 목표로, 금융 거래자에게 금융사기와 디지털 보안 위협에
							대한 경각심을 일깨우고, 올바른 금융 보안 인식을 가질 수 있는 것을 목표로 합니다.</p>
						<ul>
							<li>사용자는 다양한 금융사기 및 디지털 보안 위협에 대해 보다 깊이 있게 이해하게 되며,<br>
								이를 통해 금융 사기 예방에 대한 인식을 제고할 수 있다.
							</li>
							<li>올바른 금융 보안 관행을 실천함으로써,<br> 사용자들의 금융 보안 수준을 실질적으로 강화할
								수 있다.
							</li>
							<li>금융 사기 예방과 피해 최소화를 통해 사용자들의 경제적 안정성을 지원하고, <br>사회
								전체의 금융 사기 피해를 줄이는 데 기여한다.
							</li>
						</ul>

					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div class="ourself-gallery owl-carousel shadow">
						<div class="single-item">
							<figure>
								<img
									src="${pageContext.request.contextPath}/resources/images/incident/about3.png"
									alt="">
								<figcaption>보이스 피싱은 누구에게나 일어날 수 있습니다.</figcaption>
							</figure>
						</div>
						<!-- Single Item End -->
						
						<!-- Single Item End -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Ourself Area End -->

	<!-- Service Area Start -->
	<section class="service-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							<span class="color">LocKB</span>의 서비스
						</h2>
						<p>실제 같은 시뮬레이션과 체험 중심의 컨텐츠를 통해, <br>사용자들이 능동적으로 학습하는 것을 지향합니다.</p>
					</div>
				</div>
			</div>
			<div class="row g-4">
				<div class="col-lg-4 col-sm-4">
					<div class="service-item border rounded-2">
						<span class="flaticon-nature"></span>
						<h4>사고 예방</h4>
						<p>다양한 금융사기 유형을 체험할 수 있는 시뮬레이션을 제공하여 사용자가 실제 상황에서 사기를 예방할 수 있는
							능력을 기르도록 하며, 최근 사례와 사고 현황을 제공하여 사용자가 최신 금융 사고 및 사고 위협에 대한 인식을 높일
							수 있도록 한다.</p>
					</div>
				</div>
				<!-- Service Item End -->
				<div class="col-lg-4 col-sm-4">
					<div class="service-item border rounded-2">
						<span class="flaticon-technology"></span>
						<h4>금융 탐방</h4>
						<p>디지털 금융 거래 활성화를 위한 앱 시뮬레이션을 제공하여, 사용자가 금융 서비스를 안전하고 효율적으로
							활용할 수 있도록 돕는다. 또한, 재미있는 퀴즈를 통해 금융 상식을 강화하며 사용자들이 자발적으로 학습할 수 있는
							환경을 조성한다.</p>
					</div>
				</div>
				<!-- Service Item End -->
				<div class="col-lg-4 col-sm-4">
					<div class="service-item border rounded-2">
						<span class="flaticon-medical"></span>
						<h4>금융 보안</h4>
						<p>사용자 개인의 보안 상태를 점검하고 이를 시각화한 보안 점수를 제공하여, 자신의 금융 보안 상태에 대한 자가 진단 및
							개선을 유도한다. 또한, 신뢰할 수 있는 보안 솔루션 및 사이트 및 플랫폼 서비스를 추천하여 보안강화에 이바지한다.</p>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- Service Area End -->

	




	<!-- Footer Area Start -->
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
      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>

</html>
