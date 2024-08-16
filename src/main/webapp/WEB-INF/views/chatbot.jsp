<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

<!-- Template Title
    ==================================================================-->
<title>LocKB</title>

<!-- Favicon Icon
    ==================================================-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Style Libraries
    ==================================================================-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<!-- Style css
    ==================================================================== -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<body>
        
<div id="frogue-container" class="position-right-bottom"
data-chatbot="356efa41-08e2-45a9-905c-75ede6cb677b"
data-service-type=""
data-user="사용자ID"
data-init-key="srststs@gmail.com"
data-close-use="Y" data-close-bgcolor="#ffffff" data-close-linecolor="#000000"
data-move-use="Y" data-move-bgcolor="#ffffff" data-move-linecolor="#000000"
></div>
<!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
<!-- data 속성 매뉴얼 https://doc.danbee.ai/channel_frogu.html -->
<script>
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https://frogue.danbee.ai/js/embed/v20220906/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));

document.addEventListener('DOMContentLoaded', function() {
    var frogueContainer = document.getElementById('frogue-container');
    var chatbotValueId = frogueContainer.getAttribute('data-chatbot');
    console.log('Chatbot ID:', chatbotValueId);

    var userValueId = frogueContainer.getAttribute('data-init-key');
    console.log('Init Key:', userValueId);
});
</script>
	
</body>
</html>
