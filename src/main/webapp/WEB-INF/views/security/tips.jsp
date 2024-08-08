<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>LocKB</title>
</head>
<body>
    <h2>맞춤형 보안 팁</h2>
    <c:if test="${not empty tips}">
        <c:forEach var="tip" items="${tips}">
            <c:if test="${tip.count < 3}">
                <p>${tip.tip}</p>
            </c:if>
        </c:forEach>
    </c:if>
    <c:if test="${eventWinner}">
        <script>
            alert("축하합니다! 이벤트에 당첨되었습니다! 포인트 500점이 적립되었습니다.");
        </script>
    </c:if>
</body>
</html>
