<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Admin Phishing Management">
<meta name="author" content="Your Name">

<!-- Template Title -->
<title>LocKB</title>

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
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- Theme CSS -->
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

.nav-tabs .nav-link.active {
	color: black;
}

.nav-tabs .nav-link {
	color: #007bff;
	margin-right: 5px; /* 간격 추가 */
}

.tab-content {
	margin-top: 20px;
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

	<!-- Header Start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- Main Area Start -->
	<main class="main-content">
		<div class="container mt-5">
			<h2>Phishing Scenario Management</h2>

			<!-- Right-aligned button -->
			<div class="text-end mb-3">
				<a id="addNewScenarioButton" class="btn btn-primary">Add New
					Scenario</a>
			</div>

			<!-- Tabs for scenarios -->
			<ul class="nav nav-tabs" id="scenarioTabs" role="tablist">
				<c:if test="${not empty scenarios}">
					<c:forEach var="scenario" items="${scenarios}">
						<li class="nav-item" role="presentation"><a
							class="nav-link ${scenario == scenarios[0] ? 'active' : ''}"
							id="scenario${scenario.id}-tab" data-toggle="tab"
							href="#scenario${scenario.id}" role="tab"
							aria-controls="scenario${scenario.id}"
							aria-selected="${scenario == scenarios[0] ? 'true' : 'false'}">${scenario.scenarioName}</a>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${empty scenarios}">
					<li class="nav-item" role="presentation"><a
						class="nav-link active" id="newScenarioForm-tab" data-toggle="tab"
						href="#newScenarioForm" role="tab" aria-controls="newScenarioForm"
						aria-selected="true">New Scenario</a></li>
				</c:if>
			</ul>
			<div class="tab-content" id="scenarioTabsContent">
				<c:if test="${not empty scenarios}">
					<c:forEach var="scenario" items="${scenarios}">
						<div
							class="tab-pane fade ${scenario == scenarios[0] ? 'show active' : ''}"
							id="scenario${scenario.id}" role="tabpanel"
							aria-labelledby="scenario${scenario.id}-tab">
							<%@ include file="/WEB-INF/views/admin/addPhishing.jsp"%>
							<script>
                                document.getElementById('scenarioName').value = "${scenario.scenarioName}";
                                document.getElementById('scenarioPrompt').value = "${scenario.scenarioPrompt}";
                                // Add logic for audio files if needed
                            </script>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty scenarios}">
					<div class="tab-pane fade show active" id="newScenarioForm"
						role="tabpanel" aria-labelledby="newScenarioForm-tab">
						<%@ include file="/WEB-INF/views/admin/addPhishing.jsp"%>
					</div>
				</c:if>
			</div>
		</div>
	</main>
	<!-- Main Area End -->

	<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.stellar.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.scrollUp.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
	<script
		src="<c:url value='/resources/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.syotimer.min.js'/>"></script>
	<script src="<c:url value='/resources/js/wow.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.counterup.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/resources/js/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.ajaxchimp.min.js'/>"></script>
	<script src="<c:url value='/resources/js/form.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.nice-select.min.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>

	<script>
        $(document).ready(function() {
            $('#addNewScenarioButton').click(function() {
                const newTabId = $('#scenarioTabs li').length + 1;
                const newTab = `
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="newScenarioForm${newTabId}-tab" data-toggle="tab" href="#newScenarioForm${newTabId}" role="tab" aria-controls="newScenarioForm${newTabId}" aria-selected="false">New Scenario ${newTabId}</a>
                    </li>`;
                $('#scenarioTabs').append(newTab);

                const newTabContent = `
                    <div class="tab-pane fade" id="newScenarioForm${newTabId}" role="tabpanel" aria-labelledby="newScenarioForm${newTabId}-tab">
                        <form action="${pageContext.request.contextPath}/admin/addScenario" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="scenarioName" class="form-label">Scenario Name</label>
                                <input type="text" class="form-control" id="scenarioName${newTabId}" name="scenarioName" required>
                            </div>
                            <div class="mb-3">
                                <label for="scenarioPrompt" class="form-label">Prompt</label>
                                <textarea class="form-control" id="scenarioPrompt${newTabId}" name="scenarioPrompt" rows="15" required></textarea>
                            </div>
                            <div id="fileInputsContainer${newTabId}" class="mb-3">
                                <label for="audioFile" class="form-label">Audio File</label>
                                <div class="row align-items-center">
                                    <input type="file" class="form-control col" id="audioFile${newTabId}" name="audioFiles" accept="audio/*" required>
                                    <button type="button" class="btn btn-danger col-auto" onclick="removeFileInput(this)">Remove</button>
                                </div>
                            </div>
                            <button type="button" class="btn btn-secondary mb-3" onclick="addFileInput(${newTabId})">Add Another File</button>
                            <div class="text-end mb-3">
                                <button type="submit" class="btn btn-primary">Add Scenario</button>
                            </div>
                        </form>
                    </div>`;
                $('#scenarioTabsContent').append(newTabContent);

                $(`#newScenarioForm${newTabId}-tab`).tab('show');
            });

            // If there are no scenarios, show the form by default
            if ($('#scenarioTabs li').length === 1 && $('#scenarioTabs li a').attr('id') === 'newScenarioForm-tab') {
                $('#newScenarioForm-tab').tab('show');
            } else {
                $('#scenarioTabs li:first-child a').tab('show');
            }
        });

        function addFileInput(tabId) {
            const container = document.getElementById(`fileInputsContainer${tabId}`);
            const fileInputDiv = document.createElement('div');
            fileInputDiv.classList.add('mb-3', 'row', 'align-items-center');

            const fileInput = document.createElement('input');
            fileInput.type = 'file';
            fileInput.className = 'form-control col';
            fileInput.name = 'audioFiles';
            fileInput.accept = 'audio/*';
            fileInput.required = true;

            const removeButton = document.createElement('button');
            removeButton.type = 'button';
            removeButton.className = 'btn btn-danger col-auto';
            removeButton.innerText = 'Remove';
            removeButton.onclick = function() {
                container.removeChild(fileInputDiv);
            };

            fileInputDiv.appendChild(fileInput);
            fileInputDiv.appendChild(removeButton);
            container.appendChild(fileInputDiv);
        }
    </script>
</body>
</html>

