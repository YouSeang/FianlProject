<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="관리자 피싱 관리">
    <meta name="author" content="Your Name">

    <title>관리자 피싱 관리</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <style>
        .scenario-card {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div id="preloader">
        <div class="preloader">
            <span></span> <span></span>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/header.jsp"%>

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
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/updateScenario" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="scenarioId" value="${scenario.id}">
                                <div class="mb-3">
                                    <label for="scenarioName${scenario.id}" class="form-label">시나리오 이름</label>
                                    <input type="text" class="form-control" id="scenarioName${scenario.id}" name="scenarioName" value="${scenario.scenarioName}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="scenarioPrompt${scenario.id}" class="form-label">프롬프트</label>
                                    <textarea class="form-control" id="scenarioPrompt${scenario.id}" name="scenarioPrompt" rows="5" required>${scenario.scenarioPrompt}</textarea>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">오디오 파일</label>
                                    <div id="fileInputsContainer${scenario.id}">
                                        <c:forEach var="audio" items="${scenario.audioFiles}">
                                            <div class="row align-items-center mb-2">
                                                <input type="hidden" name="existingAudioFiles" value="${audio.voicePath}">
                                                <input type="text" class="form-control col" value="${audio.voicePath}" readonly>
                                                <button type="button" class="btn btn-danger col-auto" onclick="removeFileInput(this)">제거</button>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-secondary mb-3" onclick="addFileInput('${scenario.id}')">다른 파일 추가</button>
                                <div class="text-end mb-3">
                                    <button type="submit" class="btn btn-primary">시나리오 업데이트</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div id="addScenarioForm" style="display:none;">
                <div class="card">
                    <div class="card-header">
                        <h5>새 시나리오 추가</h5>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/addScenario" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="scenarioNameNew" class="form-label">시나리오 이름</label>
                                <input type="text" class="form-control" id="scenarioNameNew" name="scenarioName" required>
                            </div>
                            <div class="mb-3">
                                <label for="scenarioPromptNew" class="form-label">프롬프트</label>
                                <textarea class="form-control" id="scenarioPromptNew" name="scenarioPrompt" rows="5" required></textarea>
                            </div>
                            <div id="fileInputsContainerNew" class="mb-3">
                                <label for="audioFileNew" class="form-label">오디오 파일</label>
                                <div class="row align-items-center">
                                    <input type="file" class="form-control col" id="audioFileNew" name="audioFiles" accept="audio/*">
                                    <button type="button" class="btn btn-danger col-auto" onclick="removeFileInput(this)">제거</button>
                                </div>
                            </div>
                            <button type="button" class="btn btn-secondary mb-3" onclick="addFileInput('New')">다른 파일 추가</button>
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
    <script>
        function toggleForm(formType) {
            if (formType === 'add') {
                $('#addScenarioForm').toggle();
            }
        }

        function addFileInput(tabId) {
            const container = document.getElementById('fileInputsContainer' + tabId);
            const fileInputDiv = document.createElement('div');
            fileInputDiv.classList.add('mb-3', 'row', 'align-items-center');

            const fileInput = document.createElement('input');
            fileInput.type = 'file';
            fileInput.className = 'form-control col';
            fileInput.name = 'audioFiles';
            fileInput.accept = 'audio/*';

            const removeButton = document.createElement('button');
            removeButton.type = 'button';
            removeButton.className = 'btn btn-danger col-auto';
            removeButton.innerText = '제거';
            removeButton.onclick = function() {
                container.removeChild(fileInputDiv);
            };

            fileInputDiv.appendChild(fileInput);
            fileInputDiv.appendChild(removeButton);
            container.appendChild(fileInputDiv);
        }

        function removeFileInput(button) {
            const container = button.parentElement.parentElement;
            container.removeChild(button.parentElement);
        }
    </script>
</body>
</html>
