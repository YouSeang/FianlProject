<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Phone Number Lookup">
<meta name="author" content="Your Name">

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="preconnect" href="https://statics.goorm.io" crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet" href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

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

.form-control {
	padding: 15px;
	border: 2px solid #FFB200;
	border-radius: 20px;
	font-size: 18px;
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
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
	font-size: 20px;
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
</style>

</head>
<body>
	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5" 
	style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/boardbgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
	<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title s-title">피해사례 공유</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">메인</a></li>
								<li class="breadcrumb-item active" aria-current="page">소통창구</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo Area End -->

	<!-- Case Share Board Start -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<h2 class="text-center mb-4">피해사례 작성</h2>
				<form action="${pageContext.request.contextPath}/board/shareWriteProcess" method="post" enctype="multipart/form-data">
					<div class="mb-3">
						<label for="title" class="form-label">제목</label>
						<input type="text" class="form-control" id="title" name="title" required>
					</div>
					<div class="mb-3">
						<label for="contents" class="form-label">내용</label>
						<textarea class="form-control" id="contents" name="contents" rows="5" required></textarea>
					</div>
					<div class="mb-3">
						<label for="image" class="form-label">이미지 첨부 (선택)</label>
						<input type="file" class="form-control" id="image" name="image">
					</div>

					<input type="hidden" name="userId" value="${sessionScope.userId}">

					<div class="text-end">
						<button type="submit" class="btn btn-primary">작성하기</button>
						<a href="${pageContext.request.contextPath}/board/share" class="btn btn-secondary">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Case Share Board End -->

	<!-- Footer start -->
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
      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>

</html>
