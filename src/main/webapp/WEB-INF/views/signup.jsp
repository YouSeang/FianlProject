<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
    <meta name="author" content="Tariqul Islam">

    <!-- Template Title -->
    <title>LocKB</title>

    <!-- Favicon Icon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

    <!-- Style Libraries -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">



    <style>
        @font-face {
            font-family: 'Goorm Sans';
            font-weight: normal;
            font-style: normal;
        }
        body, h1, h2, h3, p, a {
            font-family: 'Goorm Sans' !important;
        }
    </style>
</head>
<body>

    <!-- header start -->
    <%@ include file="/WEB-INF/views/header0802.jsp" %> 

    <!-- Promo Area Start -->
    <section class="promo-area" data-stellar-background-ratio="0.5"
            style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/aboutbgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="promo-wrap">
                        <h1 class="promo-title">
                            LocKB <span> 회원가입</span>
                        </h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">LocKB</li>
                                <li class="breadcrumb-item"><a href="index.html">:락비</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Promo Area End -->

    <!-- Main Area Start -->
    <main class="main-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 mx-auto">
                    <div class="login-wrap bg-light">
                        <h2 class="h6 fw-normal mb-5">
                            <span class="fw-bold tex-primary d-block display-5"> 회원가입</span>
                        </h2>
                        <form id="signupForm" role="form" action="./signup" method="post" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="user_id">아이디 :</label> 
                                <input class="form-control" type="text" id="user_id" name="user_id">
                            </div>
                            <div class="form-group">
                                <label for="name">이름 :</label> 
                                <input id="name" class="form-control" type="text" name="name">
                            </div>
                            <div class="form-group">
                                <label for="email">이메일 :</label> 
                                <input class="form-control" type="email" id="email" name="email" placeholder="test@kb.com">
                            </div>
                            <div class="form-group">
                                <label for="phone_number">휴대폰번호 :</label> 
                                <input class="form-control" type="text" id="phone_number" name="phone_number" placeholder="010-1234-5678">
                            </div>
                            <div class="form-group">
                                <label for="password">비밀번호 :</label> 
                                <input class="form-control" type="password" id="password" name="password">
                            </div>
                            <div class="form-group">
                                <label for="pass-c">비밀번호 확인 :</label> 
                                <input class="form-control" type="password" id="pass-c">
                            </div>
                            <button class="custom-btn mt-3" type="submit">가입완료</button>
                            <div class="login-bottom mt-4">
                                <label><i class="fa fa-user me-2"></i> 계정이 이미 있으시다면 <a href="./loginView">로그인</a> 해주세요</label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- LOGING AREA END -->
        </div>
    </main>
    <!-- Main Area End -->

    <!-- Footer start-->
    <%@ include file="/WEB-INF/views/footer.jsp"%>
    <script src="<c:url value='/resources/js/sweetalert2.all.min.js'/>"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Show SweetAlert if there was an error -->
<c:if test="${not empty errorMessage}">
    <script>
        <c:choose>
            <c:when test="${errorMessage == 'duplicateId'}">
                Swal.fire({
                    icon: 'error',
                    title: '회원가입 오류',
                    text: '이미 가입된 ID입니다.',
                    confirmButtonText: '확인'
                });
            </c:when>
            <c:when test="${errorMessage == 'duplicateEmail'}">
                Swal.fire({
                    icon: 'error',
                    title: '회원가입 오류',
                    text: '이미 가입된 이메일입니다.',
                    confirmButtonText: '확인'
                });
            </c:when>
            <c:otherwise>
                Swal.fire({
                    icon: 'error',
                    title: '회원가입 오류',
                    text: '${errorMessage}',
                    confirmButtonText: '확인'
                });
            </c:otherwise>
        </c:choose>
    </script>
</c:if>

    <!-- Javascript -->
    <script>
        function validateForm() {
            let userId = document.getElementById("user_id").value.trim();
            let name = document.getElementById("name").value.trim();
            let email = document.getElementById("email").value.trim();
            let phoneNumber = document.getElementById("phone_number").value.trim();
            let password = document.getElementById("password").value.trim();
            let passwordConfirm = document.getElementById("pass-c").value.trim();

            if (!userId) {
                Swal.fire({
                    icon: 'error',
                    title: '아이디가 비어 있습니다.',
                    text: '아이디를 입력해 주세요.'
                });
                return false;
            }

            if (!name) {
                Swal.fire({
                    icon: 'error',
                    title: '이름이 비어 있습니다.',
                    text: '이름을 입력해 주세요.'
                });
                return false;
            }

            if (!email) {
                Swal.fire({
                    icon: 'error',
                    title: '이메일이 비어 있습니다.',
                    text: '이메일을 입력해 주세요.'
                });
                return false;
            }

            if (!phoneNumber) {
                Swal.fire({
                    icon: 'error',
                    title: '휴대폰번호가 비어 있습니다.',
                    text: '휴대폰번호를 입력해 주세요.'
                });
                return false;
            }

            if (!password) {
                Swal.fire({
                    icon: 'error',
                    title: '비밀번호가 비어 있습니다.',
                    text: '비밀번호를 입력해 주세요.'
                });
                return false;
            }

            if (!passwordConfirm) {
                Swal.fire({
                    icon: 'error',
                    title: '비밀번호 확인이 비어 있습니다.',
                    text: '비밀번호 확인을 입력해 주세요.'
                });
                return false;
            }

            if (password !== passwordConfirm) {
                Swal.fire({
                    icon: 'error',
                    title: '비밀번호 불일치',
                    text: '비밀번호가 일치하지 않습니다.'
                });
                return false;
            }

            return true;
        }
    </script>

    <!-- Additional JS libraries -->
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
    <%@ include file="/WEB-INF/views/chatbot.jsp"%>
</body>
</html>
