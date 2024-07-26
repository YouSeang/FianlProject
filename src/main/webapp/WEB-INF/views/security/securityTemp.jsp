<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>

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

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
/* Custom Styles */
.ks-cboxtags li {
	margin-bottom: 10px;
	list-style: none;
}

.ks-cboxtags input[type="checkbox"] {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	position: relative;
}

.ks-cboxtags input[type="checkbox"]::before {
	content: "";
	display: block;
	width: 100%;
	height: 100%;
	background-color: white;
	border: 2px solid #000;
	position: absolute;
	top: 0;
	left: 0;
}

.ks-cboxtags input[type="checkbox"]:checked::before {
	background-color: #ffb200;
	border-color: black;
}

.ks-cboxtags input[type="checkbox"]:checked::after {
	content: "";
	display: block;
	width: 5px;
	height: 10px;
	border: solid black;
	border-width: 0 3px 3px 0;
	position: absolute;
	top: 5px;
	left: 9px;
	transform: rotate(45deg);
}

.ks-cboxtags label {
	font-size: 30px;
}

/* Add margin between checkbox section and footer */
.ftco-section {
	margin-bottom: 50px;
	margin-top: 50px;
}

/* Add margin between checkbox section and header */
.promo-area {
	margin-bottom: 50px;
}

.donation-form {
	background-color: #f8f9fa; /* 연한 회색 배경 */
	padding: 20px;
	border-radius: 8px;
}

.card {
	margin-bottom: 15px;
	border-radius: 8px;
}

.card-body {
	display: flex;
	align-items: center;
}

.submit-btn {
	background-color: #ffb200;
	border: 2px solid black;
	color: black;
	font-size: 22px;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	text-align: center;
	width: 100%;
}

.submit-btn:hover {
	background-color: #ff9900;
}
</style>
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/header.jsp"%>



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



	<!-- Checkbox Section Start -->
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2 class="heading-section mb-5 pb-md-4">나의 정보 보안 점수</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="wrap w-100">
						<div class="heading-title mb-4 text-center">
							<h3>현재 실천하고 있는 것을 체크하세요.</h3>
						</div>

						<form action="${pageContext.request.contextPath}/submitChecklist"
							method="post">
							<div class="donation-form p-3 p-xl-4 rounded-6">
								<ul class="ks-cboxtags p-0 m-0">
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-1" name="category1[]"
													value="1"> <label for="category1-1" class="mb-0">분야
													1-1</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-2" name="category1[]"
													value="1"> <label for="category1-2" class="mb-0">분야
													1-2</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-3" name="category1[]"
													value="1"> <label for="category1-3" class="mb-0">분야
													1-3</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-4" name="category1[]"
													value="1"> <label for="category1-4" class="mb-0">분야
													1-4</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-5" name="category1[]"
													value="1"> <label for="category1-5" class="mb-0">분야
													1-5</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-1" name="category2[]"
													value="1"> <label for="category2-1" class="mb-0">분야
													2-1</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-2" name="category2[]"
													value="1"> <label for="category2-2" class="mb-0">분야
													2-2</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-3" name="category2[]"
													value="1"> <label for="category2-3" class="mb-0">분야
													2-3</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-4" name="category2[]"
													value="1"> <label for="category2-4" class="mb-0">분야
													2-4</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-5" name="category2[]"
													value="1"> <label for="category2-5" class="mb-0">분야
													2-5</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-1" name="category3[]"
													value="1"> <label for="category3-1" class="mb-0">분야
													3-1</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-2" name="category3[]"
													value="1"> <label for="category3-2" class="mb-0">분야
													3-2</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-3" name="category3[]"
													value="1"> <label for="category3-3" class="mb-0">분야
													3-3</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-4" name="category3[]"
													value="1"> <label for="category3-4" class="mb-0">분야
													3-4</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-5" name="category3[]"
													value="1"> <label for="category3-5" class="mb-0">분야
													3-5</label>
											</div>
										</div>
									</li>
								</ul>
								<div class="text-center mt-4">
									<button type="submit" class="submit-btn">점수 확인해보기</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Checkbox Section End -->

	<!-- Footer Area Start -->
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
