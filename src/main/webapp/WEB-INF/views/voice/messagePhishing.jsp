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
<title>메신저피싱</title>

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

<!-- Theme CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function openMessagePhishingWindow() {
    var width = 900; // 모바일 화면 너비 (예: 375px)
    var height = 667; // 모바일 화면 높이 (예: 667px)

    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var left = (window.innerWidth / 2) - (width / 2);
    var top = (window.innerHeight / 2) - (height / 2);

    // 새로운 창을 가운데에 띄우기
    window.open('${pageContext.request.contextPath}/voice/newMessagePhishing', '_blank', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top + ',scrollbars=yes');
}
</script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>


	<!-- 배너영역 Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>스미싱</span> 시뮬레이션
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">smishing</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영억 End -->

	<!-- 시뮬레이션 영역start -->
	<section class="ourself-area section-padding">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-sm-6">
					<div class="about-txt">
						<h3 class="section-title mb-4">
							메신저피싱<span class="color"> 시뮬레이션 </span>
						</h3>
						<p>We are a non profit team. We are starting Help at vary
							begining of 1900s. Quibusdam quidem alias saepe vero doloribus
							consequatur quis nobis molestiae fugit vel quae sapiente.</p>
						<ul>
							<li>Quibusdam quidem alias saepe vero doloribus consequatur</li>
							<li>Sit amet consectetur adipisicing elit. Ea, voluptatem!</li>
							<li>Quibusdam quidem alias saepe vero doloribus consequatur</li>
						</ul>
						<a href="#" class="custom-btn"
							onclick="openMessagePhishingWindow()">체험하러 가기</a>
					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div
						class="ourself-gallery owl-carousel shadow owl-loaded owl-drag">

						<!-- Single Item End -->

						<div class="owl-stage-outer">
							<div class="owl-stage"
								style="transform: translate3d(-1072px, 0px, 0px); transition: all 0s ease 0s; width: 2680px;">
								<div class="owl-item cloned" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
								<div class="owl-item cloned" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
								<div class="owl-item active" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
								<div class="owl-item cloned" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
								<div class="owl-item cloned" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
							</div>
						</div>
						<div class="owl-nav disabled">
							<div class="owl-prev">
								<i class="fa fa-angle-left"></i>
							</div>
							<div class="owl-next">
								<i class="fa fa-angle-right"></i>
							</div>
						</div>
						<div class="owl-dots disabled"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 시뮬레이션영역 end -->

</body>
</html>
