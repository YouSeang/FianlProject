<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Admin Phishing Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h2>Phishing Scenario Management</h2>

        <form action="${pageContext.request.contextPath}/admin/addScenario" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="scenarioName" class="form-label">Scenario Name</label>
                <input type="text" class="form-control" id="scenarioName" name="scenarioName" required>
            </div>
            <div class="mb-3">
                <label for="scenarioPrompt" class="form-label">Prompt</label>
                <textarea class="form-control" id="scenarioPrompt" name="scenarioPrompt" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label for="audioFile" class="form-label">Audio File</label>
                <input type="file" class="form-control" id="audioFile" name="audioFile" accept="audio/*" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Scenario</button>
        </form>

        <h3 class="mt-5">Existing Scenarios</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Scenario Name</th>
                    <th>Prompt</th>
                    <th>Audio File</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="scenario" items="${scenarios}">
                    <tr>
                        <td>${scenario.name}</td>
                        <td>${scenario.prompt}</td>
                        <td><a href="${pageContext.request.contextPath}/resources/audios/${scenario.audioFile}">Play</a></td>
                        <td>
                            <form action="${pageContext.request.contextPath}/admin/deleteScenario" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${scenario.id}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
