<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

<!-- Template Title
    ==================================================================-->
<title>KB스쿨</title>

<!-- Favicon Icon
    ==================================================-->
<link rel="shortcut icon"
    href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

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

<!-- Custom CSS for table styling -->
<style>
    .table {
        border-collapse: separate;
        border-spacing: 0;
        width: 100%;
        margin: 20px 0;
        font-size: 18px;
    }

    .table thead th {
        background-color: #F3EDE1;
        
        font-weight: bold;
        padding: 12px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .table tbody tr {
        background-color: #f9f9f9;
        transition: background-color 0.3s ease;
    }

    .table tbody tr:hover {
        background-color: #f1f1f1;
    }

    .table tbody td {
        padding: 12px;
        border-bottom: 1px solid #dee2e6;
    }

    .table th, .table td {
        text-align: center;
    }

    .table-hover tbody tr:hover td {
        background-color: #e2e6ea;
    }
</style>

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="preloader">
            <span></span> <span></span>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/header.jsp" %> 
    
    <!-- Promo Area Start -->
    <section class="promo-area" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="promo-wrap">
                        <h1 class="promo-title s-title">피해사례 공유</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">메인</a></li>
                                <li class="breadcrumb-item active" aria-current="page">소통창구</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Promo Area End -->

    <!-- Case Share Board Start -->
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="text-center mb-4">피해사례 공유 게시판</h2>
                <div class="text-end mb-3">
                    <a href="${pageContext.request.contextPath}/board/shareWrite" class="btn btn-primary">사례공유 글 작성</a>
                </div>
                <table class="table table-hover table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>제목</th>
                            <th>작성일시</th>
                            <th>작성자 ID</th>
                        </tr>
                    </thead>
                    <tbody>
    <c:set var="seenTitles" value="${empty seenTitles ? '' : seenTitles}" scope="page"/>
    <c:forEach var="share" items="${shareList}">
        <c:if test="${fn:contains(seenTitles, share.title) == false}">
            <tr>
                <td>${share.id}</td>
                <td><a href="detail?id=${share.id}">${share.title}</a></td>
                <td><fmt:formatDate value="${share.writetime}" pattern="yyyy-MM-dd HH:mm:ss" timeZone="UTC"/></td>
                <td>${share.userId}</td>
            </tr>
            <c:set var="seenTitles" value="${seenTitles},${share.title}" />
        </c:if>
    </c:forEach>
</tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Case Share Board End -->

    <%@ include file="/WEB-INF/views/footer.jsp" %> 

    <!--
Javascript
======================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.stellar.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.scrollUp.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.syotimer.min.js"/>"></script>
    <script src="<c:url value="/resources/js/wow.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.counterup.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
    <script src="<c:url value="/resources/js/isotope.pkgd.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.ajaxchimp.min.js"/>"></script>
    <script src="<c:url value="/resources/js/form.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>

</body>

</html>
