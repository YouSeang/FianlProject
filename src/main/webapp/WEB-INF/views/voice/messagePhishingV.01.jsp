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
<title>메신저피싱</title>

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
<
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.message {
	margin: 10px;
	padding: 10px;
	border: 1px solid #ccc;
	font-size: 1.2em;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.card {
	display: flex;
	flex-direction: column;
	width: 200px;
	height: 150px;
	margin: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	padding: 20px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	transition: background-color 0.3s, border-color 0.3s;
}

.card:hover {
	background-color: #f0f0f0;
}

.card.selected {
	background-color: #d0f0c0;
	border-color: #a0d0a0;
}

.card-title {
	font-size: 1.1em;
	margin-bottom: 10px;
}

.card-description {
	font-size: 0.9em;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>


	<!-- 배너영역 Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>스미싱</span> 시뮬레이션
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">smishing</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영억 End -->


	<div id="message">초기 메시지</div>
	<div id="cardContainer">
		<!-- 카드가 동적으로 삽입됩니다 -->
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.1/sweetalert2.all.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							// 카드 데이터 설정
							var cards = [ {
								title : "메시지1",
								description : "메시지1의 설명",
								value : "답변1"
							}, {
								title : "메시지2",
								description : "메시지2의 설명",
								value : "답변2"
							} ];

							// 카드 렌더링
							var cardContainer = $('#cardContainer');
							cards
									.forEach(function(card) {
										var cardElement = $('<div class="card"></div>');
										cardElement.html('<h3>' + card.title
												+ '</h3><p>' + card.description
												+ '</p>');
										cardElement.data('value', card.value);
										cardContainer.append(cardElement);
									});

							// 카드 클릭 이벤트
							$('.card')
									.click(
											function() {
												var selectedResponse = $(this)
														.data('value');

												$
														.ajax({
															type : 'GET',
															url : '${pageContext.request.contextPath}/response', // 요청 URL 확인
															data : {
																response : selectedResponse
															},
															success : function(
																	response) {
																$('#message')
																		.text(
																				response);
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error("AJAX 요청 오류: "
																				+ status
																				+ " "
																				+ error);
															}
														});
											});
						});
	</script>
</body>
</html>
