<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.soft.study.dto.MypageDto"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">

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

.points-container {
	padding: 20px;
	border: 1px solid #dee2e6;
	background-color: #fff;
	margin-top: 20px;
}

.points-container h3 {
	margin-bottom: 20px;
}

.table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 1rem;
}

.table th, .table td {
	padding: 0.75rem;
	vertical-align: top;
	border: 1px solid #dee2e6;
}

.table th {
	background-color: #f8f9fa;
	font-weight: bold;
	text-align: center;
}

.table th, .table td {
	width: 25%; /* 각 열의 너비를 동일하게 설정 */
}

.table td.points-earned {
	color: blue; /* 글씨색 파란색 */
}

.table td.points-used {
	color: red; /* 글씨색 빨간색 */
}

.table td.total-points {
	font-weight: bold; /* 글씨 bold 처리 */
	/* text-align: center; */
}

.points-summary {
	margin-top: 20px;
}

.button-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
}

/* .points-note {
	font-size: 0.9em;
	color: #555;
}

.points-note ul li {
	margin-bottom: 5px;
} */
.coupon-info {
	font-size: 1.2rem; /* 글씨 크기 조정 */
	line-height: 1.5; /* 줄 간격 조정 */
	color: #333; /* 글씨 색상 */
	margin-top: 10px; /* 상단 여백 */
	margin-bottom: 10px; /* 하단 여백 */
	padding: 10px; /* 안쪽 여백 */
	border: 1px solid #ddd; /* 테두리 */
	border-radius: 5px; /* 테두리 둥글게 */
	background-color: #f9f9f9; /* 배경색 */
}

/* 버튼 스타일 */
.btn-primary, .btn-secondary {
	padding: 5px;
	border-radius: 10px;
	font-size: 18px;
	width: 130px;
}

.btn-primary {
	background-color: #FFB200;
	border: none;
	color: white;
}

.btn-primary:hover {
	background-color: #031550;
	color: white;
}

.btn-secondary {
	background-color: #6c757d;
	border: none;
	color: white;
}

.btn-secondary:hover {
	background-color: #5a6268;
	color: white;
}
.month-navigation {
	text-align: center; /* 가운데 정렬 */
	margin: 20px 0; /* 위아래 여백 추가 */
	display: flex;
	justify-content: center;
	align-items: center;
}

.month-navigation button {
	background-color: #FFB200; /* 버튼 배경색 */
	border: none; /* 테두리 제거 */
	color: white; /* 글자색 */
	padding: 10px 15px; /* 버튼 내부 여백 */
	font-size: 18px; /* 글자 크기 */
	border-radius: 50%; /* 동그란 버튼 */
	cursor: pointer; /* 마우스 커서 변경 */
	margin: 0 15px; /* 좌우 간격 */
	transition: background-color 0.3s ease; /* 호버 애니메이션 */
}

.month-navigation button:hover {
	background-color: #031550; /* 호버 시 배경색 변경 */
}

.month-navigation #selectedMonth {
	font-size: 24px; /* 날짜 글자 크기 */
	font-weight: bold; /* 날짜 글자 굵기 */
	color: #333; /* 날짜 글자색 */
	margin: 0 20px; /* 좌우 간격 */
}
</style>

<script>
	function navigateMonth(offset) {
		const selectedMonthElement = document.getElementById("selectedMonth");
		let selectedMonth = new Date(selectedMonthElement.innerText + "-01");

		selectedMonth.setMonth(selectedMonth.getMonth() + offset);

		const year = selectedMonth.getFullYear();
		const month = ("0" + (selectedMonth.getMonth() + 1)).slice(-2);

		const newDate = year + "-" + month;

		// 새로운 날짜로 페이지를 리로드
		window.location.href = "${pageContext.request.contextPath}/mypoint?selectedDate="
				+ newDate;
	}
</script>
</head>

<body>

	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/mypagebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							LocKB <span> 포인트</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">

								<li class="breadcrumb-item active" aria-current="page">LocKB</li>
								<li class="breadcrumb-item"><a>:락비</a></li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영역 End -->

	<!-- 내포인트영역 start -->
	<main class="main-content checkout-content">
		<div class="container">
			<div class="row g-5 mb-4">
				<div class="col-lg-6"></div>
				<div class="col-lg-5 offset-lg-1">
					<div class="checkout-info">
						<div class="lead" style="margin-left: 250px;">
							<strong style="font-weight: 900;"><c:out
									value="${userInfo.name}" /></strong>님의 포인트현황
						</div>
					</div>
				</div>
			</div>
			<div class="checkout-billingform bg-light rounded p-lg-5 p-3 mt-5">
				<div class="woocommerce-cart-wrapper py-5">
					<h3>포인트 적립 및 사용현황</h3>
					<div class="month-navigation">
						<button onclick="navigateMonth(-1)">&lt;</button>
						<span id="selectedMonth">${selectedDate}</span>
						<button onclick="navigateMonth(1)">&gt;</button>
					</div>
					<div class="points-note">
						<div class="points-summary">
							<table class="table">
								<thead>
									<tr>
										<th>날짜</th>
										<th>적립</th>
										<th>사용</th>
										<th>총 포인트</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="point" items="${pointList}">
										<tr>
											<td style="text-align: center;"><fmt:formatDate
													value="${point.point_time}" pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td class="points-earned"><c:choose>
													<c:when test="${point.points_earned != 0}">
                        +<c:out value="${point.points_earned}" />
														<c:out value="(${point.point_reason})" />
													</c:when>
													<c:otherwise>&nbsp;</c:otherwise>
												</c:choose></td>
											<td class="points-used"><c:choose>
													<c:when test="${point.points_used != 0}">
                        -<c:out value="${point.points_used}" />
														<c:out value="(${point.usage_type})" />
													</c:when>
													<c:otherwise>&nbsp;</c:otherwise>
												</c:choose></td>
											<td class="total-points"><c:out
													value="${point.total_points}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="button-container">
							<button class="btn btn-primary"
							onclick="location.href='${pageContext.request.contextPath}/couponshop'">쿠폰으로
							교환</button>
					</div>
					<div class="coupon-info mb-4">
						ㅇ사고예방 체험, 교육 시뮬레이션 등을 통해 획득한 포인트 내역 및 포인트 사용 내역을 확인할 수 있습니다.<br>
						ㅇ기타 상세 문의사항이 있으신 경우에는 고객센터(1588-9999)로 문의해주세요.
					</div>


					<!-- <div class="points-note">
							<p>※ 사고예방 체험, 교육 시뮬레이션 등을 통해 획득한 포인트 내역 및 포인트 사용 내역을 확인할 수
								있습니다.</p>
							<p>※ 기타 문의는 고객센터(1588-9999)로 연락해주세요.</p>
						</div> -->
				</div>
			</div>
		</div>
	</main>
	<!-- 내포인트영역 end -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!--Javascript======================================================== -->

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
