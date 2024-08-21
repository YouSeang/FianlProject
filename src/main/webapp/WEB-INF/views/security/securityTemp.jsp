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

body, h1, h2, h3, h4, h5, p, a {
	font-family: 'Goorm Sans' !important;
}

.ks-cboxtags li {
	margin-bottom: 10px;
	list-style: none;
}

.ks-cboxtags input[type="checkbox"] {
    width: 25px;
    height: 25px;
    margin-right: 11px;
    position: relative;
    flex-shrink: 0; /* 추가: 체크박스의 크기를 고정 */
    display: inline-block; /* 추가: 체크박스가 인라인 블록 요소로 처리되도록 설정 */
    vertical-align: middle; /* 추가: 텍스트와의 수직 정렬 .. */
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
	color: white;
	font-size: 22px;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 12px;
	cursor: pointer;
	text-align: center;
	width: 100%;
	border: none;
	outline: none;
	box-shadow: 3px 3px 8px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
}

.submit-btn:hover {
	background-color: #ff9900;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.4); /* Hover 시 더 진한 그림자 */
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

.fa, .flaticon {
	font-family: 'Font Awesome 5 Free', 'Font Awesome 5 Brands',
		'Font Awesome 5 Solid', 'Font Awesome 5 Regular' !important;
	font-weight: 400; /* 기본적으로 normal 대신 400을 사용 */
	font-style: normal !important;
}

.icon-class {
	font-family: inherit !important;
}

.title1 {
	font-size: 33px !important;
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
style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/securebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>나의</span> 보안 점수
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

	<!-- Upcoming Event Area Start -->
	<section class="upcoming-events section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							나의 <span> 정보 보안 온도</span>
						</h2>
						<div class="text-center">
							<h4 class="justify-content-center">
								현재 실천하고 있는 것을 체크하고,<br> 확인하기 버튼을 눌러보세요.
							</h4>
							<h5 class="justify-content-center" style="color: #ffb200;">하루에
								한 번, 보안수준 점검하고 이벤트 당첨을 확인하세요!</h5>
						</div>
					</div>
				</div>
			</div>
			<!-- Checkbox Section Start -->
			<section class="ftco-section">
				<div class="container">
					<div class="row"></div>
					<div class="row justify-content-center">
						<div class="col-md-6">
							<div class="wrap w-100">


								<form
									action="${pageContext.request.contextPath}/submitChecklist"
									method="post">

									<h3 class="title1">보안 관련 기능 분야</h3>
									<ul class="ks-cboxtags p-0 m-0">
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category1-1" name="category1[]"
														value="1"> <label for="category1-1" class="mb-0">스마트폰에
														암호/패턴을 설정해 놓았다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category1-2" name="category1[]"
														value="1"> <label for="category1-2" class="mb-0">스미싱
														문자 유포에 유의해 스미싱 차단 앱을 설치하였다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category1-3" name="category1[]"
														value="1"> <label for="category1-3" class="mb-0">스팸메세지
														차단기능을 설정해 놓았다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category1-4" name="category1[]"
														value="1"> <label for="category1-4" class="mb-0">스마트폰
														앱의 권한은 필요한 것만 허용을 해두었다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category1-5" name="category1[]"
														value="1"> <label for="category1-5" class="mb-0">소프트웨어를
														항상 최신 버전으로 업데이트 해둔다.</label>
												</div>
											</div>
										</li>
										<div class="separator"></div>
										<h3 class="title1">금융 보안 분야</h3>
										<!-- 구분선 추가 -->
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category2-1" name="category2[]"
														value="1"> <label for="category2-1" class="mb-0">은행
														어플에서 제공하는 입출금 알림서비스를 등록해 놓았다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category2-2" name="category2[]"
														value="1"> <label for="category2-2" class="mb-0">보안카드
														번호 및 중요 개인정보가 휴대폰 사진첩에 저장 되어 있지 않다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category2-3" name="category2[]"
														value="1"> <label for="category2-3" class="mb-0">금융사
														어플 비밀번호 혹은 패턴을 주기적으로 변경하고 있다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category2-4" name="category2[]"
														value="1"> <label for="category2-4" class="mb-0">계좌
														비밀번호를 주기적으로 변경하고 있다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category2-5" name="category2[]"
														value="1"> <label for="category2-5" class="mb-0">택배
														송장 정보는 떼어내고 폐기한다.</label>
												</div>
											</div>
										</li>

										<div class="separator"></div>
										<!-- 구분선 추가 -->
										<h3 class="title1">모바일 사용 습관 분야</h3>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category3-1" name="category3[]"
														value="1"> <label for="category3-1" class="mb-0">웹사이트
														등에서 다운로드 받는 각종 프로그램의 출처 등 관련 정보를 확인한다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category3-2" name="category3[]"
														value="1"> <label for="category3-2" class="mb-0">공용
														컴퓨터 등에서 업무 처리 후 계정 로그아웃을 생활화 한다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category3-3" name="category3[]"
														value="1"> <label for="category3-3" class="mb-0">기관에서
														전송된 문자의 링크를 확인하지 않고는 클릭하지 않는다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category3-4" name="category3[]"
														value="1"> <label for="category3-4" class="mb-0">사용하고
														있는 이메일 계정에 스팸 방지 기능을 설정해 두었다.</label>
												</div>
											</div>
										</li>
										<li>
											<div class="card">
												<div class="card-body">
													<input type="checkbox" id="category3-5" name="category3[]"
														value="1"> <label for="category3-5" class="mb-0">웹
														사이트 등에서 다운로드받는 프로그램들의 출처 등 관련 정보를 확인한다.</label>
												</div>
											</div>
										</li>
									</ul>
									<div class="text-center mt-4">
										<button type="submit" class="submit-btn">보안온도 확인하기</button>
									</div>

								</form>

							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Checkbox Section End -->
		</div>
	</section>
	<!-- Upcoming Event Area End -->



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
