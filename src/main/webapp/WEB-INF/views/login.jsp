<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">

<!-- Template Title -->
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
</style>

</head>

<body>
	

	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>



	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
	style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/aboutbgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
	
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							LocKB <span> 로그인</span>
						</h1>
						<nav aria-label="breadcrumb">
							
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo Area End -->

	<!-- Main Area Start -->
	<main class="main-content">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 mx-auto">
					<div class="login-wrap bg-light">
						<h2 class="fw-normal mb-5 h6">
							LocKB<span class="fw-bold tex-primary d-block display-5 ">로그인</span>
						</h2>

						<form action="./login" method="post">
							<div class="form-group">
								<label for="user_id">Id <span class="required">*</span></label>
								<input class="form-control" type="text" id="user_id"
									name="user_id">
							</div>
							<div class="form-group">
								<label for="password">Password <span class="required">*</span></label>
								<input class="form-control" type="password" id="password"
									name="password">
							</div>
							
							<div class="d-flex  align-items-center mb-3">
								<button class="custom-btn">로그인</button>
								<a href="./signupView" class="custom-btn unfill ms-4">회원가입</a>
							</div>
							<p>
								<a href="#">비밀번호 찾기</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Main Area End -->



	<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

  <script src="<c:url value='/resources/js/sweetalert2.all.min.js'/>"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <c:if test="${not empty loginError}"> 
        <script>
            <c:choose>
                <c:when test="${loginError == 'invalidId'}">
                    Swal.fire({
                        icon: 'error',
                        title: '로그인 실패',
                        text: 'ID를 확인해주세요.',
                        confirmButtonText: '확인'
                    });
                </c:when>
                <c:when test="${loginError == 'invalidPassword'}">
                    Swal.fire({
                        icon: 'error',
                        title: '로그인 실패',
                        text: '비밀번호를 확인해주세요.',
                        confirmButtonText: '확인'
                    });
                </c:when>
                <c:when test="${loginError == 'unknownError'}">
                    Swal.fire({
                        icon: 'error',
                        title: '로그인 실패',
                        text: '알 수 없는 오류가 발생했습니다. 다시 시도해주세요.',
                        confirmButtonText: '확인'
                    });
                </c:when>
            </c:choose>
        </script>
    </c:if>
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