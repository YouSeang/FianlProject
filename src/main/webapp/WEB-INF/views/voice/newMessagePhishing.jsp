<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Template Title -->
<title>메시지피싱</title>

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
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #f0f0f0;
}

.container {
	display: flex;
	width: 900px; /* 전체 컨테이너의 너비 */
	height: 667px; /* 전체 컨테이너의 높이 */
}

.mobile-frame {
	width: 390px; /* 모바일 화면 너비 */
	height: 100%; /* 모바일 화면 높이 */
	border: 16px solid #000; /* 프레임의 두께와 색상 */
	border-radius: 36px; /* 둥근 모서리 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 그림자 효과 */
	background-color: #fff; /* 배경 색상 */
	overflow: hidden; /* 프레임 밖으로 내용이 나가지 않도록 */
	position: relative; /* 스크롤 등을 설정하기 위해 position을 relative로 설정 */
	margin-right: 20px; /* 모바일 프레임과 사이드바 사이의 간격 */
}

.mobile-content {
	width: 100%;
	height: 100%;
	overflow-y: auto; /* 스크롤 가능 */
	padding: 10px;
	box-sizing: border-box;
}

.sidebar {
	width: 390px; /* 답변 이미지의 너비 */
	height: 100%;
	background-color: #e0e0e0; /* 배경 색상 */
	padding: 10px;
	box-sizing: border-box;
}

.sidebar img {
	width: 100%;
	height: auto;
	border-radius: 8px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="mobile-frame">
			<div class="mobile-content">
				<!-- 여기에 실제 내용을 삽입합니다 -->
				<img
					src="${pageContext.request.contextPath}/resources/images/messagePhishing/메시지피싱1.jpg"
					alt="Message Image">
				<p>이곳에 내용을 넣으세요.</p>
			</div>
		</div>
		<div class="sidebar">
			<h2>Choose Your Response</h2>
			<img
				src="${pageContext.request.contextPath}/resources/images/answer1.jpg"
				alt="Answer Option 1"> <img
				src="${pageContext.request.contextPath}/resources/images/answer2.jpg"
				alt="Answer Option 2">
		</div>
	</div>



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