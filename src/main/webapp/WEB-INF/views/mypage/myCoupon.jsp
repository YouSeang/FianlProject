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
	href="${pageContext.request.contextPath}/resources/css/style.css">
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

.table {
	width: 100%; /* 테이블이 화면에 꽉 차게 설정 */
	border-collapse: collapse;
	margin-bottom: 1rem;
	background-color: transparent;
}

.table th, .table td {
	padding: 1rem;
	vertical-align: middle;
	border: 1px solid #dee2e6;
	text-align: center;
}

.table th {
	background-color: #f8f9fa;
	font-weight: bold;
}

.points-summary {
	margin-top: 20px;
	width: 100%; /* 포인트 컨테이너가 꽉 차게 설정 */
}

.button-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
}

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

/* .points-note {
	font-size: 0.9em;
	color: #555;
}
	
.points-note ul li {
	margin-bottom: 5px;
} */
.tab-menu {
	display: flex;
	justify-content: flex-end; /* 우측 정렬 */
	margin-bottom: 20px;
	padding-right: 15px; /* 우측 여백 추가 */
}

.tab-menu a {
	padding: 10px 20px;
	cursor: pointer;
	text-decoration: none;
	color: #031550;
	margin-left: 15px;
	border-bottom: 2px solid transparent;
}

.tab-menu a.active {
	font-weight: bold;
	border-bottom: 2px solid #031550;
}

.coupon-table {
	display: none;
}

.coupon-table.active {
	display: table;
	width: 100%; /* 테이블이 화면에 꽉 차게 설정 */
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

.btn-primary, .btn-secondary {
	padding: 5px;
	border-radius: 10px;
	font-size: 18px;
	width: 130px;
}

.btn-primary {
	padding: 4px; /* padding을 조금 더 줄임 */
	font-size: 16px; /* 폰트 크기를 조금 더 줄임 */
	width: 120px; /* 너비를 조금 더 줄임 */
	background-color: #FFB200;
	border: none;
	color: white;
	transition: background-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #031550;
	color: white;
}

.btn-secondary {
	background-color: #6c757d;
	border: none;
	color: white;
	transition: background-color 0.3s ease;
}

.btn-secondary:hover {
	background-color: #5a6268;
	color: white;
}



</style>
</head>
<body>
	<!-- Preloader -->
	
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/mypagebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							LocKB <span> 쿠폰현황</span> 
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
					<div class="tab-menu">
						<a href="javascript:void(0);" class="active"
							onclick="showTab('all', event)">전체</a> <a
							href="javascript:void(0);" onclick="showTab('usable', event)">사용가능
							쿠폰</a> <a href="javascript:void(0);" onclick="showTab('used', event)">사용완료
							쿠폰</a>
					</div>

					<div class="points-summary">
						<div id="all" class="coupon-table active">
							<h3>전체 쿠폰</h3>
							<table class="table">
								<thead>
									<tr>
										<th>발급 날짜</th>
										<th>쿠폰 종류</th>
										<th>사용현황</th>
										<th style="width: 230px;">재발송</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="coupon" items="${couponList}">
										<tr>
											<td><fmt:formatDate value="${coupon.issue_date}"
													pattern="yyyy-MM-dd" /></td>
											<td><c:out value="${coupon.coupon_type}" /></td>
											<td><c:choose>
													<c:when test="${coupon.is_used == 1}">
                                                    사용됨
                                                </c:when>
													<c:when test="${coupon.expired}">
                                                    유효기간 경과
                                                </c:when>
													<c:otherwise>
                                                    미사용
                                                </c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${!coupon.expired && coupon.is_used == 0}">
														<button class="btn btn-primary"
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

						<div id="usable" class="coupon-table">
							<h3>사용가능 쿠폰</h3>
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
										<c:if test="${!coupon.expired && coupon.is_used == 0}">
											<tr>
												<td><fmt:formatDate value="${coupon.issue_date}"
														pattern="yyyy-MM-dd" /></td>
												<td><c:out value="${coupon.coupon_type}" /></td>
												<td>미사용</td>
												<td><button class="btn btn-primary"
															onclick="openResendWindow('${coupon.coupon_id}')">발송</button></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div id="used" class="coupon-table">
							<h3>사용완료 쿠폰</h3>
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
										<c:if test="${coupon.is_used == 1 || coupon.expired}">
											<tr>
												<td><fmt:formatDate value="${coupon.issue_date}"
														pattern="yyyy-MM-dd" /></td>
												<td><c:out value="${coupon.coupon_type}" /></td>
												<td><c:choose>
														<c:when test="${coupon.is_used == 1}">
                                                        사용됨
                                                    </c:when>
														<c:when test="${coupon.expired}">
                                                        유효기간 경과
                                                    </c:when>
													</c:choose></td>
												<td>&nbsp;</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>


				<div class="coupon-info mb-4">
					ㅇ쿠폰 발행 및 사용 현황을 확인하실 수 있습니다.<br /> ㅇ미사용 쿠폰은 재발송이 가능합니다. <br />
					ㅇ쿠폰의 유효기간은 발행일로부터 1개월입니다.<br /> ㅇ기타 문의는 고객센터(1588-9999)로 연락해주세요.
				</div>


				<!-- <div class="points-container">
					<div class="points-note">
						<p>※ 쿠폰 발행 및 사용 현황을 확인하실 수 있습니다.</p>
						<p>※ 미사용 쿠폰은 재발송이 가능합니다.</p>
						<p>※ 쿠폰의 유효기간은 발행일로부터 1개월입니다.</p>
						<p>※ 기타 문의는 고객센터(1588-9999)로 연락해주세요.</p>
					</div>
				</div> -->



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

		function showTab(tabId, event) {
			// 모든 탭을 숨기고 선택한 탭만 보여줍니다.
			var tabs = document.getElementsByClassName('coupon-table');
			for (var i = 0; i < tabs.length; i++) {
				tabs[i].classList.remove('active');
			}
			document.getElementById(tabId).classList.add('active');

			// 모든 링크의 'active' 클래스를 제거하고 선택된 링크에만 'active'를 추가합니다.
			var links = document.querySelectorAll('.tab-menu a');
			links.forEach(function(link) {
				link.classList.remove('active');
			});

			if (event && event.target) {
				event.target.classList.add('active');
			}
		}
	</script>
	<%@ include file="/WEB-INF/views/chatbot.jsp"%>
</body>
</html>
