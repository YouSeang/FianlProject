<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>



<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
    <meta name="author" content="Tariqul Islam">

    <!-- Template Title -->
    <title>HelpPlus Charity Template</title>

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

    <!-- Theme CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="preloader">
            <span></span>
            <span></span>
        </div>
    </div>
    <header class="hearer">
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-6">
                        <ul class="top-info d-none d-md-block">
                            <li><a href="mailto:helpplus@yahoo.com" title="Message"><i
                                        class="fa fa-paper-plane"></i>helpplus@yahoo.com</a>
                            </li>
                            <li><a href="tel:08829294239" title="Account"><i class="fa fa-phone"></i>+088 292 94
                                    239</a>
                            </li>
                        </ul>
                        <div class="dropdown d-md-none">
                            <a href="#" class="dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                Quick link
                            </a>
                            <ul class="dropdown-menu shadow-sm" aria-labelledby="dropdownMenuButton1">
                                <li><a href="mailto:helpplus@yahoo.com" title="Message"><i
                                            class="fa fa-paper-plane"></i>helpplus@gmail.com</a>
                                </li>
                                <li><a href="tel:08829294239" title="Account"><i class="fa fa-phone"></i>+088 292 94
                                        239</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <div class="account-info d-flex align-items-center">
                            <div class="lang-dropdown d-flex align-items-center">
                                <span><i class="fa fa-flag"></i></span>
                                <select name="lang" id="lang">
                                    <option value="1">English</option>
                                    <option value="2">Spanish</option>
                                    <option value="3">Dutch</option>
                                </select>
                            </div>
    
                            <a class="d-none d-sm-block" href="signin.html" title="Login"><i class="fa fa-user me-2"></i>My
                                Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        	<!-- header start -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

    <!-- Promo Area Start -->
    <section class="promo-area" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="promo-wrap">
                        <h1 class="promo-title">최근 <span>사기기법/사례</span></h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Causes</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Promo Area End -->

    <!-- Our Causes Area Start -->
    <section class="causes-area cause-page section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs1.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic education for all children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 85%;"
                                    aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">85%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs2.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic education for all children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 99%;"
                                    aria-valuenow="99" aria-valuemin="0" aria-valuemax="100">99%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs3.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic education for all children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 22%;"
                                    aria-valuenow="22" aria-valuemin="0" aria-valuemax="100">22%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs4.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic education for all children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 28%;"
                                    aria-valuenow="28" aria-valuemin="0" aria-valuemax="100">28%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs5.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic education for all children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 99%;"
                                    aria-valuenow="99" aria-valuemin="0" aria-valuemax="100">99%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs1.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic education for all children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 99%;"
                                    aria-valuenow="99" aria-valuemin="0" aria-valuemax="100">99%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs8.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic education for all children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 99%;"
                                    aria-valuenow="99" aria-valuemin="0" aria-valuemax="100">99%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs3.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic education for all children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 99%;"
                                    aria-valuenow="99" aria-valuemin="0" aria-valuemax="100">99%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-4 col-sm-4">
                    <div class="single-cause">
                        <figure class="cause-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/causes/cs2.jpg" alt="">
                        </figure>
                        <div class="cause-detials">
                            <h3><a href="single-cause.html">We ensure basic We ensure basic education for all
                                    children</a></h3>
                            <p> We want to maxime aliquid eveniet et vitae repellendus ab fugit error.</p>
                            <div class="cause-donate">
                                <div class="cause-raise">
                                    <label>Raise</label> $500
                                </div>
                                <div class="cause-goal">
                                    <label>Goal</label> $700
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar wow fadeInLeft" role="progressbar" style="width: 99%;"
                                    aria-valuenow="99" aria-valuemin="0" aria-valuemax="100">99%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Cause End -->
                <div class="col-lg-12">
                    <div class="loadmore">
                        <a href="#" class="custom-btn">Load More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Our Causes Area End -->

    <!-- Partner Area Start -->
    <section class="partner-area bg-cover section-padding" data-stellar-background-ratio="0.5"
        style="background-image: url('${pageContext.request.contextPath}/resources/images/partner/partner-bg.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-intro">
                        <h2 class="section-title">Global <span class="color">Partner</span></h2>
                        <p>Our upcoming events is to help the helpless. assumenda delectus quaerat incidunt. Saepe, sed
                            optio eum.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="partner-wrap owl-carousel">
                        <div class="partner-name">
                            <img src="${pageContext.request.contextPath}/resources/images/partner/pt1.png" alt="Help Image">
                        </div>
                        <div class="partner-name">
                            <img src="${pageContext.request.contextPath}/resources/images/partner/pt2.png" alt="Help Image">
                        </div>
                        <div class="partner-name">
                            <img src="${pageContext.request.contextPath}/resources/images/partner/pt3.png" alt="Help Image">
                        </div>
                        <div class="partner-name">
                            <img src="${pageContext.request.contextPath}/resources/images/partner/pt4.png" alt="Help Image">
                        </div>
                        <div class="partner-name">
                            <img src="${pageContext.request.contextPath}/resources/images/partner/pt5.png" alt="Help Image">
                        </div>
                        <div class="partner-name">
                            <img src="${pageContext.request.contextPath}/resources/images/partner/pt6.png" alt="Help Image">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Partner Area End -->
    

    
<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

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

</body>

</html>