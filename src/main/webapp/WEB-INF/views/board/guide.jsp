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

<!-- Template Title gg-->
<title>LocKB</title>

<!-- Favicon Icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Style Libraries -->
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
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- Style css -->
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

.accordion-item {
	border: 1px solid #ddd;
	margin-bottom: 10px;
	border-radius: 4px;
}

.accordion-header {
	cursor: pointer;
	padding: 10px;
	background-color: #f5f5f5;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.accordion-title {
	flex-grow: 1;
	text-align: left;
	font-size: 0.8em;
}

.accordion-body {
	display: none;
	padding: 10px;
	background-color: #fff;
}

.accordion-body.open {
	display: block;
}

.accordion-toggle {
	font-size: 1.2em;
}

.accordion-toggle.open:before {
	content: "\2212"; /* minus sign */
}

.accordion-toggle:before {
	content: "\002B"; /* plus sign */
}
</style>
</head>

<body>
	<!-- Preloader -->
	<!-- <div id="preloader">
        <div class="preloader">
            <span></span> <span></span>
        </div>
    </div> -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
	 style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/mysecurebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
	<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title s-title">예방방법</h1>
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

	<!-- 대처방법 START -->
	<main class="main faq-area section-padding">
		<div class="container">
			<div class="row">
				<div class="section-header text-center mb-5">
					<h2 class="display-5 fw-bold">금융피해 예방요령</h2>
					<p>피싱사기는 이렇게 예방해요!</p>
				</div>
				<!-- Collum Start -->
				<div class="col-12">
					<div id="accordionExample">
						<c:forEach var="guide" items="${guidelists}">
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading${guide.id}">
									<div class="accordion-title">
										<span class="num">${guide.id}</span> ${guide.guideTitle}
									</div>
									<span class="accordion-toggle"></span>
								</h2>
								<div id="collapse${guide.id}" class="accordion-body">
									${guide.guideContents}
									<c:if test="${not empty guide.guideFiles}">
										<%-- <p>
											<strong>첨부파일:</strong> <a
												href="${pageContext.request.contextPath}/path/to/save/files/${guide.guideFiles}">${guide.guideFiles}</a>
										</p> --%>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- Collum End -->
			</div>
		</div>
	</main>
	<!-- 대처방법 END -->

	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.accordion-header').click(function() {
				var $body = $(this).next('.accordion-body');
				var $toggle = $(this).find('.accordion-toggle');

				$body.toggleClass('open');
				$toggle.toggleClass('open');
			});
		});
	</script>
	      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>
</html>
