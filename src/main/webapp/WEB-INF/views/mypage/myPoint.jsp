<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

<title>마이페이지</title>

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

<style>
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
</style>
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							KB큽스쿨 <span> 포인트현황</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
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
							<strong style="font-weight: 900;"><c:out value="${userInfo.name}"/></strong>님의 포인트현황
						</div>
					</div>
				</div>
			</div>
			<!-- 내정보역역 Start -->
			<div class="checkout-billingform bg-light rounded p-lg-5 p-3 mt-5">
				<!-- 노란배경역역 -->
				<div class="woocommerce-cart-wrapper py-5">

					<h3>포인트 적립 및 사용현황</h3>
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
									<c:set var="accumulatedPoints" value="0" />
									<c:forEach var="point" items="${pointList}">
										<tr>
											<td style="text-align: center;"><fmt:formatDate
													value="${point.point_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td class="points-earned"><c:choose>
													<c:when test="${point.points_earned != 0}">
                                                        +<c:out
															value="${point.points_earned}" />
														<c:out value="(${point.point_reason})" />
													</c:when>
													<c:otherwise>
                                                        &nbsp;
                                                    </c:otherwise>
												</c:choose></td>
											<td class="points-used"><c:choose>
													<c:when test="${point.points_used != 0}">
                                                        -<c:out
															value="${point.points_used}" />
														<c:out value="(${point.usage_type})" />
													</c:when>
													<c:otherwise>
                                                        &nbsp;
                                                    </c:otherwise>
												</c:choose></td>
											<td class="total-points"><c:set var="accumulatedPoints"
													value="${accumulatedPoints + point.points_earned - point.points_used}" />
												<c:out value="${accumulatedPoints}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>


					<div class="button-container">
						<button class="btn btn-warning"
							onclick="location.href='${pageContext.request.contextPath}/couponshop'">쿠폰으로
							교환</button>
					</div>

					<div class="points-container">
						<div class="points-note">
							<p>※ 사고예방 체험, 교육 시뮬레이션 등을 통해 획득한 포인트 내용을 확인할 수 있습니다.</p>
							<p>※ 기타 문의는 고객센터(1588-9999)로 연락해주세요.</p>
							<p>※ 포인트 적립 및 사용현황은 최대 6개월 내역 조회 가능합니다.</p>
						</div>
					</div>
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


</body>
</html>
