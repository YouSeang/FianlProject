<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Video Form">
<meta name="author" content="Your Name">
<title>LocKB</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<style>
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}
</style>

</head>
<body>
	<!-- Header Start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- Main Area Start -->
	<main class="main-content">
		<div class="container mt-5">
			<h2>
				<c:choose>
					<c:when test="${empty video.id}">새 비디오 추가</c:when>
					<c:otherwise>비디오 수정</c:otherwise>
				</c:choose>
			</h2>
			<form action="${pageContext.request.contextPath}/admin/videoSave"
				method="post">
				<input type="hidden" id="videoId" name="id" value="${video.id}">
				<div class="mb-3">
					<label for="videoCategory" class="form-label">카테고리</label> <input
						type="text" class="form-control" id="videoCategory"
						name="category" value="${video.category}" required>
				</div>
				<div class="mb-3">
					<label for="videoName" class="form-label">비디오 이름</label> <input
						type="text" class="form-control" id="videoName" name="videoName"
						value="${video.videoName}" required>
				</div>

				<div class="mb-3">
					<label for="videoPoints" class="form-label">포인트</label> <input
						type="number" class="form-control" id="videoPoints" name="points"
						value="${video.points}" required>
				</div>
				<div class="mb-3">
					<label for="videoLink" class="form-label">링크</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon3">https://www.youtube.com/embed/</span>
						<input type="text" class="form-control" id="videoLink" name="link"
							value="${fn:substringAfter(video.link, 'https://www.youtube.com/embed/')}"
							required>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">저장</button>
				<a href="${pageContext.request.contextPath}/admin/adminVideo"
					class="btn btn-secondary">취소</a>
			</form>
		</div>
	</main>
	<!-- Main Area End -->

	<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
