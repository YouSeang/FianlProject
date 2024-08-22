<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

<title>LocKB</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
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
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/header0802.jsp"%>

		<section class="promo-area" data-stellar-background-ratio="0.5" 
	style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/financebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
	<div class="container">			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">금융영상</h1>
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

	<section class="video-area section-padding">
		<div class="container">
			<div class="row g-5">
				<c:forEach var="video" items="${videos}">
					<div class="col-lg-4 col-sm-6">
						<div class="single-article shadow bg-white">
							<figure class="article-thumb">
								<a href="${video.link}" target="_blank"
									onclick="handleVideoClick(${video.id}, this, ${video.points})">
									<img id="thumbnail-${video.id}"
									src="https://img.youtube.com/vi/${fn:substringAfter(video.link, 'embed/')}/0.jpg"
									width="400" height="300" alt="Video Thumbnail">
								</a>
							</figure>
							<div class="article-details">
								<h3 class="article-heading">
									<a href="${video.link}" target="_blank"
										onclick="handleVideoClick(${video.id}, this, ${video.points})">
										<c:out value="${video.videoName}" />
									</a>
								</h3>
								<ul class="article-meta">
									<li><i class="fa fa-eye"></i> 조회수 ${video.views}</li>
									<li><i class="fa fa-star"></i> 포인트 ${video.points}</li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			
		</div>
	</section>

	<%@ include file="/WEB-INF/views/footer.jsp"%>


	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.scrollUp.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.syotimer.min.js"/>"></script>
	<script src="<c:url value="/resources/js/wow.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.counterup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/isotope.pkgd.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.ajaxchimp.min.js"/>"></script>
	<script src="<c:url value="/resources/js/form.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/resources/js/custom.js"/>"></script>

	<script>
    let userId = '<%=session.getAttribute("userId")%>';
    
    function handleVideoClick(videoId, element, points) {
        var pointReason = "교육영상 ID:" + videoId + " 시청완료"; // 포인트 적립 사유
        
        // 조회수 증가 요청
        $.ajax({
            url: "${pageContext.request.contextPath}/edu/eduvideo/increaseViews", // 조회수 증가 엔드포인트
            type: "POST",
            data: {
                videoId: videoId
            },
            success: function(response) {
                console.log("조회수 증가 성공: " + response);

                // 조회수 증가 후 포인트 적립 요청
                $.ajax({
                    url: "${pageContext.request.contextPath}/edu/eduvideo/updatePoints", // 포인트 업데이트 엔드포인트
                    type: "POST",
                    data: JSON.stringify({
                        userId: userId,
                        pointsEarned: points,
                        pointReason: pointReason,
                        quizId: videoId // 비디오 ID 전달
                    }),
                    contentType: "application/json; charset=UTF-8",
                    success: function(response) {
                        console.log("포인트 적립 성공: " + response);
                        if (response.status === "success") {
                            Swal.fire({
                                title: '포인트 적립 성공',
                                text: response.message,
                                icon: 'success',
                                confirmButtonText: '확인'
                            });
                        } else {
                            Swal.fire({
                                title: '포인트 적립 실패',
                                text: response.message,
                                icon: 'error',
                                confirmButtonText: '확인'
                            });
                        }
                    },
                    error: function(error) {
                        console.log("포인트 적립 실패: ", error);
                        Swal.fire({
                            title: '포인트 적립 실패',
                            text: "포인트 적립에 실패했습니다. 다시 시도해 주세요.",
                            icon: 'error',
                            confirmButtonText: '확인'
                        });
                    }
                });
            },
            error: function(error) {
                console.log("조회수 증가 실패: ", error);
                Swal.fire({
                    title: '조회수 증가 실패',
                    text: "조회수 증가에 실패했습니다. 다시 시도해 주세요.",
                    icon: 'error',
                    confirmButtonText: '확인'
                });
            }
        });
    }
</script>
      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>

</html>
