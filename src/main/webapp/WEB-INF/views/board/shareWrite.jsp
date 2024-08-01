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

<!-- Template Title -->
<title>KB스쿨</title>

<!-- Favicon Icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Style Libraries -->
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

<!-- Style css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<script>
var isLoggedIn = <c:out value="${sessionScope.isLoggedIn}" default="false" />;
</script>
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!-- Preloader
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div> -->
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
            <div class="col-lg-8 mx-auto">
                <h2 class="text-center mb-4">피해사례 작성</h2>
                <form action="${pageContext.request.contextPath}/board/shareWriteProcess" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="title" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="mb-3">
                        <label for="contents" class="form-label">내용</label>
                        <textarea class="form-control" id="contents" name="contents" rows="5" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">이미지 첨부 (선택)</label>
                        <input type="file" class="form-control" id="image" name="image">
                    </div>

   
<input type="hidden" name="userId" value="${sessionScope.userId}">

                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">작성하기</button>
                        <a href="${pageContext.request.contextPath}/board/share" class="btn btn-secondary">취소</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Case Share Board End -->
    
    <!-- FAQ AREA END -->

    <%@ include file="/WEB-INF/views/footer.jsp" %> 

    <!-- Javascript -->
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
