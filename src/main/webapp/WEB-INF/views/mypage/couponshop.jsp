<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<title>쿠폰교환</title>

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
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!-- Theme CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>쿠폰교환</title>
<style>
.product-summery {
	text-align: center; /* 중앙 정렬 */
}

.radio-container {
	margin-top: 10px; /* 제목과 라디오 버튼 사이의 간격 */
}

.radio-container label {
	display: inline-flex; /* 라디오 버튼을 중앙에 배치 */
	align-items: center;
}

.radio-container input[type="radio"] {
	margin-right: 5px; /* 라디오 버튼과 텍스트 사이의 간격 */
}

.button-container {
	display: flex;
	justify-content: center;
	margin-top: 1rem;
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
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-position: 50% 0%;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							KB큽스쿨 <span>쿠폰교환</span>
						</h1>
						<nav aria-label="breadcrumb"></nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영역 end -->

	<!-- 쿠폰선택영역 start -->
	<main class="shop-page section-padding">
		<div class="col-lg-12">
			<div class="section-intro">
				<h2 class="section-title">
					<span class="color">쿠폰교환</span>
				</h2>
				<p>교환하고자하는 쿠폰을 아래에서 선택해주세요</p>
			</div>
		</div>


		<div class="container">
			<div class="shop-body row g-4">
				<c:forEach var="coupon" items="${coupon_list}">
					<div class="col-lg-4 col-sm-6">
						<div class="product-entry">
							<div class="product-media position-relative"
								style="margin-right: 20px;">
								<a href="single-product.html"> <img class="img-fluid"
									src="${pageContext.request.contextPath}${coupon.coupon_image}"
									alt="product" style="height: 500px">
								</a>
							</div>
							<div class="product-summery p-3" style="margin-right: 20px;">
								<h3 class="product-title">
									<a class="text-reset" href="single-product.html">${coupon.coupon_type}</a>
								</h3>
								<div class="radio-container">
									<label> <input type="radio" name="selectedCouponId"
										value="${coupon.id}"
										data-coupon-image="${pageContext.request.contextPath}${coupon.coupon_image}"
										onclick="updateSelectedCoupon(this)">
									</label>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<br />
				<form id="couponForm" method="post">
					<label for="to">전송받을 휴대폰번호: </label> <input type="text" id="to"
						name="to" required> <br> <label for="text">함께
						보낼 메시지: </label>
					<textarea id="text" name="text" required></textarea>
					<br> <br> <br />
					<div class="coupon-info">
						ㅇ모든 쿠폰은 포인트 5000점과 교환됩니다. <br /> ㅇ쿠폰으로 교환 후에는 취소가 불가하며 포인트는
						소멸됩니다. <br /> ㅇ기타 상세 문의사항이 있으신 경우에는 고객센터(1588-9999)로 문의해주세요.
					</div>
					<div class="button-container">
						<button type="button" class="btn btn-warning"
							onclick="exchangeCoupon()">쿠폰교환</button>
					</div>
					<input type="hidden" id="selectedCouponId" name="selectedCouponId"
						value=""> <input type="hidden" id="couponImageUrl"
						name="couponImageUrl" value="">
				</form>
			</div>
		</div>
	</main>
	<!-- 쿠폰선택영역 end -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<!--Javascript======================================================== -->
	<script>
    function updateSelectedCoupon(radio) {
        document.getElementById('selectedCouponId').value = radio.value;
        document.getElementById('couponImageUrl').value = radio.getAttribute('data-coupon-image');
    }

    function exchangeCoupon() {
        const form = document.getElementById('couponForm');
        const formData = new FormData(form);

        $.ajax({
            url: "${pageContext.request.contextPath}/subtractPoints",
            method: "POST",
            data: {
                pointReason: '쿠폰 교환',
                couponId: document.getElementById('selectedCouponId').value
            },
            success: function(response) {
                if (response.includes("Points subtracted and coupon issued successfully.")) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/sendMms",
                        method: "POST",
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(response) {
                            Swal.fire({
                                title: '쿠폰 발송 완료!',
                                text: '쿠폰이 성공적으로 발송되었습니다.',
                                icon: 'success',
                                confirmButtonText: '확인'
                            }).then(() => {
                                window.close();
                            });
                        },
                        error: function(xhr, status, error) {
                            Swal.fire({
                                title: '쿠폰 발송에 실패하였습니다. 포인트를 확인해주세요',
                                text: `쿠폰 발송 중 오류가 발생했습니다: ${error}`,
                                icon: 'error',
                                confirmButtonText: '확인'
                            });
                        }
                    });
                } else {
                    Swal.fire({
                        title: '포인트 부족 또는 쿠폰 저장 실패',
                        text: response,
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            },
            error: function(xhr, status, error) {
                Swal.fire({
                    title: '포인트 차감 실패',
                    text: `포인트 차감 중 오류가 발생했습니다: ${error}`,
                    icon: 'error',
                    confirmButtonText: '확인'
                });
            }
        });
    }
</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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