<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>



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
<title>HelpPlus Charity Template</title>

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

<!-- Theme CSS -->
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
	<header class="hearer">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-6">
						<ul class="top-info d-none d-md-block">
							<li><a href="mailto:helpplus@yahoo.com" title="Message"><i
									class="fa fa-paper-plane"></i>helpplus@yahoo.com</a></li>
							<li><a href="tel:08829294239" title="Account"><i
									class="fa fa-phone"></i>+088 292 94 239</a></li>
						</ul>
						<div class="dropdown d-md-none">
							<a href="#" class="dropdown-toggle" id="dropdownMenuButton1"
								data-bs-toggle="dropdown" aria-expanded="false"> Quick link
							</a>
							<ul class="dropdown-menu shadow-sm"
								aria-labelledby="dropdownMenuButton1">
								<li><a href="mailto:helpplus@yahoo.com" title="Message"><i
										class="fa fa-paper-plane"></i>helpplus@gmail.com</a></li>
								<li><a href="tel:08829294239" title="Account"><i
										class="fa fa-phone"></i>+088 292 94 239</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-sm-6">
						<div class="account-info d-flex align-items-center">
							<div class="lang-dropdown d-flex align-items-center">
								<span><i class="fa fa-flag"></i></span> <select name="lang"
									id="lang">
									<option value="1">English</option>
									<option value="2">Spanish</option>
									<option value="3">Dutch</option>
								</select>
							</div>

							<a class="d-none d-sm-block" href="signin.html" title="Login"><i
								class="fa fa-user me-2"></i>My Account</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header Top End -->
		<div class="offcanvas offcanvas-top bg-info" id="offcanvas-search"
			data-bs-scroll="true">
			<div class="container d-flex flex-row py-5">
				<form class="search-form w-100">
					<input id="search-form" type="text" class="form-control"
						placeholder="Type keyword and hit enter">
				</form>
				<button type="button" class="btn-close icon-xs bg-light rounded-5"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg">
			<div class="container px-lg-0">
				<a class="navbar-brand" href="./index.html"><img
					src="${pageContext.request.contextPath}/resources/images/components/logo.png"
					alt="Logo"></a>
				<button class="navbar-toggler offcanvas-nav-btn" type="button">
					<i class="fa fa-bars"></i>
				</button>
				<div class="offcanvas offcanvas-start offcanvas-nav">
					<div class="offcanvas-header">
						<a href="./index.html" class="text-inverse"><img
							src="${pageContext.request.contextPath}/resources/images/components/logo.png"
							alt="Logo"></a>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body pt-0 align-items-center">
						<ul class="navbar-nav mx-auto align-items-lg-center">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">Home</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="./index.html">Home
											1</a></li>
									<li><a class="dropdown-item" href="./index-2.html">Home
											2</a></li>
									<li><a class="dropdown-item" href="./index-3.html">Home
											3</a></li>
									<li><a class="dropdown-item" href="./index-4.html">Home
											4 <span class="badge text-bg-success ms-2">New</span>
									</a></li>
								</ul></li>
							<li class="nav-item"><a href="./about.html" class="nav-link">About</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">Pages</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="./about.html">About
											Us</a></li>
									<li class="dropdown-submenu dropend"><a
										class="dropdown-item dropdown-toggle" href="./volunteer.html">Volunteer</a>
										<ul class="dropdown-menu">
											<li class="dropdown-header">Volunteer</li>
											<li><a class="dropdown-item" href="./volunteer.html">Volunteer</a></li>
											<li><a class="dropdown-item"
												href="./volunteer-single.html">Volunteer Details</a></li>
										</ul></li>

									<li class="dropdown-submenu dropend"><a
										class="dropdown-item dropdown-toggle" href="#">Gallery</a>
										<ul class="dropdown-menu">
											<li class="dropdown-header">Gallery</li>
											<li><a class="dropdown-item" href="./gallery.html">Gallery
													1</a></li>
											<li><a class="dropdown-item" href="./gallery-2.html">Gallery
													2</a></li>
										</ul></li>
									<li class="dropdown-submenu dropend"><a
										class="dropdown-item dropdown-toggle" href="#">Event</a>
										<ul class="dropdown-menu">
											<li class="dropdown-header">Event</li>
											<li><a class="dropdown-item" href="./event.html">Event</a></li>
											<li><a class="dropdown-item" href="./single-event.html">Event
													Details</a></li>
										</ul></li>
									<li><a href="./testimonial.html" class="dropdown-item">Testimonial</a></li>
									<li><a href="./donate.html" class="dropdown-item">Donation</a></li>
									<li><a href="./faq.html" class="dropdown-item">FAQ</a></li>
									<li class="dropdown-submenu dropend"><a
										class="dropdown-item dropdown-toggle" href="#">Authentication</a>
										<ul class="dropdown-menu">
											<li class="dropdown-header">Account</li>
											<li><a class="dropdown-item" href="./signin.html">Sign
													In</a></li>
											<li><a class="dropdown-item" href="./signup.html">Sign
													Up</a></li>
										</ul></li>
									<li><a href="./error.html" class="dropdown-item">404
											Error</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">Causes</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="./causes.html">Causes</a></li>
									<li><a class="dropdown-item" href="./single-cause.html">Single
											Cause</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="./shop.html">Shop</a></li>
									<li><a class="dropdown-item" href="./single-product.html">Single
											Product</a></li>
									<li><a class="dropdown-item" href="./cart.html">Cart</a></li>
									<li><a class="dropdown-item" href="./checkout.html">Checkout</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="./blog.html">Blog</a></li>
									<li><a class="dropdown-item" href="./blog-sidebar.html">Blog
											with Sidebar</a></li>
									<li><a class="dropdown-item" href="./single-post.html">Single
											Post</a></li>
								</ul></li>
							<li class="nav-item"><a href="./contact.html"
								class="nav-link">Contact</a></li>
						</ul>
						<div
							class="mt-3 mt-lg-0 d-flex align-items-center header-actions justify-content-between">
							<a class="text-reset icon" href="#" data-bs-toggle="offcanvas"
								data-bs-target="#offcanvas-search"><i class="fa fa-search"></i></a>
							<a href="./cart.html"
								class="text-reset icon position-relative me-2"><i
								class="fa fa-shopping-cart"></i> <span class="cart-num">2</span></a>
							<a href="./donate.html" class="custom-btn">Donate Us</a>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- Header End -->

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
						<h3>나의 보안온도는?</h3>
					</div>
				</div>
				<div class="col-lg-3 col-sm-3">
					<div class="single-counter">
						<img src="${pageContext.request.contextPath}/resources/images/components/ct2.png" alt=""> <span
							class="counter"></span>
						<h3>뜨거워요!(변동)</h3>
					</div>
				</div>
				<div class="col-lg-3 col-sm-3">
					<div class="single-counter">
						<img src="${pageContext.request.contextPath}/resources/images/components/ct1.png" alt=""> <span
							class="counter">60</span>
						<h3>상위 60%에요!</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Project Counter Area End -->
	
	
	
	
	  <!-- Cause Page Start -->
    <div class="single-blog section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <article class="article-entry">
                        <figure>
                            <img src="${pageContext.request.contextPath}/resources/images/blog/sblog.jpg" alt="">
                        </figure>
                        <div class="post-detials">
                            <h2 class="article-title mb-3">보안온도 체크박스 만들기</h2>
                            <div class="article-meta">
                                <span><a href=""><i class="fa fa-user"></i>Jeffery Way</a></span>
                                <span><i class="fa fa-calendar"></i> 23-2-2018</span>
                                <span><a href=""><i class="fa fa-comment"></i>Comments (23)</a></span>
                                <span><a href=""><i class="fa fa-map-marker"></i>South Africa</a></span>
                            </div>
                            <p>Omnis pariatur similique officiis sit, explicabo harum assumenda laboriosam in ullam
                                amet,
                                placeat tempore ex fugit eveniet. At dolorum, eos doloribus, velit delectus officiis
                                reprehenderit. Dicta, dolorum. Ex, quas quia eveniet deserunt veniam provident ea rerum
                                temporibus. Quisquam veritatis voluptatibus, repellendus suscipit!Lorem ipsum dolor sit
                                amet, consectetur adipisicing elit. Numquam sit praesentium velit, at iusto blanditiis
                                vero
                                tempora quidem cumque iure non magni nesciunt labore deserunt possimus placeat illo aut
                                consequuntur est enim? Dolorum doloremque maxime,</p>
                            <blockquote>Help the poor who are suffer much in the world excepturi numquam voluptate.Ut id
                                odio quis purus lacinia varius vitae eu. Integer ac elit at nisi ultrices condimentum.
                            </blockquote>
                            <ul class="post-image">
                                <li><a href=""><img src="${pageContext.request.contextPath}/resources/images/blog/blog-2.jpg" alt=""></a></li>
                                <li><a href=""><img src="${pageContext.request.contextPath}/resources/images/blog/blog-6.jpg" alt=""></a></li>
                                <li><a href=""><img src="${pageContext.request.contextPath}/resources/images/blog/blog-5.jpg" alt=""></a></li>
                            </ul>
                            <ul class="info-list">
                                <li>Descent into civil war should be checked untill</li>
                                <li>Humanitarian crisis most of them women and children</li>
                                <li>We all protect our beautiful world at any cost</li>
                                <li>labore sed laudantium dignissimos, repudiandae nulla</li>
                            </ul>
                            <p> labore sed laudantium dignissimos, repudiandae nulla magnam consequuntur nobis
                                laboriosam.
                                Assumenda fugit dolore delectus distinctio suscipit at officia, sequi cupiditate quae
                                fugiat
                                aliquid minima unde sunt eligendi nesciunt error enim ratione atque cum consequuntur
                                rerum,
                                deserunt quam ipsam maxime. Veritatis ad accusamus alias. Nihil neque iusto, temporibus
                                minima laudantium hic ipsa.
                            </p>
                            <div class="article-footer py-4 d-sm-flex justify-content-between bg-white">
                                <div class="article-tags d-sm-flex align-items-center mb-4 mb-sm-0">
                                    <h5 class="m-0 text-uppercase">Tags: </h5>
                                    <div class="tagcloude widget_tag_cloud ms-3">
                                        <a href="#">Jersey</a>
                                        <a href="#">Football</a>
                                        <a href="#">Basketball</a>
                                    </div>
                                </div>
                                <div class="article-share d-sm-flex align-items-center">
                                    <h5 class="m-0 text-uppercase">Social Share: </h5>
                                    <div class="social-share ms-3 mt-3 mt-sm-0">
                                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                        <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                        <a href="#"><i class="fa-brands fa-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
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
	
	
	


	<!-- Become Volunteer Area Start -->
	<div class="volunteer-area bg-cover section-padding"
		data-stellar-background-ratio="0.4"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/volunteer.jpg');">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="volunteer-wrap text-center">
						<span>Become a Volunteer</span>
						<p>Join us to participate yourself for mankind</p>
						<a href="#" class="custom-btn">join now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Become Volunteer Area End -->

	<!-- Footer Area Start -->
	<footer class="footer-area">
		<div class="footer-top">
			<div class="newsletter">
				<h4>SignUp Our Newsletter</h4>
				<!-- Mailchimp From Start -->
				<form class="mailchimp inputSubscribeDiv">
					<input type="email" name="subscribe" id="subscriber-email"
						placeholder="Your Mail" class="form-control">
					<button type="submit" id="subscribe-button">
						<i class="fa fa-paper-plane"></i>
					</button>
					<div class="subscription-success"></div>
					<div class="subscription-error"></div>
					<label class="subscription-label" for="subscriber-email"></label>
				</form>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-sm-6">
					<div class="footer-widget footer-about">
						<div class="f-logo">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/resources/images/components/f-logo.png"
								alt="Logo">
							</a>
						</div>
						<p>Help us to save lifes during a natural disaster, get clean
							water running in the most remote areas, and much more.</p>
						<div class="footer-social">
							<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
								href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
								class="fa-brands fa-youtube"></i></a> <a href="#"><i
								class="fa-brands fa-pinterest"></i></a> <a href="#"><i
								class="fa-brands fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1 col-sm-5 offset-sm-1">
					<div class="footer-widget">
						<h3 class="widget-title">about us</h3>
						<ul>
							<li><a href="#">About Employee</a></li>
							<li><a href="#">About Carrier</a></li>
							<li><a href="#">How it works</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-sm-6">
					<div class="footer-widget">
						<h3 class="widget-title">Useful Links</h3>
						<ul>
							<li><a href="#">Project</a></li>
							<li><a href="#">Donner</a></li>
							<li><a href="#">Relief</a></li>
							<li><a href="#">Sanitaion</a></li>
							<li><a href="#">News</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-sm-5 offset-sm-1 offset-lg-0">
					<div class="footer-widget">
						<h3 class="widget-title">Contact Us</h3>
						<ul class="footer-contact">
							<li><i class="fa fa-home"></i> <span>129, London
									Street, South London UK.</span></li>
							<li><i class="fa fa-phone"></i><span><a
									href="tel:+6494461709.7890">+00- 123.456.7890</a> <br>
								<a href="tel:+6494461709.7890">+00- 223.456.7890</a></span></li>
							<li><i class="fa fa-envelope"></i> <span><a
									href="mailto:help@gmail.com">help@gmail.com</a></span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row copy-right g-0">
				<div class="col-xl-6 col-md-7 order-2 order-md-1">
					<p>
						Copyright © 2024. All Rights Reserved by <a href="#">theme-village</a>
					</p>
				</div>
				<div class="col-xl-6 col-md-5 order-1 order-md-2">
					<nav class="quick-link text-lg-end">
						<ul>
							<li><a href="#" class="nav-link">Terms & Conditions</a></li>
							<li><a href="#" class="nav-link">Privacy Policy</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Area Start -->

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