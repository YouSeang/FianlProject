<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
    <meta name="author" content="Tariqul Islam">

    <!-- Template Title -->
    <title>HelpPlus Charity Template</title>

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
</head>

<body>

    <%@ include file="header.jsp" %>

    <div class="container mt-5 mb-5">
        <div class="card">
            <div class="card-header text-center">
                <img src="${pageContext.request.contextPath}/resources/images/components/logo.png" alt="Logo" class="img-fluid" width="150">
            </div>
            <div class="card-body">
                <h5 class="card-title">내 정보</h5>
                <div class="table-responsive">
                    <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row">이름</th>
                                <td>파덕이</td>
                                <td rowspan="3"><button class="btn btn-warning">정보수정</button></td>
                            </tr>
                            <tr>
                                <th scope="row">Email</th>
                                <td>kb@test.com</td>
                            </tr>
                            <tr>
                                <th scope="row">아이디</th>
                                <td>Kookmin</td>
                            </tr>
                            <tr>
                                <th scope="row">휴대폰 번호</th>
                                <td>010-1234-5678</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <h5 class="card-title mt-4">내 현황</h5>
                <div class="table-responsive">
                    <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row">보유포인트</th>
                                <td>5760</td>
                                <td><button class="btn btn-warning">상세내역</button></td>
                            </tr>
                            <tr>
                                <th scope="row">보유쿠폰</th>
                                <td>0장</td>
                                <td><button class="btn btn-warning">상세내역</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <!-- Javascript -->
    <script src="<c:url value='/resources/js/jquery.min.js' />"></script>
    <script src="<c:url value='/resources/js/bootstrap.bundle.min.js' />"></script>
    <script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.stellar.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.scrollUp.min.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.easing.1.3.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.magnific-popup.min.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.syotimer.min.js' />"></script>
    <script src="<c:url value='/resources/js/wow.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.counterup.min.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.waypoints.min.js' />"></script>
    <script src="<c:url value='/resources/js/isotope.pkgd.min.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.ajaxchimp.min.js' />"></script>
    <script src="<c:url value='/resources/js/form.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
    <script src="<c:url value='/resources/js/custom.js' />"></script>

</body>
</html>
