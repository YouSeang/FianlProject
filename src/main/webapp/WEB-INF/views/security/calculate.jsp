<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">

<!-- Template Title -->
<title>LocKB</title>

<!-- Favicon Icon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Plugins CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">

<link rel="preconnect" href="https://statics.goorm.io" crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet" href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- Theme CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<style>
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}

.form-control {
	padding: 15px;
	border: 2px solid #FFB200;
	border-radius: 20px;
	font-size: 18px;
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
	width: 50%; /* input 필드 너비 설정 */
	margin: 0 auto; /* 가운데 정렬 */
}

.form-control:hover {
	border-color: #031550;
	box-shadow: 0 0 8px rgba(3, 21, 80, 0.5);
}

.form-control:focus {
	outline: none;
	border-color: #031550;
	box-shadow: 0 0 8px rgba(3, 21, 80, 0.5);
}

.btn-primary, .btn-secondary {
	padding: 15px;
	border-radius: 10px;
	font-size: 30px;
	width: 150px;
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

h2 {
    text-align: center; /* 제목 가운데 정렬 */
    margin-bottom: 50px; /* 제목 하단 마진 추가 */
}
</style>

</head>
<body>

	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- 배너영역 start -->
	<section class="promo-area" data-stellar-background-ratio="0.5" style="background-position: 50% 0%;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>적정 전세가 확인 </span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">메인</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영역 end -->

	<div class="container mt-5">
		<h2 style="font-size: 30px;">전세 가격 계산기</h2>

		<form id="calculatorForm" method="POST">
			<div class="form-group">
				<label for="propertyType">주택 유형:</label>
				<select id="propertyType" name="propertyType" class="form-control" required>
					<option value="">선택하세요</option>
					<option value="apartment">아파트</option>
					<option value="villa">빌라</option>
				</select>
			</div>

			<div id="apartmentFields" style="display: none;">
				<div class="form-group">
					<label for="housePrice">주택 시세:</label>
					<input type="number" id="housePrice" name="housePrice" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="mortgageAmount">근저당권 설정액(소유주 총 대출 금액):</label>
					<input type="number" id="mortgageAmount" name="mortgageAmount" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="rentPrice">임대 가격:</label>
					<input type="number" id="rentPrice" name="rentPrice" class="form-control" required>
				</div>
			</div>

			<div id="villaFields" style="display: none;">
				<div class="form-group">
					<label for="housePrice">주택 시세(실 거래가):</label>
					<input type="number" id="housePrice" name="housePrice" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="mortgageAmount">근저당권 설정액(소유주 총 대출 금액):</label>
					<input type="number" id="mortgageAmount" name="mortgageAmount" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="totalOtherDepositAmount">타 거주자 총 보증금:</label>
					<input type="number" id="totalOtherDepositAmount" name="totalOtherDepositAmount" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="rentPrice">임대 가격:</label>
					<input type="number" id="rentPrice" name="rentPrice" class="form-control" required>
				</div>
			</div>

			<div class="text-end">
				<button type="submit" class="btn btn-primary mt-3">계산</button>
			</div>
		</form>

		<div id="result" class="mt-3"></div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
	$(document).ready(function() {
	    $('#propertyType').change(function() {
	        var selectedType = $(this).val();

	        // 모든 필드에서 required 속성 제거 및 필드 숨기기
	        $('#apartmentFields').find('input').removeAttr('required').prop('disabled', true);
	        $('#villaFields').find('input').removeAttr('required').prop('disabled', true);

	        // 선택된 필드만 보이게 하고 required 속성 추가
	        if (selectedType == "apartment") {
	            $('#apartmentFields').show().find('input').attr('required', true).prop('disabled', false);
	            $('#villaFields').hide();
	        } else if (selectedType == "villa") {
	            $('#villaFields').show().find('input').attr('required', true).prop('disabled', false);
	            $('#apartmentFields').hide();
	        } else {
	            $('#apartmentFields, #villaFields').hide();
	        }
	    });

	    $('#calculatorForm').submit(function(event) {
	        event.preventDefault();

	        var formData = $(this).serialize();
	        var propertyType = $('#propertyType').val();
	        var url = propertyType === "apartment" ? '/study/calculate/apartment' : '/study/calculate/villa';
	        
	        $.post(url, formData, function(data) {
	            Swal.fire({
	                title: '계산 결과',
	                html: data.result,  // 'text' 대신 'html'을 사용해야 합니다.
	                icon: 'info',
	                confirmButtonText: '확인'
	            });
	        }).fail(function() {
	            Swal.fire({
	                title: '오류',
	                text: '계산 중 문제가 발생했습니다. 다시 시도해 주세요.',
	                icon: 'error',
	                confirmButtonText: '확인'
	            });
	        });

	    });
	});
	</script>

	<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript -->
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.scrollUp.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
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
