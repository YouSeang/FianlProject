<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="관리자 피싱 관리">
<meta name="author" content="Your Name">

<title>LocKB</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">
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

.scenario-card {
	margin-bottom: 30px;
}

.sortable-placeholder {
	border: 2px dashed #cccccc;
	height: 40px;
	margin-bottom: 10px;
}

.drag-handle {
	cursor: move;
	margin-left: 10px;
}

.sortable-item {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/header0802.jsp" %> 

	<main class="main-content">
		<div class="container mt-5">
			<h2>스미싱 케이스 관리</h2>
			<div class="text-end mb-3">
				<a class="btn btn-primary" onclick="toggleForm('add')">새 스미싱 케이스
					추가</a>
			</div>

			<div id="scenariosContainer">
				<c:forEach var="scenario" items="${scenarios}">
					<div class="card scenario-card">
						<div class="card-header">
							<h5>${scenario.type}</h5>
							<button class="btn btn-danger float-end"
								onclick="deleteScenario(${scenario.id})">삭제</button>
						</div>
						<div class="card-body">
							<form
								action="${pageContext.request.contextPath}/admin/updateSmishing"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="id" value="${scenario.id}">
								<div class="mb-3">
									<label for="type${scenario.id}" class="form-label">스미싱
										유형</label> <input type="text" class="form-control"
										id="type${scenario.id}" name="type" value="${scenario.type}"
										required>
								</div>
								<div class="mb-3">
									<label for="adminText${scenario.id}" class="form-label">발송문자내용</label>
									<textarea class="form-control" id="adminText${scenario.id}"
										name="adminText" rows="10" required>${scenario.adminText}</textarea>
								</div>
								<div class="mb-3">
									<label for="description${scenario.id}" class="form-label">설명</label>
									<textarea class="form-control" id="description${scenario.id}"
										name="description" rows="10" required>${scenario.description}</textarea>
								</div>
								<div class="mb-3">
									<label for="imageUrl${scenario.id}" class="form-label">이미지
										URL</label> <input type="text" class="form-control"
										id="imageUrl${scenario.id}" name="imageUrl"
										value="${scenario.imageUrl}" required>
								</div>
								<div class="text-end mb-3">
									<button type="submit" class="btn btn-primary">시나리오
										업데이트</button>
								</div>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>

			<div id="addScenarioForm" style="display: none;">
				<div class="card">
					<div class="card-header">
						<h5>스미싱 추가</h5>
					</div>
					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/admin/addSmisingCase"
							method="post" enctype="multipart/form-data">
							<div class="mb-3">
								<label for="typeNew" class="form-label">스미싱 유형</label> <input
									type="text" class="form-control" id="typeNew" name="type"
									required>
							</div>
							<div class="mb-3">
								<label for="typeNew" class="form-label">발송문자내용</label> <input
									type="text" class="form-control" id="adminTextNew"
									name="adminText" required>
							</div>
							<div class="mb-3">
								<label for="descriptionNew" class="form-label">설명</label>
								<textarea class="form-control" id="descriptionNew"
									name="description" rows="5" required></textarea>
							</div>
							<div class="mb-3">
								<label for="imageUrlNew" class="form-label">이미지 URL</label> <input
									type="text" class="form-control" id="imageUrlNew"
									name="imageUrl" required>
							</div>
							<div class="text-end mb-3">
								<button type="submit" class="btn btn-primary">스미싱 추가</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- jQuery UI 추가 -->

	<script>
        function toggleForm(formType) {
            if (formType === 'add') {
                $('#addScenarioForm').toggle();
            }
        }

        function deleteScenario(scenarioId) {
            if (confirm("정말로 이 시나리오를 삭제하시겠습니까?")) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/deleteSmishing',
                    type: 'POST',
                    data: { id: scenarioId },
                    success: function(response) {
                    	 alert("시나리오를 삭제하였습니다");
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        alert("시나리오 삭제에 실패했습니다. 다시 시도해 주세요.");
                    }
                });
            }
        }
    </script>
</body>
</html>
