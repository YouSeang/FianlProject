<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

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
	text-align: center;
}

.table th {
	background-color: #f8f9fa;
	font-weight: bold;
}

.table th, .table td {
	width: 25%; /* 각 열의 너비를 동일하게 설정 */
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
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							KB큽스쿨 <span> 쿠폰현황</span>
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

	<!-- 내 쿠폰영역 start -->
	<main class="main-content checkout-content">
		<div class="container">
			<div class="row g-5 mb-4">
				<div class="col-lg-6"></div>
				<div class="col-lg-5 offset-lg-1">
					<div class="checkout-info">
						<div class="lead" style="margin-left: 250px;">
							<strong style="font-weight: 900;"><c:out
									value="${userInfo.name}" /></strong>님의 쿠폰현황
						</div>
					</div>
				</div>
			</div>
			<div class="checkout-billingform bg-light rounded p-lg-5 p-3 mt-5">
				<div class="woocommerce-cart-wrapper py-5">
				<h3>쿠폰 현황</h3>
					<div class="points-summary">
						<table class="table">
							<thead>
								<tr>
									<th>발급 날짜</th>
									<th>쿠폰 종류</th>
									<th>사용현황</th>
									<th>재발송</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="coupon" items="${couponList}">
									<tr>
										<td><fmt:formatDate value="${coupon.issue_date}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><c:out value="${coupon.coupon_type}" /></td>
										<td><c:choose>
												<c:when test="${!coupon.is_used}">미사용</c:when>
												<c:otherwise>사용됨</c:otherwise>
											</c:choose></td>
										<td><c:choose>
												<c:when test="${!coupon.is_used}">
													<button class="btn btn-warning"
														onclick="openResendWindow('${coupon.coupon_id}')">발송</button>
												</c:when>
												<c:otherwise>
                                                    &nbsp;
                                                </c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="points-note">
						<ul>
							<li>쿠폰 발행 및 사용 현황을 확인하실 수 있습니다.</li>
							<li>미사용 쿠폰은 재발송이 가능합니다.</li>
							<li>미사용 쿠폰은 재발송이 가능합니다.</li>
							<li>기타 문의는 고객센터(1588-9999)로 연락해주세요.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- 쿠폰영역 end -->

	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript -->
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/custom.js"/>"></script>

	<script>
		function openResendWindow(couponId) {
			const url = "${pageContext.request.contextPath}/resendCouponForm?couponId="
					+ couponId;
			window.open(url, "resendCouponWindow", "width=600,height=400");
		}
	</script>
	      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>
</html>
