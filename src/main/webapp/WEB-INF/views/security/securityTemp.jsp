

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

	<!-- Project Counter Area Start -->
	<section class="counter-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
			<div class="col-lg-3 col-sm-3">
					<div class="single-counter">
						<img src="${pageContext.request.contextPath}/resources/images/components/ct1.png" alt=""> <span
							class="counter"></span>
						<h3></h3>
					</div>
				</div>
				<div class="col-lg-3 col-sm-3">
					<div class="single-counter">
						<img src="${pageContext.request.contextPath}/resources/images/components/ct1.png" alt=""> <span
							class="counter">750</span>
						<h3><strong>나의 보안온도는?</strong></h3>
					</div>
				</div>
				<div class="col-lg-3 col-sm-3">
					<div class="single-counter">
						<img src="${pageContext.request.contextPath}/resources/images/components/ct2.png" alt=""> <span
							class="counter"></span>
						<h3><strong>뜨거워요!(변동)</strong></h3>
					</div>
				</div>
				<div class="col-lg-3 col-sm-3">
					<div class="single-counter">
						<img src="${pageContext.request.contextPath}/resources/images/components/ct1.png" alt=""> <span
							class="counter">60</span>
						<h3><strong>상위 60%에요!</strong></h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Project Counter Area End -->
	
  <body>
		
		<section class="ftco-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2 class="heading-section mb-5 pb-md-4">Checkbox #04</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-4">
						<div class="wrap w-100">
							<div class="heading-title mb-4 text-center">
								<h3>Choose your sports</h3>
							</div>
							<ul class="ks-cboxtags p-0 m-0">
						    <li>
						    	<input type="checkbox" id="checkboxOne" value="Order one" checked>
						    	<label for="checkboxOne">Volleyball</label>
						    </li>
						    <li>
						    	<input type="checkbox" id="checkboxTwo" value="Order Two">
						    	<label for="checkboxTwo">Swimming</label>
						    </li>
						    <li>
						    	<input type="checkbox" id="checkboxThree" value="Order Two">
						    	<label for="checkboxThree">Surfing</label>
						    </li>
						  </ul>
						</div>
					</div>
				</div>
			</div>
		</section>


  </body>
	
	  <!-- Cause Page Start -->
    <div class="single-blog section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                  
                    <div class="post-comments">
                        <h3 class="comment-title">Comments <span>(02)</span></h3>
                        <ol class="comment-list">
                            <li>
                                <article class="comment-body">
                                    <div class="comment-thumb">
                                        <img src="${pageContext.request.contextPath}/resources/images/blog/cl.jpg" alt="Comments">
                                    </div>
                                    <div class="comment-details">
                                        <h5 class="comment-name">Willam Bannet</h5>
                                        <span class="date">10 March 2018</span>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo
                                            ligula
                                            eget dolor. nascetur ridiculus mus. Donec quam felis.</p>
                                        <a href="#" class="comment-reply">Reply</a>
                                    </div>
                                </article>
                                <ol class="children">
                                    <li>
                                        <article class="comment-body">
                                            <div class="comment-thumb">
                                                <img src="${pageContext.request.contextPath}/resources/images/blog/cl2.jpg" alt="Comments">
                                            </div>
                                            <div class="comment-details">
                                                <h5 class="comment-name">Benedict Luis</h5>
                                                <span class="date">10 March 2018</span>
                                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean
                                                    commodo
                                                    ligula eget dolor.</p>
                                                <a href="#" class="comment-reply">Reply</a>
                                            </div>
                                        </article>
                                    </li>
                                </ol>
                            </li>
                            <li>
                                <article class="comment-body">
                                    <div class="comment-thumb">
                                        <img src="${pageContext.request.contextPath}/resources/images/blog/cl3.jpg" alt="Comments">
                                    </div>
                                    <div class="comment-details">
                                        <h5 class="comment-name">Mark Peter</h5>
                                        <span class="date">10 March 2018</span>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo
                                            ligula
                                            eget dolor. nascetur ridiculus mus. Donec quam felis.</p>
                                        <a href="#" class="comment-reply">Reply</a>
                                    </div>
                                </article>
                            </li>
                            <li>
                                <article class="comment-body">
                                    <div class="comment-thumb">
                                        <img src="${pageContext.request.contextPath}/resources/images/blog/cl.jpg" alt="Comments">
                                    </div>
                                    <div class="comment-details">
                                        <h5 class="comment-name">Tomas Padrick</h5>
                                        <span class="date">10 March 2018</span>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo
                                            ligula
                                            eget dolor. nascetur ridiculus mus. Donec quam felis.</p>
                                        <a href="#" class="comment-reply">Reply</a>
                                    </div>
                                </article>
                                </article>
                            </li>
                        </ol>
                    </div>
                  
                </div>
                <!-- Single Cause Article End -->

                <!-- Sidebar Start -->
                <div class="col-lg-4 col-sm-12">
                    <aside class="sidebar">
                        
                        <!-- Category Widget -->
                        <div class="widget">
                            <h3 class="widget-title">categories</h3>
                            <ul>
                                <li><a href="#">Clean Water</a><span>(32)</span></li>
                                <li><a href="#">Environment</a><span>(12)</span></li>
                                <li><a href="#">Child Protection</a><span>(35)</span></li>
                                <li><a href="#">Education</a><span>(32)</span></li>
                                <li><a href="#">Poverty</a><span>(32)</span></li>
                            </ul>
                        </div>
                        <div class="widget">
                            <h3 class="widget-title"> popular post</h3>
                            <div class="post-entry">
                                <div class="s-post">
                                    <div class="sp-thumb">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/blog/pp1.jpg" alt="ok">
                                        </a>
                                    </div>
                                    <div class="sp-details">
                                        <h4><a href="single-blog.html" class="text-reset">Iiste libero possimus beatae
                                                death </a></h4>
                                        <span>19 Jun 2024</span>
                                    </div>
                                </div>
                                <div class="s-post">
                                    <div class="sp-thumb">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/blog/pp3.jpg" alt="ok">
                                        </a>
                                    </div>
                                    <div class="sp-details">
                                        <h4><a href="single-blog.html" class="text-reset">More Food, Water and Cloths
                                                are needed </a>
                                        </h4>
                                        <span>19 Jun 2024</span>
                                    </div>
                                </div>
                                <div class="s-post">
                                    <div class="sp-thumb">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/blog/pp2.jpg" alt="ok">
                                        </a>
                                    </div>
                                    <div class="sp-details">
                                        <h4><a href="single-blog.html" class="text-reset">Inventore quae iste libero
                                                possimus beatae
                                                death </a></h4>
                                        <span>19 Jun 2024</span>
                                    </div>
                                </div>
                                <div class="s-post">
                                    <div class="sp-thumb">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/blog/pp4.jpg" alt="Help">
                                        </a>
                                    </div>
                                    <div class="sp-details">
                                        <h4><a href="single-blog.html" class="text-reset">More Food, Water and Cloths
                                                are needed.</a>
                                        </h4>
                                        <span>19 Jun 2024</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Instagram Widget -->
                        <div class="widget instagram-widget">
                            <h3 class="widget-title">Instagram</h3>
                            <ul>
                                <li>
                                    <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/blog/insta.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/blog/ins1.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/blog/ins2.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/blog/pp4.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/blog/ins4.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/blog/ins5.jpg" alt=""></a>
                                </li>
                            </ul>
                        </div>
                        <!-- Newsletter Widget -->
                        <div class="widget">
                            <h3 class="widget-title"> newsletter</h3>
                            <div class="newsletter-entry">
                                <p>Hi we are waiting for your submission any quaries. Lorem ipsum dolor sit amet.</p>
                                <form action="#">
                                    <div class="form-group">
                                        <input type="text" placeholder="Name">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" placeholder="Email">
                                    </div>
                                    <button class="w-100 custom-btn">submit</button>
                                </form>
                            </div>
                        </div>

                        <!-- Tag Widget -->
                        <div class="widget">
                            <h3 class="widget-title">Popular Tags</h3>
                            <div class="tagcloud">
                                <a href="#">charity</a>
                                <a href="#">humanity</a>
                                <a href="#">helpless</a>
                                <a href="#">link</a>
                                <a href="#">children</a>
                                <a href="#">poverty</a>
                                <a href="#">education</a>
                                <a href="#">love</a>
                                <a href="#">charity</a>
                            </div>
                        </div>
                        <!-- Tag End -->
                    </aside>
                </div>
                <!-- Sidebar End -->
            </div>
        </div>
    </div>
    <!-- Cause Page End -->
	


	<!-- Footer Area Start -->
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
	
	
	
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>

</body>

</html>