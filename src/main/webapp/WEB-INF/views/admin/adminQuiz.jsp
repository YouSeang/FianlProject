<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Admin Quiz Management">
<meta name="author" content="Your Name">
<title>LocKB</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/css/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
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

.admin-container {
	max-width: 600px;
	margin: auto;
	padding: 20px;
	border: 1px solid #ccc;
}

.admin-container label {
	display: block;
	margin-top: 10px;
}

.admin-container input, .admin-container textarea {
	width: 100%;
	padding: 8px;
	margin-top: 5px;
}

.admin-container button {
	margin-top: 20px;
	padding: 10px 20px;
}
</style>
</head>
<body>
	<!-- Header Start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- Main Area Start -->
	<main class="main-content">
		<div class="container mt-5">
			<h2>Quiz Management</h2>

			<!-- Right-aligned button -->
			<div class="text-end mb-3">
				<a href="${pageContext.request.contextPath}/admin/quizAdd"
					class="btn btn-primary">Add Quiz</a>
			</div>

			<!-- Quiz List -->
			<section class="quiz-area section-padding">
				<div class="container">
					<div class="row g-5">
						<c:forEach var="quiz" items="${quizs}">
							<div class="col-lg-4 col-sm-6">
								<div class="single-article shadow bg-white">
									<div class="article-details">
										<h3 class="article-heading ">
											Q${quiz.id}.
											<c:out value="${quiz.question}" />
										</h3>
										<br>
										<ul class="article-meta">
											<p>
												<i class="fa fa-star"></i> 카테고리: ${quiz.category}
											</p>
											<p>
												<i class="fa fa-star"></i> 정답: ${quiz.answer}
											</p>
											<p>
												<i class="fa fa-star"></i> 설명: ${quiz.explanation}
											</p>
											<p>
												<i class="fa fa-star"></i> 포인트: ${quiz.points}
											</p>
										</ul>
										<a
											href="${pageContext.request.contextPath}/admin/quizEdit?id=${quiz.id}"
											class="btn btn-warning btn-sm">Edit</a>
										<form
											action="${pageContext.request.contextPath}/admin/quizDelete"
											method="post" style="display: inline;">
											<input type="hidden" name="id" value="${quiz.id}">
											<!-- ID 전달 부분 수정 -->
											<button type="submit" class="btn btn-danger btn-sm">Delete</button>
										</form>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</main>

	<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
