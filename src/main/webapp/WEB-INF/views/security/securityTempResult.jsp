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
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">
<title>LocKB</title>
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
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- SweetAlert CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.css">

<style>
/* Custom Styles */
.ks-cboxtags li {
	margin-bottom: 10px;
	list-style: none;
}

.ks-cboxtags input[type="checkbox"] {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	position: relative;
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
	font-size: 30px;
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
	padding: 20px;
	border-radius: 8px;
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
	border: 2px solid black;
	color: black;
	font-size: 22px;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	text-align: center;
	width: 100%;
}

.submit-btn:hover {
	background-color: #ff9900;
}

.separator {
	border-top: 2px solid #ddd;
	margin: 20px 0;
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
	<%@ include file="/WEB-INF/views/header0802.jsp" %> 

	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>나의</span> 보안 점수
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">메인</a></li>
								<li class="breadcrumb-item active" aria-current="page">보안점수</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo Area End -->

	<!-- About Area Start -->
	<section class="about-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-5">
					<div class="about-intro">
						<span class="badge shadow">my security</span>
						<h2 class="section-title">
							나의<span>보안</span> 온도
						</h2>
						<div class="single-counter">
							<h3>
								<strong>♨${temperatureMessage}</strong>
							</h3>
						</div>
						<a href="goSecureGuide" class="custom-btn mt-5">보안 강화 방법</a>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="about-content"></div>
					<div class="d-sm-flex justify-content-between mt-5">
						<div class="single-counter">
							<h3>
								<strong>온도 체크 참여자수</strong>
							</h3>
							<h4>
								<span class="counter">${totalSubmissions}</span>
							</h4>
						</div>
						<div class="single-counter">
							<h3>
								<strong>나의 보안 온도</strong>
							</h3>
							<h4>
								<span class="counter">${totalScore}</span>º
							</h4>
						</div>
						<div class="single-counter">
							<h3>
								<strong>나는 상위 몇 %?</strong>
							</h3>
							<h4>
								<span class="counter"> <c:choose>
										<c:when test="${totalSubmissions > 0}">
											<fmt:formatNumber value="${rank * 100.0 / totalSubmissions}"
												type="number" maxFractionDigits="2" />
										</c:when>
										<c:otherwise>
                                        0
                                    </c:otherwise>
									</c:choose>
								</span>%
							</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Area End -->
	<!-- 구분선 추가 -->
	<div class="separator"></div>
	<!-- 구분선 추가 -->
	<!-- Service Area Start -->
	<section class="service-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							맞춤형 <span class="color">정보보안 팁</span>
						</h2>
						<p>카테고리별 정보 보안 팁을 참고해서 보안점수를 더욱 올려보세요.</p>
					</div>
				</div>
			</div>
			<div class="row g-4">
				<div class="col-lg-4 col-sm-4">
					<div class="service-item border rounded-2">
						<span class="flaticon-nature"></span>
						<h4>보안 관련 기능</h4>
						<p>
							<c:choose>
								<c:when test="${not empty tipsByCategory['category1']}">
                                    ${tipsByCategory['category1'].tip}
                                </c:when>
								<c:otherwise>
                                    정보보안을 잘 실천하고 계시네요!
                                </c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
				<!-- Service Item End -->
				<div class="col-lg-4 col-sm-4">
					<div class="service-item border rounded-2">
						<span class="flaticon-technology"></span>
						<h4>금융 보안 관련</h4>
						<p>
							<c:choose>
								<c:when test="${not empty tipsByCategory['category2']}">
                                    ${tipsByCategory['category2'].tip}
                                </c:when>
								<c:otherwise>
                                    정보보안을 잘 실천하고 계시네요!
                                </c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
				<!-- Service Item End -->
				<div class="col-lg-4 col-sm-4">
					<div class="service-item border rounded-2">
						<span class="flaticon-medical"></span>
						<h4>모바일 사용 습관 관련</h4>
						<p>
							<c:choose>
								<c:when test="${not empty tipsByCategory['category3']}">
                                    ${tipsByCategory['category3'].tip}
                                </c:when>
								<c:otherwise>
                                    정보보안을 잘 실천하고 계시네요!
                                </c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
				<!-- Service Item End -->
			</div>
		</div>
	</section>
	<!-- Service Area End -->

	<!-- Footer Area Start -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript ======================================================== -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.stellar.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.scrollUp.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
	<script
		src="<c:url value='/resources/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.syotimer.min.js'/>"></script>
	<script src="<c:url value='/resources/js/wow.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.counterup.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/resources/js/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.ajaxchimp.min.js'/>"></script>
	<script src="<c:url value='/resources/js/form.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.nice-select.min.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>

	<!-- SweetAlert JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.js"></script>

	<!-- SweetAlert 실행 -->
	<c:if test="${eventWinner}">
		<script>
			$(document).ready(function() {
				Swal.fire({
					title : '축하합니다!',
					text : '이벤트에 당첨되었습니다! 포인트 500점이 적립되었습니다.',
					icon : 'success',
					confirmButtonText : '확인'
				});
			});
		</script>
	</c:if>
</body>
</html>
