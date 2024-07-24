<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Admin Phishing Management">
    <meta name="author" content="Your Name">

    <!-- Template Title -->
    <title>Admin Phishing Management</title>

    <!-- Favicon Icon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .nav-tabs .nav-link.active {
            color: black;
        }
        .nav-tabs .nav-link {
            color: #007bff;
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
    <%@ include file="/WEB-INF/views/header.jsp"%>

    <!-- Main Area Start -->
    <main class="main-content">
        <div class="container mt-5">
            <h2>Phishing Scenario Management</h2>

            <!-- Right-aligned button -->
            <div class="text-end mb-3">
                <a id="addNewScenarioButton" class="btn btn-primary">Add New Scenario</a>
            </div>

            <!-- Tabs for scenarios -->
            <ul class="nav nav-tabs" id="scenarioTabs" role="tablist">
                <c:if test="${not empty scenarios}">
                    <c:forEach var="scenario" items="${scenarios}">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link ${scenario == scenarios[0] ? 'active' : ''}" id="scenario${scenario.id}-tab" data-toggle="tab" href="#scenario${scenario.id}" role="tab" aria-controls="scenario${scenario.id}" aria-selected="false">Scenario ${scenario.id}</a>
                        </li>
                    </c:forEach>
                </c:if>
                <c:if test="${empty scenarios}">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="newScenarioForm-tab" data-toggle="tab" href="#newScenarioForm" role="tab" aria-controls="newScenarioForm" aria-selected="true">Scenario 1</a>
                    </li>
                </c:if>
            </ul>
            <div class="tab-content" id="scenarioTabsContent">
                <c:if test="${not empty scenarios}">
                    <c:forEach var="scenario" items="${scenarios}">
                        <div class="tab-pane fade ${scenario == scenarios[0] ? 'show active' : ''}" id="scenario${scenario.id}" role="tabpanel" aria-labelledby="scenario${scenario.id}-tab">
                            <h3>Scenario ${scenario.id}</h3>
                            <p>Name: ${scenario.name}</p>
                            <p>Prompt: ${scenario.prompt}</p>
                            <p>Audio: <a href="${pageContext.request.contextPath}/resources/audios/${scenario.audioFile}">Play</a></p>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty scenarios}">
                    <div class="tab-pane fade show active" id="newScenarioForm" role="tabpanel" aria-labelledby="newScenarioForm-tab">
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
    <script src="<c:url value='/resources/js/jquery.magnific-popup.min.js'/>"></script>
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
                if (!$('#newScenarioForm-tab').length) {
                    const newTabId = $('#scenarioTabs li').length + 1;
                    const newTab = `<li class="nav-item" role="presentation">
                                        <a class="nav-link" id="newScenarioForm-tab" data-toggle="tab" href="#newScenarioForm" role="tab" aria-controls="newScenarioForm" aria-selected="false">Scenario ${newTabId}</a>
                                    </li>`;
                    $('#scenarioTabs').append(newTab);
                }
                $('#newScenarioForm-tab').tab('show');
            });

            // If there are no scenarios, show the form by default
            if ($('#scenarioTabs li').length === 1 && $('#scenarioTabs li a').attr('id') === 'newScenarioForm-tab') {
                $('#newScenarioForm-tab').tab('show');
            } else {
                $('#scenarioTabs li:first-child a').tab('show');
            }
        });
    </script>
</body>
</html>
