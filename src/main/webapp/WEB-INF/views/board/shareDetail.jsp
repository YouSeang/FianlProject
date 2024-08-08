<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
/* 스타일 전반적인 배경 및 텍스트 색상 설정 */
body {
    background-color: #f8f9fa; /* 부드러운 배경 색상 */
    color: #343a40; /* 다크 텍스트 색상 */
}

/* 카드의 그림자와 여백 추가 */
.card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 카드에 그림자 추가 */
    border-radius: 8px; /* 카드의 모서리를 둥글게 */
    overflow: hidden; /* 이미지가 둥근 모서리 안에 들어오게 */
    margin-bottom: 20px; /* 카드 간 간격 */
    background-color: #ffffff; /* 카드의 배경 색상 */
}

/* 카드 헤더 스타일 */
.card-header {
    background-color: #F3EDE1; /* 블루 배경 */
    /* color: #fff;  *//* 화이트 텍스트 */
    padding: 20px;
    font-weight: bold;
    font-size: 1.5rem;
}

/* 본문 스타일 */
.card-body {
    padding: 30px;
    font-size: 1rem;
}

/* 카드 본문 텍스트 */
.card-body p {
    margin-bottom: 20px;
    line-height: 1.6;
    font-size:1.5rem;
}

/* 카드 푸터 스타일 */
.card-footer {
    background-color: #f1f1f1; /* 약간 어두운 배경 */
    padding: 15px;
}

/* 버튼 스타일 */
/* .btn-secondary {
    background-color: #6c757d;
    border-color: #6c757d;
    color: #fff;
    transition: background-color 0.3s ease;
}

.btn-secondary:hover {
    background-color: #5a6268;
    border-color: #545b62; */
}

/* 이미지 스타일 */
.card-body img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    margin-bottom: 15px;
}

/* 텍스트 가운데 정렬 */
.text-center {
    text-align: center;
}

/* 프로모션 영역 스타일 */
.promo-area {
    background: url('../images/banner-bg.jpg') center center no-repeat;
    background-size: cover;
    color: #fff;
    padding: 60px 0;
}

.promo-title {
    font-size: 3rem;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.breadcrumb {
    background-color: transparent;
    padding: 0;
}

.breadcrumb-item a {
    color: #007bff;
    text-decoration: none;
}

.breadcrumb-item a:hover {
    text-decoration: underline;
}

</style>

</head>


<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>
  <%@ include file="/WEB-INF/views/header0802.jsp" %> 
	
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

    <!-- case share board -->
      <!-- Case Share Board Start -->
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="text-center mb-4">피해사례 상세보기</h2><br><br>
                <div class="card text-center">
                    <div class="card-header"><br>
                        <h3>${share.title}</h3><br>
                       <p class="text-muted text-end" style="font-size:1rem;">작성자: ${share.userId}<br>작성일시:   
                       <fmt:formatDate value="${share.writetime}" pattern="yyyy-MM-dd HH:mm:ss" timeZone="UTC"/></p>
                                          </div>
                    <div class="card-body">
                        <p>${share.contents}</p>
                        <c:if test="${not empty share.image}">
                            <img src="${pageContext.request.contextPath}/${share.image}" class="img-fluid" alt="관련 이미지">
                        </c:if>
                    </div>
                    <div class="card-footer text-end">
                        <a href="${pageContext.request.contextPath}/board/share" class="btn btn-secondary">목록으로 돌아가기</a>
                    </div>
                </div>
                
              <!-- 댓글 입력 폼 -->
<div class="card mt-4">
    
    <div class="card-body">
        <form id="commentForm" action="${pageContext.request.contextPath}/board/addComment" method="post">
            <input type="hidden" name="shareId" value="${share.id}">
            <input type="hidden" name="shareTitle" value="${share.title}">
            <input type="hidden" name="userId" value="${sessionScope.userId}">
            <div class="mb-3">
                <label for="commentContent" class="form-label">댓글 내용</label>
                <textarea class="form-control" id="commentContent" name="commentContent" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">댓글 달기</button>
        </form>
    </div>
</div>

            <!-- 댓글 리스트 -->
<div id="commentlist" style="margin-top: 20px;">
    <c:forEach var="comment" items="${commentlist}">
        <div class="card" style="margin-top: 10px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
            <div class="card-body" style="padding: 15px;">
                <p style="margin-bottom: 5px; font-size: 1rem;">${comment.contents}</p>
               <p style="margin: 0; color: #6c757d; text-align: right; font-size: 1rem;">
                    작성자: ${comment.userId} | 작성일시: 
                    <fmt:formatDate value="${comment.writetime}" pattern="yyyy-MM-dd HH:mm:ss" timeZone="UTC"/>
                </p>
            </div>
        </div>
    </c:forEach>
</div>


            </div>
        </div>
    </div>
    <!-- Case Share Board End -->
    
    <!-- FAQ AREA END -->

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