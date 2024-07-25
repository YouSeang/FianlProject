<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Add New Scenario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <script>
        function addFileInput() {
            const container = document.getElementById('fileInputsContainer');
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
            <div id="fileInputsContainer" class="mb-3">
                <label for="audioFile" class="form-label">Audio File</label>
                <div class="row align-items-center">
                    <input type="file" class="form-control col" id="audioFile" name="audioFiles" accept="audio/*" required>
                    <button type="button" class="btn btn-danger col-auto" onclick="removeFileInput(this)">Remove</button>
                </div>
            </div>
            <button type="button" class="btn btn-secondary mb-3" onclick="addFileInput()">Add Another File</button>
            <div class="text-end mb-3">
                <button type="submit" class="btn btn-primary">Add Scenario</button>
            </div>
        </form>
    </div>
</body>
</html>
