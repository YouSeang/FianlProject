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
	<!-- Header Start -->
	<header class="hearer">
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
							src="${pageContext.request.contextPath}/resources/
							images/components/logo.png"
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




	<!-- Main Area Start -->
	<main class="main-content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="single-product">
						<div class="row mb-5">
							<div class="col-lg-5 col-sm-6">
								<div class="sp-thumb">
									<img
										src="${pageContext.request.contextPath}/resources/
									images/incident/overView.png"
										alt=""> <span>New</span>
								</div>
							</div>
							<div class="col-lg-7 col-sm-6">
								<div class="sp-details">
									<h2>유형별 현황</h2>
									<span class="pricing"><strong>Price:</strong> $120.50</span>
									<p>보이스피싱은 일반적으로 검찰, 경찰, 금융감 독원 등을 사칭하고 의심계좌가 발견되었다며 수사를 할
										것처럼 겁을 주어 안전한 계좌로 돈을 이체 또는 전달하라는 ‘기관사칭형’과 저리에 대 출을 해주기 위해
										거래실적을 만들어야 한다거 나 추가 대출을 위해서는 기존 대출금을 모두 상 환해야 한다는 ‘대출사기형’이 가장
										대표적이다. 그 외에도 아들·딸 등 지인을 사칭하는 방법이 계속 유행하고 있으며, 그 당시의 사회적 이슈를
										이용하는 새로운 수법이 계속 생겨나고 있다. 예 를 들면, 최근에는 ‘재난지원금’, ‘대환대출’ 등을 받기
										위해서는 개인정보를 입력하고 관련 비용 을 먼저 납부해야 한다는 ‘선비용 수법(advance payment)’이
										활용되고 있다. ‘기관사칭형’과 ‘대 출사기형’은 보통 1:3의 비율로, ‘대출사기형’이 더 많이 발생하고
										있다. 즉, 코로나19 감염병 사 태로 인해 경제적 어려움을 겪고 있는 서민층들 에게 낮은 이자로 대출을 해줄
										것처럼 속이는 수 법이 검찰 등을 사칭하는 수법보다 3배 이상 더 많이 발생하고 있는 것이다(그림 X-19).</p>
									<p>소수에 불과하던 ‘대면편취’ 방식이 2020년 1만 5,686건으로 ‘비대면 편취’ 방식과 거의
										같아지더니, 2021년에는 2만 3,425건으로 ‘비대면편취’ 방식 7,557건보다 3배 이상 더 많이
										발생하였다</p>
									<div class="product-meta mt-4">
										<span class="me-3"><strong>출처:</strong> 금융감독원</span> <span><strong>주소:</strong>
											https://kostat.go.kr/</span>
									</div>
									<div class="s-cart d-flex">

										<div class="cart-cta ms-3">
											<button class="custom-btn unfill me-2">버튼1</button>
											<button class="custom-btn">버튼2</button>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="row mb-5">
							<!-- Item Review Start -->
							<div class="col-lg-12">
								<div class="product-tab shadow-sm">
									<ul>
										<li class="active" data-tab="description">선택1</li>
										<li data-tab="extra-info" class="">선택2</li>
										<li data-tab="review">선택3</li>
									</ul>
									<div class="tab-content">
										<div id="description">
											<div class="d-flex">
												<div class="desc-txt pe-5 me-4">
													<p>보이스피싱 피해액을 연도별로 살펴보면, 2006년에는 106억 원, 2009년에는 621억
														원으 로 소폭 증가하다가 2011년 1,019억 원의 피해 가 발생해 최초로 1,000억 원을
														돌파하였다. 그 리고 2015년 2,040억 원, 2018년 4,040억 원, 2021년 7,744억
														원이 발생해 피해액이 계속 증 가하고 있다. 이처럼 매년 사건 발생 건수는 다 소 감소하거나 3만여
														건에서 정체되어 있지만, 피해액수가 계속 늘어난다는 점이 심각한 문제 다. 즉, 1건당 피해금액은
														2006년 712만 원, 2011년 1,236만 원, 2015년 1,100만 원으로 1,000만 원
														내외를 유지하다가 2019년 1,699만 원, 2020년 2,210만 원, 2021년에는 2,500만
														원으로 최고를 기록하였다. 이는 발생 건수의 경우 관계기관의 노력 등으로 감소하였으나, 범 인들이
														범행수법을 진화시키고 악성앱을 통해 피해자의 휴대폰을 원격조종하게 되면서 피해 금액이 늘어난 것으로
														분석할 수 있다. 2006년 부터 2021년까지 누적 피해금액은 3조 8,681억 원이다</p>
													<p>메신저피싱은 2020년 급격한 증가세를 보였 다. 경찰청 통계에 따르면 2019년
														2,963건이 발 생하였는데, 2020년에는 1만 3,224건으로 4.5배 증가하였고, 2021년에는
														1만 7,841건으로 빠르 게 증가하였다. 보이스피싱 콜센터 일당들도 코 로나19 감염병 사태로 인해
														음성보다는 메신저피 싱으로 이동한 것으로 추정할 수 있다. 연도별 피 해금액은 2020년 587억 원에서
														2021년 1,265억 원으로 크게 늘어났다. 2021년 기준 메신저피싱 1건당 피해금액은 709만
														원이다
												</div>
												<img
													src="${pageContext.request.contextPath}/resources/
												images/shop/shop9.jpg"
													alt="">
											</div>
										</div>
										<div id="extra-info">
											<h3>Additional Information</h3>
											<table class="table w-75">

												<tbody>
													<tr>
														<th scope="row">Color</th>
														<td>Red, Blue, Green</td>
													</tr>
													<tr>
														<th scope="row">Size</th>
														<td>32, 34, 36, 40, 42</td>
													</tr>
													<tr>
														<th scope="row">Material</th>
														<td>Cotton, Wool</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div id="review">
											<ol>
												<li>
													<article class="single-comment">
														<div class="comment-thumb">
															<img
																src="${pageContext.request.contextPath}/resources/
															images/blog/cl.jpg"
																alt="Comment">
														</div>
														<div class="comment-body">
															<h3 class="name">Michael Philip</h3>
															<span class="date">20 June 2018</span>
															<p>consectetur adipisicing elit. Aliquam aut deleniti
																dignissimos eum explicabo in magnam molestias nesciunt,
																provident quae quaerat quam quasi quos repellat
																repudiandae sed unde, voluptas, voluptate.</p>
															<div class="item-rating">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star-half"></i>
															</div>
														</div>
													</article>
												</li>
											</ol>
											<div class="add-review">
												<h4>Add a Review</h4>
												<span class="add-rating"> <i class="fa fa-star"></i>
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i>
												</span>
												<form action="#">
													<div class="row">
														<div class="col-lg-6 col-sm-6">
															<div class="form-group">
																<input type="text" placeholder="Name">
															</div>
														</div>
														<div class="col-lg-6 col-sm-6">
															<div class="form-group">
																<input type="email" placeholder="Email">
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-lg-12">
															<div class="form-group">
																<textarea placeholder="Message"></textarea>
															</div>
														</div>
													</div>
													<button class="custom-btn">Submit</button>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-5 pb-4">
							<!-- Related Product Start -->
							<div class="col-lg-12">
								<div class="related-product">
									<h2>Related Products</h2>
									<div class="p-wrap owl-carousel">
										<div class="product-entry">
											<div class="product-media position-relative">
												<a href="single-product.html"> <img class="img-fluid"
													src="${pageContext.request.contextPath}/resources/
													images/shop/shop3.jpg"
													alt="product">
												</a>
												<div class="product-actions position-absolute">
													<a href="#" class="button add_to_cart_button icon"><i
														class="fa fa-shopping-cart"></i></a> <a href="#"
														class="button add_to_wish icon"><i class="fa fa-eye"></i></a>
												</div>
											</div>
											<div class="product-summery p-3">
												<div class="star-rating mb-2">
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span>
												</div>
												<h3 class="product-title">
													<a class="text-reset" href="single-product.html">
														Fashion Style Bag</a>
												</h3>
												<span class="price h5"> <span
													class="currency fw-bold">$</span>59.00
												</span>
											</div>
										</div>
										<!-- Product Entry End -->
										<div class="product-entry">
											<div class="product-media position-relative">
												<a href="single-product.html"> <img class="img-fluid"
													src="${pageContext.request.contextPath}/resources/
													images/shop/shop4.jpg"
													alt="product">
												</a>
												<div class="product-actions position-absolute">
													<a href="#" class="button add_to_cart_button icon"><i
														class="fa fa-shopping-cart"></i></a> <a href="#"
														class="button add_to_wish icon"><i class="fa fa-eye"></i></a>
												</div>
											</div>
											<div class="product-summery p-3">
												<div class="star-rating mb-2">
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span>
												</div>
												<h3 class="product-title">
													<a class="text-reset" href="single-product.html">
														Fashion Style Bag</a>
												</h3>
												<span class="price h5"> <span
													class="currency fw-bold">$</span>59.00
												</span>
											</div>
										</div>
										<!-- Product Entry End -->
										<div class="product-entry">
											<div class="product-media position-relative">
												<a href="single-product.html"> <img class="img-fluid"
													src="${pageContext.request.contextPath}/resources/
													images/shop/shop2.jpg"
													alt="product">
												</a>
												<div class="product-actions position-absolute">
													<a href="#" class="button add_to_cart_button icon"><i
														class="fa fa-shopping-cart"></i></a> <a href="#"
														class="button add_to_wish icon"><i class="fa fa-eye"></i></a>
												</div>
											</div>
											<div class="product-summery p-3">
												<div class="star-rating mb-2">
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span>
												</div>
												<h3 class="product-title">
													<a class="text-reset" href="single-product.html">
														Fashion Style Bag</a>
												</h3>
												<span class="price h5"> <span
													class="currency fw-bold">$</span>59.00
												</span>
											</div>
										</div>
										<!-- Product Entry End -->
										<div class="product-entry">
											<div class="product-media position-relative">
												<a href="single-product.html"> <img class="img-fluid"
													src="${pageContext.request.contextPath}/resources/
													images/shop/shop7.jpg"
													alt="product">
												</a>
												<div class="product-actions position-absolute">
													<a href="#" class="button add_to_cart_button icon"><i
														class="fa fa-shopping-cart"></i></a> <a href="#"
														class="button add_to_wish icon"><i class="fa fa-eye"></i></a>
												</div>
											</div>
											<div class="product-summery p-3">
												<div class="star-rating mb-2">
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span>
												</div>
												<h3 class="product-title">
													<a class="text-reset" href="single-product.html">
														Fashion Style Bag</a>
												</h3>
												<span class="price h5"> <span
													class="currency fw-bold">$</span>59.00
												</span>
											</div>
										</div>
										<!-- Product Entry End -->
										<div class="product-entry">
											<div class="product-media position-relative">
												<a href="single-product.html"> <img class="img-fluid"
													src="${pageContext.request.contextPath}/resources/
													images/shop/shop4.jpg"
													alt="product">
												</a>
												<div class="product-actions position-absolute">
													<a href="#" class="button add_to_cart_button icon"><i
														class="fa fa-shopping-cart"></i></a> <a href="#"
														class="button add_to_wish icon"><i class="fa fa-eye"></i></a>
												</div>
											</div>
											<div class="product-summery p-3">
												<div class="star-rating mb-2">
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span>
												</div>
												<h3 class="product-title">
													<a class="text-reset" href="single-product.html">
														Fashion Style Bag</a>
												</h3>
												<span class="price h5"> <span
													class="currency fw-bold">$</span>59.00
												</span>
											</div>
										</div>
										<!-- Product Entry End -->
										<div class="product-entry">
											<div class="product-media position-relative">
												<a href="single-product.html"> <img class="img-fluid"
													src="${pageContext.request.contextPath}/resources/
													images/shop/shop2.jpg"
													alt="product">
												</a>
												<div class="product-actions position-absolute">
													<a href="#" class="button add_to_cart_button icon"><i
														class="fa fa-shopping-cart"></i></a> <a href="#"
														class="button add_to_wish icon"><i class="fa fa-eye"></i></a>
												</div>
											</div>
											<div class="product-summery p-3">
												<div class="star-rating mb-2">
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
													<span><i class="fa fa-star"></i></span> <span><i
														class="fa fa-star"></i></span>
												</div>
												<h3 class="product-title">
													<a class="text-reset" href="single-product.html">
														Fashion Style Bag</a>
												</h3>
												<span class="price h5"> <span
													class="currency fw-bold">$</span>59.00
												</span>
											</div>
										</div>
										<!-- Product Entry End -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Main Area End -->






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
									href="tel:+6494461709.7890">+00- 123.456.7890</a> <br> <a
									href="tel:+6494461709.7890">+00- 223.456.7890</a></span></li>
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