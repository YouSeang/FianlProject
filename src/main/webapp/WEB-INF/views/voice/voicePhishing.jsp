<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html lang="en">

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

<script type="text/javascript">
function openVoicePhishingWindow() {
    var width = 1300;
    var height = 650;

    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var left = (window.innerWidth / 2) - (width / 2);
    var top = (window.innerHeight / 2) - (height / 2);

    // 새로운 창을 가운데에 띄우기
    window.open('${pageContext.request.contextPath}/voice/newVoicePhishing', '_blank', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
}
</script>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>


	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>


	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/securebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>보이스 피싱</span> 시뮬레이션
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">voice
									phishing</li>
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
							보이스 피싱<span class="color"> 시뮬레이션 </span>
						</h3>
						<p>실제 보이스피싱 범인과의 통화를 각색한 시뮬레이션입니다. 음성인식을 통해 가상의 피해자가 되어
							대답하면서, 보이스피싱 범죄의 주요 시나리오 흐름에 대해 습득하는 시간을 가져보세요.</p>
						<ul>
							<li>가상의 피해자가 되어 범인의 심리와 시나리오를 파악해 봅시다.</li>
							<li>시뮬레이션 체험 종료시 50포인트 지급됩니다.</li>
							<li>포인트는 하루에 한번만 지급됩니다.</li>
						</ul>
						<a href="#" class="custom-btn" onclick="openVoicePhishingWindow()">체험하러
							가기</a>
					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div class="ourself-gallery owl-carousel shadow">
						<div class="single-item">
							<figure>
								<img
									src="${pageContext.request.contextPath}/resources/images/incident/voiceIntro.jpg"
									alt="">
								<figcaption>보이스피싱 범죄는 나날이 고도화 되고 있습니다.</figcaption>
							</figure>
						</div>
						<!-- Single Item End -->
						<%-- <div class="single-item">
                            <figure>
                                <img src="${pageContext.request.contextPath}/resources/images/about-us/about-us2.jpg" alt="">
                                <figcaption>Education Proggrame is running smoothly.</figcaption>
                            </figure>
                        </div> <!-- Single Item End -->
                        <div class="single-item">
                            <figure>
                                <img src="${pageContext.request.contextPath}/resources/images/about-us/about-us3.jpg" alt="">
                                <figcaption>Our Helping Hand spreeding quickly.</figcaption>
                            </figure>
                        </div> <!-- Single Item End --> --%>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Ourself Area End -->


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
      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>

</html>