<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script> 
 
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
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- Style css
    ==================================================================== -->
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
	
  <%@ include file="/WEB-INF/views/header0802.jsp" %> 
	
    <!-- Promo Area Start -->
 <section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/financebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>KB스타뱅킹</span> 체험
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
    <!-- Promo Area End -->

    <!-- Team Area Start -->
    <section class="donations-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-intro intro-full">
                        <h2 class="section-title"> <span class="color">KB스타뱅킹</span> 적금가입</h2>
                        <p>KB스타뱅킹 적금가입을 가상으로 체험해보고, 실제로 진행해보세요!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                  <!--   <div class="bg-light donation-form rounded-3 shadow-sm d-flex justify-content-center align-items-center" style="min-height: 100vh;">
            
                    <div class="justify-content-center align-items-center"> -->
                     
  <%@ include file="/WEB-INF/views/edu/sbsavings2.jsp" %> 

</div>


                </div>
            </div>
       
    </section>
    <!-- Team Area End -->

     <%@ include file="/WEB-INF/views/footer.jsp" %> 
      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
    <!--
Javascript
======================================================== -->


</body>

</html>