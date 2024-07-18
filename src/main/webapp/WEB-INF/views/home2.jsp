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
	<%@ include file="header.jsp"%>

	<!-- Banner Area Start -->
	<section class="banner-area">
		<div class="banner-2 owl-carousel">
			<div class="single-banner"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/배너1.png')">
				<div class="container">
					<div class="banner-info">
						<h1 class="banner-title text-white">
							시뮬레이션으로<span>금융사고를 </span><br />예방해보세요
						</h1>
						<p>블라블라</p>
						<div class="banner-btn">
							<a href="#" class="custom-btn">체험하러가기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Single Banner End -->
			<div class="single-banner"
				style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/배너1.jpg')">
				<div class="container">
					<div class="banner-info">
						<h1 class="banner-title text-white">
							KB금융을 <span><br />지금바로</span><br /> 체험해보세요
						</h1>
						<p>큽스쿨과 함께라면 뱅킹도 더이상 어렵지 않ㅇ하요</p>
						<div class="banner-btn">
							<a href="#" class="custom-btn">체험하러가기</a>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- Banner Area End -->

	<!-- Mission Area Start -->
	<section class="inspiration-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<p>KB큽스쿨에서 할 수 있어요!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-4">
					<div class="single-inspiration">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/mis1.png"
							alt=""></span>
						<h3>사고예방 시뮬레이션</h3>
						<p>메신저피싱, 보이스피싱을 예방하기 위해 실제 사례와 유사한 시뮬레이션을 해볼 수 있어요</p>
						<a href="#">자세히보기 <i class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
				<!-- Single Mission End -->
				<div class="col-lg-4 col-sm-4">
					<div class="single-inspiration">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/mis2.png"
							alt=""></span>
						<h3>디지털금융 교육</h3>
						<p>어렵게만 느껴졌던 스타뱅킹, 인터넷뱅킹의 다양한 거래를 체험해볼 수 있어요.</p>
						<a href="#">자세히보기 <i class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
				<!-- Single Mission End -->
				<div class="col-lg-4 col-sm-4">
					<div class="single-inspiration">
						<span><img
							src="${pageContext.request.contextPath}/resources/images/components/mis3.png"
							alt=""></span>
						<h3>나의 보안점수</h3>
						<p>보안을 강화할 수 있는 방법을 확인하고 적용해볼 수 있어요. 나의 보안점수까지 챙겨보세요!</p>
						<a href="#">자세히보기 <i class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
				<!-- Single Mission End -->
			</div>
		</div>
	</section>
	<!-- Mission Area End -->

	<!-- Feature Cause Area Start -->
	<div class="feature-cause-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-sm-6">
					<div class="f-cause-txt">
						<h2 class="section-title">
							KB큽스쿨 <span>추천영상</span>
						</h2>
						<p>KB큽스쿨에서 웃음과 재미, 금융지식까지 선물해드려요.</p>
						<a href="#" class="custom-btn">자세히보기 <i
							class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6">
					<div class="f-cause-wrap owl-carousel">
						<div class="f-cause-img">
							<a href="#"><img class="img-rounded"
								src="${pageContext.request.contextPath}/resources/images/causes/교육영상1.png"
								alt=""></a>
						</div>
						<div class="f-cause-img">
							<a href="#"><img class="img-rounded"
								src="${pageContext.request.contextPath}/resources/images/causes/교육영상2.png"
								alt=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Feature Cause Area End -->

	<!-- Our Project Area Start -->
	<section class="project-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							Our <span class="color">projects</span>
						</h2>
						<p>The cause is very clear is to help the helpless. assumenda
							delectus quaerat incidunt. Saepe, sed optio eum.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-4">
					<div class="single-project rounded-2 shadow">
						<figure class="project-thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/causes/cause1.jpg"
								alt="">
						</figure>
						<div class="project-info p-lg-4 p-3">
							<h3>
								<a href="#">World Health, Care Senior Citizen Project.</a>
							</h3>
							<p>We want to maxime aliquid eveniet et vitae repellendus ab
								fugit error. Lorem ipsum dolor sit amet, consectetur adipisicing
								elit. Velit, quasi.</p>
							<a href="#" class="custom-btn mt-3">View Project</a>
						</div>
					</div>
					<!-- Single Project End -->
				</div>
				<!-- Single Cause End -->
				<div class="col-lg-4 col-sm-4">
					<div class="single-project rounded-2 shadow">
						<figure class="project-thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/causes/cs3.jpg"
								alt="">
						</figure>
						<div class="project-info p-lg-4 p-3">
							<h3>
								<a href="#">We wish to ensure primary education mandatory.</a>
							</h3>
							<p>We want to maxime aliquid eveniet et vitae repellendus ab
								fugit error. Lorem ipsum dolor sit amet, consectetur adipisicing
								elit. Velit, quasi.</p>
							<a href="#" class="custom-btn mt-3">View Project</a>
						</div>

					</div>
					<!-- Single Project End -->
				</div>
				<!-- Single Cause End -->
				<div class="col-lg-4 col-sm-4">
					<div class="single-project rounded-2 shadow">
						<figure class="project-thumb">
							<img
								src="${pageContext.request.contextPath}/resources/images/project/pr1.jpg"
								alt="">
						</figure>
						<div class="project-info p-lg-4 p-3">
							<h3>
								<a href="#">Africa'n Food Deficiency Project is running.</a>
							</h3>
							<p>We want to maxime aliquid eveniet et vitae repellendus ab
								fugit error. Lorem ipsum dolor sit amet, consectetur adipisicing
								elit. Velit, quasi.</p>
							<a href="#" class="custom-btn mt-3">View Project</a>
						</div>
					</div>
					<!-- Single Project End -->
				</div>
				<!-- Single Cause End -->
			</div>
		</div>
	</section>
	<!-- Our Project Area End -->

	<!-- Volunteer Area Start -->
	<section class="donation-area section-padding"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/donation.jpg');"
		data-stellar-background-ratio="0.3">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="volunteer-wrap">
						<h2 class="section-title">
							Make a <span class="color">Donnation ?</span>
						</h2>
						<form action="#" class="volunteer-form row">
							<div class="col-lg-6 col-sm-6">
								<div class="form-group">
									<label for="name">*Name</label> <input type="text" id="name">
								</div>
								<div class="form-group">
									<label for="amount">*Amount(USD)</label> <input type="text"
										id="amount">
								</div>

							</div>
							<div class="col-lg-6 col-sm-6">
								<div class="form-group">
									<label for="email">*Email</label> <input type="text" id="email">
								</div>
								<div class="form-group">
									<label for="email">Fund Option</label> <select name="fund">
										<option value="Educate Children" selected>Food
											Campaign</option>
										<option value="Educate Children">Educate Children</option>
										<option value="Child Camps">Campaign for Old</option>
										<option value="Clean Water for Life">Clean Water</option>
										<option value="Campaign for Child Poverty">Campaign
											for Women</option>
									</select>
								</div>

							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label for="comment">*Message</label>
									<textarea name="comment" id="comment"></textarea>
								</div>
								<button class="custom-btn">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Volunteer Area End -->

	<!-- Blog Area Start -->
	<section class="blog-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							Our <span class="color">Journals</span>
						</h2>
						<p>Our Blogs is to help the helpless. assumenda delectus
							quaerat incidunt. Saepe, sed optio eum.</p>
					</div>
				</div>
			</div>
			<div class="row g-4">
				<div class="col-lg-6">
					<div class="list-entry d-sm-flex bg-light rounded-3 border">
						<a href="single-post.html" class="entry-media bg-cover"
							style="background-image: url('${pageContext.request.contextPath}/resources/images/blog/blog-1.jpg');">
						</a>
						<div class="entry-content p-lg-4 p-3">
							<h3 class="entry-title mb-2">
								<a href="single-blog.html" class="text-reset">Togather we
									all want to remove illiteracy. </a>
							</h3>
							<div class="entry-meta mb-3">
								<span><a href="#"><i class="fa-regular fa-user"></i>Tariqul
										Islam</a></span> <span><i class="fa-regular fa-calendar"></i>5 May
									2025</span> <span><i class="fa-regular fa-heart"></i>19</span>
							</div>
							<p>Lorem ipsum dolor sit amet, adipiscing elit. Aenean
								commodo ligula eget dolor.</p>
							<a href="single-blog.html" class="fw-bold text-reset">Read
								more <i class="fa fa-long-arrow-right ms-2"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- Single Article End -->
				<div class="col-lg-6">
					<div class="list-entry d-sm-flex bg-light rounded-3 border">
						<a href="single-post.html" class="entry-media bg-cover"
							style="background-image: url('${pageContext.request.contextPath}/resources/images/blog/blog-2.jpg');">
						</a>
						<div class="entry-content p-lg-4 p-3">
							<h3 class="entry-title mb-2">
								<a href="single-blog.html" class="text-reset">We are
									fighting againest malnutrition. </a>
							</h3>
							<div class="entry-meta mb-3">
								<span><a href="#"><i class="fa-regular fa-user"></i>Tariqul
										Islam</a></span> <span><i class="fa-regular fa-calendar"></i>5 May
									2025</span> <span><i class="fa-regular fa-heart"></i>19</span>
							</div>
							<p>Lorem ipsum dolor sit amet, adipiscing elit. Aenean
								commodo ligula eget dolor.</p>
							<a href="single-blog.html" class="fw-bold text-reset">Read
								more <i class="fa fa-long-arrow-right ms-2"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- Single Article End -->
				<div class="col-lg-6">
					<div class="list-entry d-sm-flex bg-light rounded-3 border">
						<a href="single-post.html" class="entry-media bg-cover"
							style="background-image: url('${pageContext.request.contextPath}/resources/images/blog/blog-3.jpg');">
						</a>
						<div class="entry-content p-lg-4 p-3">
							<h3 class="entry-title mb-2">
								<a href="single-blog.html" class="text-reset">Togather we
									all want to remove illiteracy. </a>
							</h3>
							<div class="entry-meta mb-3">
								<span><a href="#"><i class="fa-regular fa-user"></i>Tariqul
										Islam</a></span> <span><i class="fa-regular fa-calendar"></i>5 May
									2025</span> <span><i class="fa-regular fa-heart"></i>19</span>
							</div>
							<p>Lorem ipsum dolor sit amet, adipiscing elit. Aenean
								commodo ligula eget dolor.</p>
							<a href="single-blog.html" class="fw-bold text-reset">Read
								more <i class="fa fa-long-arrow-right ms-2"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- Single Article End -->
				<div class="col-lg-6">
					<div class="list-entry d-sm-flex bg-light rounded-3 border">
						<a href="single-post.html" class="entry-media bg-cover"
							style="background-image: url('${pageContext.request.contextPath}/resources/images/blog/blog-4.jpg');">
						</a>
						<div class="entry-content p-lg-4 p-3">
							<h3 class="entry-title mb-2">
								<a href="single-blog.html" class="text-reset">Togather we
									all want to remove illiteracy. </a>
							</h3>
							<div class="entry-meta mb-3">
								<span><a href="#"><i class="fa-regular fa-user"></i>Tariqul
										Islam</a></span> <span><i class="fa-regular fa-calendar"></i>5 May
									2025</span> <span><i class="fa-regular fa-heart"></i>19</span>
							</div>
							<p>Lorem ipsum dolor sit amet, adipiscing elit. Aenean
								commodo ligula eget dolor.</p>
							<a href="single-blog.html" class="fw-bold text-reset">Read
								more <i class="fa fa-long-arrow-right ms-2"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- Single Article End -->
			</div>
		</div>
	</section>
	<!-- Blog Area End -->

	<!-- Team Area Start -->
	<section class="team-area section-padding"
		data-stellar-background-ratio=".3">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro">
						<h2 class="section-title">
							Our <span class="color">Team</span>
						</h2>
						<p>Our Blogs is to help the helpless. assumenda delectus
							quaerat incidunt. Saepe, sed optio eum.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="team-wrap owl-carousel">
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/tm3.jpg"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">Elezabeth Rosa</a>
								</h4>
								<small>Head of Ideas</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/tm4.jpg"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">Angela Megan</a>
								</h4>
								<small>Head of Ideas</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/tm1.jpg"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">Phillip</a>
								</h4>
								<small>Head of Ideas</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/tm2.jpg"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">Jonh Trudo</a>
								</h4>
								<small>Head of Ideas</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/tm3.jpg"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">Elezabeth Rosa</a>
								</h4>
								<small>Head of Ideas</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/tm4.jpg"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">Angela Megan</a>
								</h4>
								<small>Head of Ideas</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/tm1.jpg"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">Phillip</a>
								</h4>
								<small>Head of Ideas</small>
							</div>
						</div>
						<!-- Team Member End -->
						<div class="team-member">
							<figure class="team-thumb">
								<img
									src="${pageContext.request.contextPath}/resources/images/team/tm2.jpg"
									alt="">
								<div class="member-social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-instagram"></i></a>
								</div>
							</figure>
							<div class="member-name">
								<h4>
									<a href="volunteer-single.html">Jonh Trudo</a>
								</h4>
								<small>Head of Ideas</small>
							</div>
						</div>
						<!-- Team Member End -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Team Area End -->

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

	<%@ include file="footer.jsp"%>
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