<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Add New Scenario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Add New Scenario</h2>
        <form action="${pageContext.request.contextPath}/admin/addScenario" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="scenarioName" class="form-label">Scenario Name</label>
                <input type="text" class="form-control" id="scenarioName" name="scenarioName" required>
            </div>
            <div class="mb-3">
                <label for="scenarioPrompt" class="form-label">Prompt</label>
                <textarea class="form-control" id="scenarioPrompt" name="scenarioPrompt" rows="15" required></textarea>
            </div>
            <div class="mb-3">
                <label for="audioFile" class="form-label">Audio File</label>
                <input type="file" class="form-control" id="audioFile" name="audioFile" accept="audio/*" required>
            </div>
            <div class="text-end mb-3">
            	<button type="submit" class="btn btn-primary">Add Scenario</button>
            </div>
        </form>
    </div>
</body>
</html>
