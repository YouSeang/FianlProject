<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

<!-- Template Title
    ==================================================================-->
<title>KB스쿨</title>

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

<!-- Style css
    ==================================================================== -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>
  <%@ include file="/WEB-INF/views/header.jsp" %> 
	
   <!-- Promo Area Start -->
    <section class="promo-area" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="promo-wrap">
                        <h1 class="promo-title s-title">FAQ</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Faq</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Promo Area End -->

    <!-- FAQ AREA START -->
    <main class="main faq-area section-padding">
        <div class="container">
            <div class="row">
                <div class="section-header text-center mb-5">
                    <h2 class="display-5 fw-bold">Frequently Asking Questions</h2>
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.</p>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="accordion event-accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    What kind of event will organished?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    we organise <strong>Highly</strong> Lorem ipsum, dolor sit amet consectetur
                                    adipisicing elit. Rem maiores quod numquam inventore possimus qui, veritatis sed,
                                    minus dolores perferendis nostrum ad animi nam ratione dolore accusamus obcaecati
                                    omnis! Non.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header " id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Which area will be fixed for most?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    Lorem, ipsum dolor sit amet <strong>consectetur</strong> adipisicing elit. Ex
                                    ducimus corrupti modi numquam qui magni magnam recusandae consequatur nobis odit quo
                                    quasi, laboriosam accusamus harum perspiciatis quod eos animi perferendis.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    What is the importance of the event?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>Our Event always</strong> It is hidden
                                    by default, until the collapse plugin adds the appropriate classes that
                                    we use to style each element. These classes control the overall
                                    appearance, as well as the showing and hiding via CSS transitions. You
                                    can modify any of this with custom CSS or overriding our default
                                    variables. It's also worth noting that just about any HTML can go within

                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    What is the importance of the event?
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>Our Event always</strong> It is hidden
                                    by default, until the collapse plugin adds the appropriate classes that
                                    we use to style each element. These classes control the overall
                                    appearance, as well as the showing and hiding via CSS transitions. You
                                    can modify any of this with custom CSS or overriding our default
                                    variables. It's also worth noting that just about any HTML can go within

                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingfive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    What is the 5 importance of the event?
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingfive"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>Our Event always</strong> It is hidden
                                    by default, until the collapse plugin adds the appropriate classes that
                                    we use to style each element. These classes control the overall
                                    appearance, as well as the showing and hiding via CSS transitions. You
                                    can modify any of this with custom CSS or overriding our default
                                    variables. It's also worth noting that just about any HTML can go within

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--  Collum End -->
                <div class="col-lg-6 col-sm-6">
                    <div class="accordion event-accordion" id="accordionExample2">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingSix">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseSix" aria-expanded="true" aria-controls="collapseSix">
                                    What kind of event will organished?
                                </button>
                            </h2>
                            <div id="collapseSix" class="accordion-collapse collapse show" aria-labelledby="headingSix"
                                data-bs-parent="#accordionExample2">
                                <div class="accordion-body">
                                    we organise <strong>Highly</strong> Lorem ipsum, dolor sit amet consectetur
                                    adipisicing elit. Rem maiores quod numquam inventore possimus qui, veritatis sed,
                                    minus dolores perferendis nostrum ad animi nam ratione dolore accusamus obcaecati
                                    omnis! Non.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingSeven">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                    Which area will be fixed for most?
                                </button>
                            </h2>
                            <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven"
                                data-bs-parent="#accordionExample2">
                                <div class="accordion-body">
                                    Lorem, ipsum dolor sit amet <strong>consectetur</strong> adipisicing elit. Ex
                                    ducimus corrupti modi numquam qui magni magnam recusandae consequatur nobis odit quo
                                    quasi, laboriosam accusamus harum perspiciatis quod eos animi perferendis.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingEight">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                    What is the importance of the event?
                                </button>
                            </h2>
                            <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight"
                                data-bs-parent="#accordionExample2">
                                <div class="accordion-body">
                                    <strong>Our Event always</strong> It is hidden
                                    by default, until the collapse plugin adds the appropriate classes that
                                    we use to style each element. These classes control the overall
                                    appearance, as well as the showing and hiding via CSS transitions. You
                                    can modify any of this with custom CSS or overriding our default
                                    variables. It's also worth noting that just about any HTML can go within

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--  Collum End -->
            </div>
        </div>
    </main>
    <!-- FAQ AREA END -->

     <%@ include file="/WEB-INF/views/footer.jsp" %> 

    <!--
Javascript
======================================================== -->
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