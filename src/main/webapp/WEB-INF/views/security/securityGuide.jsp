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
<title>HelpPlus Charity Template</title>

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


<style type="text/css">
.separator {
	border-top: 2px solid #ddd;
	margin: 20px 0;
}

.card-margin {
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 20px;
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


	<!-- header start -->
	<%@ include file="/WEB-INF/views/header.jsp"%>





	<!-- Promo Area Start -->



	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background: none; background-position: initial;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">보안 강화 방법</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">메인</a></li>
								<li class="breadcrumb-item active" aria-current="page">보안
									강화 방법</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo Area End -->
	<section>

		<!-- Our Project Area Start -->
		<section class="project-area section-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-intro">
							<h2 class="section-title">
								유용한<span class="color">보안 어플</span>
							</h2>
							<p>다양한 위험으로부터 우리의 정보와 재산을 지켜주는데 도움 되는 어플리케이션들을 소개합니다. 지금 바로
								다운로드 받으세요!</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-sm-4 card-margin">
						<div class="single-project rounded-2 shadow">
							<figure class="project-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/secure/시티즌코난1.png"
									alt="">
							</figure>
							<div class="project-info p-lg-4 p-3">
								<h3>
									<a href="#">시티즌코난</a>
								</h3>
								<p>한국형 자연어 분석 기반 전화금융 사기 탐지기로 시민들의 핸드폰에 설치된 악성앱을 탐지해내는 앱입니다.
									일선 경찰관을 위한 보이스피싱 악성 앱 순간 탐지기(구 피시앙이즈 폴리스)로서 피싱아이즈와 함께 운영되며,
									안드로이드용으로 제공되며 아이폰은 피싱아이즈 다운로드를 권장합니다.</p>
								<button class="custom-btn"
									onclick="location.href='https://play.google.com/store/apps/details?id=com.infinigru.police.phishingeyes&pcampaignid=web_share'">링크
									연결</button>
							</div>
						</div>
						<!-- Single Project End -->
					</div>
					<!-- Single Cause End -->
					<div class="col-lg-4 col-sm-4 card-margin">
						<div class="single-project rounded-2 shadow">
							<figure class="project-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/secure/피싱아이즈.png"
									alt="">
							</figure>
							<div class="project-info p-lg-4 p-3">
								<h3>
									<a href="#">피싱아이즈</a>
								</h3>
								<p>경찰청 및 제휴된 금융사와 다양한 유형의 피싱에 대해 실시간적으로 공동 대응함으로써, 피싱범의 4대
									현혹 행위(악성 앱, 원격제어 앱, 문자, 카카오톡)와 5대 갈취 채널(APP, WEB, ARS, ATM,
									창구)로부터 보이스피싱을 예방하는 "보이스피싱 민관 공동 대응망 서비스" 입니다.</p>
								<button class="custom-btn"
									onclick="location.href='https://play.google.com/store/apps/details?id=com.infinigru.lite.phishingeyes&pcampaignid=web_share'">링크
									연결</button>
							</div>

						</div>
						<!-- Single Project End -->
					</div>
					<!-- Single Cause End -->
					<div class="col-lg-4 col-sm-4 card-margin">
						<div class="single-project rounded-2 shadow">
							<figure class="project-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/secure/폰가디언.png"
									alt="">
							</figure>
							<div class="project-info p-lg-4 p-3">
								<h3>
									<a href="#">폰가디언</a>
								</h3>
								<p>폰가디언이 제공하는 서비스입니다. ・암호화 VPN 기술로 인터넷 통신 보호 ・글로벌 개인정보 유출 및
									해킹방지 ・VPN 보안으로 간단하고 정확하게 해킹 차단 ・손 쉬운 온 오프(On-Off) 기능 ・공공 와이파이
									해킹, 개인정보 유출 위험을 VPN 보안으로 간단하게 방지</p>
								<button class="custom-btn"
									onclick="location.href='https://play.google.com/store/apps/details?id=com.distimo.phoneguardian&pcampaignid=web_share'">링크
									연결</button>
							</div>
						</div>
						<!-- Single Project End -->
					</div>
					<!-- Single Cause End -->
				</div>
			</div>
		</section>
		<!-- Our Project Area End -->
		<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="single-product">
							<div class="row mb-5">
								<div class="col-lg-5 col-sm-6">
									<div class="sp-thumb">
										<img
											src="${pageContext.request.contextPath}/resources/images/secure/1사이트.png"
											alt="">
									</div>
								</div>
								<div class="col-lg-7 col-sm-6">
									<div class="sp-details">
										<h2>금융감독원</h2>


										<div class="item-rating d-flex align-items-center">
											<a href="#">09 Reviews</a>
										</div>
										<p>
										<div>
											<strong>의심하고, 끊고, 확인하세요! 예방만이 최선의 대책입니다.</strong>
										</div>
										<div>피해신고(상담) : 경찰청(☎112)</div>
										<div>지급정지 : 금융감독원(☎1332)</div>
										<div>스팸 차단 : 한국인터넷진흥원(☎118)</div>
										</p>


										<div class="s-cart d-flex">
											<div class="input-content"></div>
											<div class="cart-cta ms-3">

												<button class="custom-btn"
													onclick="location.href='https://www.fss.or.kr/'">링크
													연결</button>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="row mb-5">

								<!-- 구분선 추가 -->
								<div class="separator"></div>
								<!-- 구분선 추가 -->


								<main class="main-content">
									<div class="container">
										<div class="row">
											<div class="col-lg-12">
												<div class="single-product">
													<div class="row mb-5">

														<div class="col-lg-7 col-sm-6">
															<div class="sp-details">
																<h2>명의도용방지서비스</h2>


																<div class="item-rating d-flex align-items-center">
																	<a href="#">09 Reviews</a>
																</div>
																<p>
																<div>
																	<strong>명의도용방지서비스란?</strong>
																</div>
																본인 명의로 다양한 방송통신서비스에 신규로 가입되었을 때 가입 사실을 문자메시지 및 이메일로 알려주고
																실시간으로 명의도용 여부를 확인할 수 있는 무료 서비스입니다.
																<div>
																	<strong>방송통신 서비스 가입 시 문자메시지 알림 서비스</strong>
																</div>
																나도 모르게 이동전화, 무선인터넷, 유선전화, 초고속인터넷, 인터넷전화, 유료방송에 신규 가입 또는
																명의변경 하였을 경우 언제, 어느 통신사에 가입했는지 본인 명의 이동전화 문자메시지로 가입 사실을
																통보합니다.

																<div>
																	<strong>명의도용 의심 시 대처방법</strong>
																</div>
																본 홈페이지 “통신민원조정센터 - 명의도용의심 처리안내” 서비스를 통해 통신사별 명의도용 신고처리
																과정을 확인할 수 있습니다.
																</p>


																<div class="s-cart d-flex">
																	<div class="input-content"></div>
																	<div class="cart-cta ms-3">

																		<button class="custom-btn"
																			onclick="location.href='https://www.msafer.or.kr/service/introduction.do'">링크
																			연결</button>
																	</div>
																</div>

															</div>
														</div>
														<div class="col-lg-5 col-sm-6">
															<div class="sp-thumb">
																<img
																	src="${pageContext.request.contextPath}/resources/images/secure/2사이트.png"
																	alt="">
															</div>
														</div>
													</div>
													<div class="row mb-5">



														<!-- 구분선 추가 -->
														<div class="separator"></div>
														<!-- 구분선 추가 -->

														<main class="main-content">
															<div class="container">
																<div class="row">
																	<div class="col-lg-12">
																		<div class="single-product">
																			<div class="row mb-5">
																				<div class="col-lg-5 col-sm-6">
																					<div class="sp-thumb">
																						<img
																							src="${pageContext.request.contextPath}/resources/images/secure/3사이트.png"
																							alt="">
																					</div>
																				</div>
																				<div class="col-lg-7 col-sm-6">
																					<div class="sp-details">
																						<h2>개인정보 포털</h2>


																						<div class="item-rating d-flex align-items-center">
																							<a href="#">09 Reviews</a>
																						</div>
																						<p>
																						<div>
																							<strong> 개인정보 분쟁조정 제도의 의의</strong>
																						</div>
																						개인정보로 인한 피해는 파급속도가 매우 빠르고 원상회복이 어렵다는 점에서 여타 종류의
																						피해와는 차별성을 갖기 때문에 이를 보다 신속하고 간편하게 구제할 수 있어야 합니다.
																						이러한 필요성에 의하여 도입된 개인정보 분쟁조정 제도는, 개인정보에 관한 분쟁이 발생하였을
																						때 비용이 많이 들고 시간이 오래 걸리는 소송제도의 대안으로서 비용 없이 신속하게 분쟁을
																						해결할 수 있는 조정을 통해 개인정보 침해를 당한 국민의 피해를 신속하고 원만하게
																						구제한다는데 그 의미가 있습니다. 이러한 개인정보 분쟁조정 제도는 그 신청 내용과 요건에
																						따라 아래와 같이 개인정보 분쟁조정과 집단분쟁조정으로 구분하여 조정절차를 달리 운영하고
																						있습니다.
																						</p>


																						<div class="s-cart d-flex">
																							<div class="input-content"></div>
																							<div class="cart-cta ms-3">

																								<button class="custom-btn"
																									onclick="location.href='https://www.privacy.go.kr/front/main/main.do'">링크
																									연결</button>
																							</div>
																						</div>

																					</div>
																				</div>
																			</div>
																			<div class="row mb-5">





																				<!-- 구분선 추가 -->
																				<div class="separator"></div>
																				<!-- 구분선 추가 -->



																				<main class="main-content">
																					<div class="container">
																						<div class="row">
																							<div class="col-lg-12">
																								<div class="single-product">
																									<div class="row mb-5">

																										<div class="col-lg-7 col-sm-6">
																											<div class="sp-details">
																												<h2>털린 내 정보 찾기 서비스</h2>

																												<div
																													class="item-rating d-flex align-items-center">
																													<a href="#">09 Reviews</a>
																												</div>
																												<p>
																												<div>
																													<strong>털린 내 정보 찾기 서비스란?</strong>
																												</div>
																												개인의 계정정보(아이디, 패스워드)가 명의도용・보이스피싱 등 각종 범죄에
																												악용되고 있어, 다크웹★등 음성화 사이트에서 내 계정정보가 유통되고 있는지
																												확인을 통해 2차 피해를 방지하기 위한 서비스입니다. 본 서비스는 사용자가
																												입력한 계정정보(아이디, 패스워드)를 암호화하여 단순 비교만을 수행하며, 평문
																												데이터를 저장 또는 보관하지 않습니다.

																												</p>


																												<div class="s-cart d-flex">
																													<div class="input-content"></div>
																													<div class="cart-cta ms-3">

																														<button class="custom-btn"
																															onclick="location.href='https://kidc.eprivacy.go.kr/'">링크
																															연결</button>
																													</div>
																												</div>

																											</div>
																										</div>
																										<div class="col-lg-5 col-sm-6">
																											<div class="sp-thumb">
																												<img
																													src="${pageContext.request.contextPath}/resources/images/secure/4사이트.png"
																													alt="">
																											</div>
																										</div>
																									</div>
	</section>





	<%-- <!-- Partner Area Start -->
	<section class="partner-area bg-cover section-padding"
		data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/partner/partner-bg.jpg');">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							Global <span class="color">Partner</span>
						</h2>
						<p>Our upcoming events is to help the helpless. assumenda
							delectus quaerat incidunt. Saepe, sed optio eum.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="partner-wrap owl-carousel">
						<div class="partner-name">
							<img
								src="${pageContext.request.contextPath}/resources/images/partner/pt1.png"
								alt="Help Image">
						</div>
						<div class="partner-name">
							<img
								src="${pageContext.request.contextPath}/resources/images/partner/pt2.png"
								alt="Help Image">
						</div>
						<div class="partner-name">
							<img
								src="${pageContext.request.contextPath}/resources/images/partner/pt3.png"
								alt="Help Image">
						</div>
						<div class="partner-name">
							<img
								src="${pageContext.request.contextPath}/resources/images/partner/pt4.png"
								alt="Help Image">
						</div>
						<div class="partner-name">
							<img
								src="${pageContext.request.contextPath}/resources/images/partner/pt5.png"
								alt="Help Image">
						</div>
						<div class="partner-name">
							<img
								src="${pageContext.request.contextPath}/resources/images/partner/pt6.png"
								alt="Help Image">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> --%>
	<!-- Partner Area End -->



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