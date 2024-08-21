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

	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<main class="main-content">
		<div class="container mt-5">
			<h2>피싱 시나리오 관리</h2>
			<div class="text-end mb-3">
				<a class="btn btn-primary" onclick="toggleForm('add')">새 시나리오 추가</a>
			</div>

			<div id="scenariosContainer">
				<c:forEach var="scenario" items="${scenarios}">
					<div class="card scenario-card">
						<div class="card-header">
							<h5>${scenario.scenarioName}</h5>
							<button class="btn btn-danger float-end"
								onclick="deleteScenario(${scenario.id})">삭제</button>
						</div>
						<div class="card-body">
							<form
								action="${pageContext.request.contextPath}/admin/updateScenario"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="scenarioId" value="${scenario.id}">
								<div class="mb-3">
									<label for="scenarioName${scenario.id}" class="form-label">시나리오
										이름</label> <input type="text" class="form-control"
										id="scenarioName${scenario.id}" name="scenarioName"
										value="${scenario.scenarioName}" required>
								</div>
								<div class="mb-3">
									<label for="scenarioPrompt${scenario.id}" class="form-label">프롬프트</label>
									<textarea class="form-control"
										id="scenarioPrompt${scenario.id}" name="scenarioPrompt"
										rows="10" required>${scenario.scenarioPrompt}</textarea>
								</div>
								<div class="mb-3">
									<label class="form-label">오디오 파일</label>
									<ul id="fileInputsContainer${scenario.id}"
										class="sortable list-unstyled">
										<c:forEach var="audio" items="${scenario.audioFiles}">
											<li class="sortable-item" data-id="${audio.voicePath}">
												<span class="drag-handle"><i class="fas fa-bars"></i></span>
												<input type="hidden" name="existingAudioFiles"
												value="${audio.voicePath}"> <input type="text"
												class="form-control col" value="${audio.voicePath}" readonly>
												<button type="button" class="btn btn-danger col-auto"
													onclick="removeFileInput(this)">제거</button>
											</li>
										</c:forEach>
									</ul>
								</div>
								<button type="button" class="btn btn-secondary mb-3"
									onclick="addFileInput('${scenario.id}')">다른 파일 추가</button>
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
						<h5>새 시나리오 추가</h5>
					</div>
					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/admin/addScenario"
							method="post" enctype="multipart/form-data">
							<div class="mb-3">
								<label for="scenarioNameNew" class="form-label">시나리오 이름</label>
								<input type="text" class="form-control" id="scenarioNameNew"
									name="scenarioName" required>
							</div>
							<div class="mb-3">
								<label for="scenarioPromptNew" class="form-label">프롬프트</label>
								<textarea class="form-control" id="scenarioPromptNew"
									name="scenarioPrompt" rows="5" required></textarea>
							</div>
							<div class="mb-3">
								<label for="audioFileNew" class="form-label">오디오 파일</label>
								<div id="fileInputsContainerNew" class="sortable">
									<div class="sortable-item">
										<span class="drag-handle"><i class="fas fa-bars"></i></span> <input
											type="file" class="form-control col" id="audioFileNew"
											name="audioFiles" accept="audio/*">
										<button type="button" class="btn btn-danger col-auto"
											onclick="removeFileInput(this)">제거</button>
									</div>
								</div>
							</div>
							<button type="button" class="btn btn-secondary mb-3"
								onclick="addFileInput('New')">다른 파일 추가</button>
							<div class="text-end mb-3">
								<button type="submit" class="btn btn-primary">시나리오 추가</button>
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

        function addFileInput(tabId) {
            const container = document.getElementById('fileInputsContainer' + tabId);
            const fileInputDiv = document.createElement('li');
            fileInputDiv.classList.add('sortable-item');
            fileInputDiv.innerHTML = `
                <span class="drag-handle"><i class="fas fa-bars"></i></span>
                <input type="file" class="form-control col" name="audioFiles" accept="audio/*">
                <button type="button" class="btn btn-danger col-auto" onclick="removeFileInput(this)">제거</button>
            `;
            container.appendChild(fileInputDiv);
        }

        function removeFileInput(button) {
            const container = button.parentElement.parentElement;
            container.removeChild(button.parentElement);
        }

        function deleteScenario(scenarioId) {
            if (confirm("정말로 이 시나리오를 삭제하시겠습니까?")) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/deleteScenario',
                    type: 'POST',
                    data: { scenarioId: scenarioId },
                    success: function(response) {
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        alert("시나리오 삭제에 실패했습니다. 다시 시도해 주세요.");
                    }
                });
            }
        }

        $(function() {
            $(".sortable").sortable({
                handle: ".drag-handle",
                placeholder: "sortable-placeholder",
                update: function(event, ui) {
                    // 순서 변경 시의 처리 로직 추가 (옵션)
                }
            });
            $(".sortable").disableSelection();
        });
    </script>
</body>
</html>
