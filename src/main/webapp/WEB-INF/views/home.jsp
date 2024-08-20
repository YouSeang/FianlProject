<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="shortcut icon" href="images/components/favicon.ico">

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
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<!-- <link rel="preload" href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" as="style" crossorigin="anonymous" />

<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" /> 
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
 -->
 
 <link rel="stylesheet" href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" crossorigin="anonymous" />
 
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

.row {
	display: flex;
	justify-content: space-between; /* 요소들 사이에 동일한 간격 추가 */
}

.single-inspiration {
	flex: 0 0 calc(33.333% - 10px); /* 요소의 너비를 조정하여 3개가 딱 맞게 배치되도록 함 */
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 20px;
	padding: 20px;
	border: 1px solid #e0e0e0; /* 회색 테두리 추가 */
	border-radius: 8px; /* 모서리를 둥글게 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
	background-color: #fff; /* 배경색을 흰색으로 설정 */
}

.single-project {
	flex: 0 0 calc(33.333% - 20px); /* 요소의 너비를 조정하여 3개가 딱 맞게 배치되도록 함 */
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 20px; /* 각 카드 아래에 20px의 여백 추가 */
}
</style>

<!-- Style css
    ==================================================================== -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/sass/style.scss">
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


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
	<%@ include file="header0802.jsp"%>

	<!-- Banner Area Start -->
	<section class="banner-area">
		<div class="banner-2 owl-carousel">
			<div class="single-banner"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/배너1.png')">
				<div class="container">
					<div class="banner-info">
						<h1 class="banner-title text-white" style="color: white;">
							보이스피싱 시뮬레이션으로<br> <span>금융사고를 </span><br />예방해보세요
						</h1>
						<p>실제같은 체험을 통해 사고를 예방할 수 있어요</p>
						<div class="banner-btn">
							<a href="#" class="custom-btn"
								onclick="openVoicePhishingWindow()">체험하러 가기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Single Banner End -->
			<div class="single-banner"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/배너2.jpg')">
				<div class="container">
					<div class="banner-info">
						<h1 class="banner-title text-white" style="color: white;">
							KB금융을 <span><br />지금바로</span><br /> 체험해보세요
						</h1>
						<p>LocKB와 함께라면 뱅킹도 더이상 어렵지 않아요</p>
						<div class="banner-btn">
							<a href="/study/edu/sbjoin" class="custom-btn">체험하러가기</a>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- Banner Area End -->

	<!-- 큽스쿨소개영역 Start -->
	<section class="inspiration-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<p>
						<h1>
							<strong>LocKB에서 할 수 있어요!</strong>
						</h1>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-4">
					<div class="single-inspiration">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/mis1.png"
							alt=""></span>
						<h3>사고예방 시뮬레이션</h3>
						<p>
							메신저피싱, 보이스피싱을 예방하기 위해<br> 실제 사례와 유사한 시뮬레이션을 해볼 수 있어요
						</p>
						<a href="#">자세히보기 <i class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
				<!-- Single Mission End -->
				<div class="col-lg-4 col-sm-4">
					<div class="single-inspiration">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/mis2.png"
							alt=""></span>
						<h3>디지털금융 교육</h3>
						<p>
							어렵게만 느껴졌던 스타뱅킹, 인터넷뱅킹의 <br>다양한 거래를 체험해볼 수 있어요.
						</p>
						<a href="#">자세히보기 <i class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
				<!-- Single Mission End -->
				<div class="col-lg-4 col-sm-4">
					<div class="single-inspiration">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/mis3.png"
							alt=""></span>
						<h3>나의 보안점수</h3>
						<p>
							보안을 강화할 수 있는 방법을 확인하고 <br>적용해볼 수 있어요. 나의 보안점수까지 챙겨보세요!
						</p>
						<a href="#">자세히보기 <i class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
				<!-- Single Mission End -->
			</div>
		</div>
	</section>
	<!-- 큽스쿨소개영역 End -->

	<!-- 교육영상영역 Start -->
	<div class="feature-cause-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-sm-6">
					<div class="f-cause-txt">
						<h2 class="section-title">
							<strong> LocKB <span>추천영상</span>
							</strong>
						</h2>
						<p>
							<strong>LocKB에서 웃음과 재미, 금융지식까지 선물해드려요.</strong>
						</p>
						<a href="#" class="custom-btn">자세히보기 <i
							class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6">
					<div class="f-cause-wrap owl-carousel">
						<div class="f-cause-img">
							<a href="#"><img class="img-rounded"
								src="${pageContext.request.contextPath}/resources/images/causes/mainyoutube1.png"
								alt=""></a>
						</div>
						<div class="f-cause-img">
							<a href="#"><img class="img-rounded"
								src="${pageContext.request.contextPath}/resources/images/causes/mainyoutube.png"
								alt=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 교육영상영역 End -->

	<!-- 카드공지영역 Start -->
	<section class="project-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							<strong> LocKB <span class="color">알림마당</span>
							</strong>
						</h2>
						<p>
							<strong>짧은 카드뉴스로 슬기로운 금융생활을!</strong>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-4">
					<div class="single-project rounded-2 shadow">
						<figure class="project-thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/causes/신용점수.png"
								alt="">
						</figure>
						<div class="project-info p-lg-4 p-3">
							<h3>
								<a href="#">사회초년생을 위한 신용 관리방법</a>
							</h3>
							<p>
								1. 갚을 능력 고려하여 채무 규모 설정하기<br /> 2. 인터넷/전화 대출은 신중하게 결정하기<br />
								3. 소액이라도 절대 연체하지 않기<br /> 4. 주거래 금융회사를 정하여 이용하기
							</p>
							<!-- <a href="#" class="custom-btn mt-3">View Project</a> -->
						</div>
					</div>
					<!-- Single Project End -->
				</div>
				<!-- Single Cause End -->
				<div class="col-lg-4 col-sm-4">
					<div class="single-project rounded-2 shadow">
						<figure class="project-thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/causes/예적금.png"
								alt="">
						</figure>
						<div class="project-info p-lg-4 p-3">
							<h3>
								<a href="#">예/적금 가입 전 알아두세요!</a>
							</h3>
							<p>
								1. 예금자보호제도 확인하기<br /> 2. 금융상품 한눈에 서비스로 비교해보기<br /> 3. 가입가능한 특판
								예/적금 확인하기<br /> 4. 만기라면 잊지말고 재예치하기
							</p>
							<!-- <a href="#" class="custom-btn mt-3">View Project</a> -->
						</div>
					</div>
					<!-- Single Project End -->
				</div>
				<!-- Single Cause End -->
				<div class="col-lg-4 col-sm-4">
					<div class="single-project rounded-2 shadow">
						<figure class="project-thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/causes/착오송금2.png"
								alt="">
						</figure>
						<div class="project-info p-lg-4 p-3">
							<h3>
								<a href="#">실수로 돈을 잘못송금했다면?</a>
							</h3>
							<p>
								1. 착오송금반환지원제도 이용하기<br /> - 신청대상은 최근 1년 이내 발생한 <br />5만 원 이상
								5천만 원 이하 착오송금 건.<br /> - 상세내용은 예금보험공사에서 확인하기
							</p>
							<!-- <a href="#" class="custom-btn mt-3">View Project</a> -->
						</div>
					</div>
					<!-- Single Project End -->
				</div>
				<!-- Single Cause End -->
			</div>
		</div>
	</section>
	<!-- 카드공지영역 End -->

	<!-- 팀소개 영역 Start -->
	<section class="team-area section-padding"
		data-stellar-background-ratio=".3"
		style="background: none; background-position: initial;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							<strong> 홈페이지 <span class="color">담당자</span>
							</strong>
						</h2>
						<p>
							<strong> LocKB를 만들어가고 있습니다. <br />고객님들의 안전한 금융생활을 위해 더욱
								노력하겠습니다.
							</strong>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="team-wrap owl-carousel">
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/박소미.png"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">박소미</a>
								</h4>
								<small>팀장</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/최은숙.png"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">최은숙</a>
								</h4>
								<small>부팀장</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/이슬기.png"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">이슬기</a>
								</h4>
								<small>팀원</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/유세앙.png"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">유세앙</a>
								</h4>
								<small>팀원</small>
							</div>
						</div>
						<!-- Team Member End -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 팀소개영역 End -->



	<%@ include file="footer.jsp"%>

	<!-- JavaScript Libraries
    ======================================================== -->
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

  	<%@ include file="chatbot.jsp"%>      



</body>

</html>
