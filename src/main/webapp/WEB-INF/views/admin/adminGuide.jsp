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

<title>예방요령 관리</title>

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

<style>
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
			<h2>예방요령 관리</h2>
			<div class="text-end mb-3">
				<a class="btn btn-primary" onclick="toggleForm('add')">예방요령 추가</a>
			</div>

			<div id="guidesContainer">
				<c:forEach var="guide" items="${guidelists}">
					<div class="card scenario-card">
						<div class="card-header">
							<h5>${guide.guideTitle}</h5>
							<button class="btn btn-danger float-end"
								onclick="deleteGuide(${guide.id})">삭제</button>
						</div>
						<div class="card-body">
							<form
								action="${pageContext.request.contextPath}/admin/updateGuide"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="guideId" value="${guide.id}">
								<div class="mb-3">
									<label for="guideTitle${guide.id}" class="form-label">제목</label>
									<input type="text" class="form-control"
										id="guideTitle${guide.id}" name="guideTitle"
										value="${guide.guideTitle}" required>
								</div>
								<div class="mb-3">
									<label for="guideContents${guide.id}" class="form-label">내용</label>
									<textarea class="form-control" id="guideContents${guide.id}"
										name="guideContents" rows="10" required>${guide.guideContents}</textarea>
								</div>
								<div class="mb-3">
									<label class="form-label">첨부파일</label>
									<ul id="fileInputsContainer${guide.id}"
										class="sortable list-unstyled">
										<c:forEach var="file" items="${guide.guideFiles.split(',')}">
											<li class="sortable-item" data-id="${file}"><span
												class="drag-handle"><i class="fas fa-bars"></i></span> <input
												type="hidden" name="guideFile" value="${file}"> <input
												type="text" class="form-control col" value="${file}"
												readonly>
												<button type="button" class="btn btn-danger col-auto"
													onclick="removeFileInput(this)">제거</button></li>
										</c:forEach>
									</ul>
								</div>
								<div class="text-end mb-3">
									<button type="submit" class="btn btn-primary">예방요령
										업데이트</button>
								</div>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>

			<div id="addGuideForm" style="display: none;">
				<div class="card">
					<div class="card-header">
						<h5>새 예방요령 추가</h5>
					</div>
					<div class="card-body">
						<form action="${pageContext.request.contextPath}/admin/addGuide"
							method="post" enctype="multipart/form-data">
							<div class="mb-3">
								<label for="guideTitleNew" class="form-label">제목</label> <input
									type="text" class="form-control" id="guideTitleNew"
									name="guideTitleNew" required>
							</div>
							<div class="mb-3">
								<label for="guideContentNew" class="form-label">내용</label>
								<textarea class="form-control" id="guideContentNew"
									name="guideContentNew" rows="5" required></textarea>
							</div>
							<div class="mb-3">
								<label for="guideFileNew" class="form-label">첨부파일</label>
								<div id="fileInputsContainerNew" class="sortable">
									<div class="sortable-item">
										<span class="drag-handle"><i class="fas fa-bars"></i></span> <input
											type="file" class="form-control col" id="guideFileNew"
											name="guideFileNew">
										<button type="button" class="btn btn-danger col-auto"
											onclick="removeFileInput(this)">제거</button>
									</div>
								</div>
							</div>
							<button type="button" class="btn btn-secondary mb-3"
								onclick="addFileInput('New')">다른 파일 추가</button>
							<div class="text-end mb-3">
								<button type="submit" class="btn btn-primary">예방요령 추가</button>
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
                $('#addGuideForm').toggle();
            }
        }

        function addFileInput(tabId) {
            const container = document.getElementById('fileInputsContainer' + tabId);
            const fileInputDiv = document.createElement('li');
            fileInputDiv.classList.add('sortable-item');
            fileInputDiv.innerHTML = `
                <span class="drag-handle"><i class="fas fa-bars"></i></span>
                <input type="file" class="form-control col" name="guideFile" accept="audio/*">
                <button type="button" class="btn btn-danger col-auto" onclick="removeFileInput(this)">제거</button>
            `;
            container.appendChild(fileInputDiv);
        }

        function removeFileInput(button) {
            const container = button.parentElement.parentElement;
            container.removeChild(button.parentElement);
        }

        function deleteGuide(guideId) {
            if (confirm("정말로 이 예방요령을 삭제하시겠습니까?")) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/deleteGuide',
                    type: 'POST',
                    data: { guideId: guideId },
                    success: function(response) {
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        alert("예방요령 삭제에 실패했습니다. 다시 시도해 주세요.");
                    }
                });
            }
        }
    </script>
</body>
</html>
