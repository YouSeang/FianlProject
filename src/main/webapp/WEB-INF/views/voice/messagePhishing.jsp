<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">
<title>스미싱</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function openMessagePhishingWindow() {
    var width = 900;
    var height = 750;
    var left = (window.innerWidth / 2) - (width / 2);
    var top = (window.innerHeight / 2) - (height / 2);
    console.log("Opening new window at: ", left, top);
    window.open('${pageContext.request.contextPath}/voice/newMessagePhishing', '_blank', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top + ',scrollbars=yes');
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>메신저피싱</span> 시뮬레이션
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

	<section class="ourself-area section-padding">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-sm-6">
					<div class="about-txt">
						<h3 class="section-title mb-4">
							메신저피싱<span class="color"> 시뮬레이션 </span>
						</h3>
						<h2>메신저피싱이란?</h2>
						<p>주로 문자메시지나 카카오톡 등 모바일 메신저를 통해 이루어지는 범죄의 일종으로 피해자를 기망 또는 협박하여 개인정보 및 금융거래 정보를 요구하거나 피해자의 금전을 이체하도록 하는 수법입니다.</p>
						<ul>
							<li>지인을 사칭한 메신저피싱에 유의하세요</li>
							<li>로그인 후 체험하시면 포인트가 지급되며, 하루에 한 번만 지급됩니다.</li>
						</ul>
						<a href="#" class="custom-btn"
							onclick="openMessagePhishingWindow()">체험하러 가기</a>
					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div
						class="ourself-gallery owl-carousel shadow owl-loaded owl-drag">
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
</body>
</html>
