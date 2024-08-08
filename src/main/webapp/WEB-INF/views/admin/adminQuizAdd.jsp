<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Quiz Form">
    <meta name="author" content="Your Name">
    <title>Quiz Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <!-- Header Start -->
    <%@ include file="/WEB-INF/views/header0802.jsp" %> 

    <!-- Main Area Start -->
    <main class="main-content">
    <div class="container mt-5">
        <h2><c:choose><c:when test="${empty quiz.id}">퀴즈 추가</c:when><c:otherwise>퀴즈 수정</c:otherwise></c:choose></h2>
        <form action="${pageContext.request.contextPath}/admin/quizSave" method="post">
            <input type="hidden" id="quizId" name="id" value="${quiz.id}">
            <div class="mb-3">
                <label for="quizQuestion" class="form-label">퀴즈 문제</label>
                <input type="text" class="form-control" id="quizQuestion" name="question" value="${quiz.question}" required>
            </div>
            <!-- 카테고리 필드를 숨기고, 금융으로 고정 -->
            <input type="hidden" id="quizCategory" name="category" value="금융">
            <div class="mb-3">
                <label for="quizAnswer" class="form-label">퀴즈 정답</label>
                <select class="form-control" id="quizAnswer" name="answer" required>
                    <option value="true" ${quiz.answer == true ? 'selected' : ''}>O</option>
                    <option value="false" ${quiz.answer == false ? 'selected' : ''}>X</option>
                </select>
            </div>   
            <div class="mb-3">
                <label for="quizExplanation" class="form-label">문제 설명</label>
                <input type="text" class="form-control" id="quizExplanation" name="explanation" value="${quiz.explanation}" required>
            </div>
            <div class="mb-3">
                <label for="quizPoints" class="form-label">포인트</label>
                <input type="number" class="form-control" id="quizPoints" name="points" value="${quiz.points}" required>
            </div>
            <button type="submit" class="btn btn-primary">저장</button>
            <a href="${pageContext.request.contextPath}/admin/quiz" class="btn btn-secondary">취소</a>
        </form>
    </div>
</main>
    <!-- Main Area End -->

    <!-- Footer start-->
    <%@ include file="/WEB-INF/views/footer.jsp"%>

    <!-- Javascript -->
    <script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
     
</body>
</html>
