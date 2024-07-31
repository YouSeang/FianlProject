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
                         <h1 class="promo-title">금융영상</span></h1>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Promo Area End -->
 
 
     <!-- Blog Area End -->
    <section class="video-area section-padding">
            <div class="container">
                <div class="row g-5">
                   <c:forEach var="video" items="${videos}">
                        <div class="col-lg-4 col-sm-6">
                            <div class="single-article shadow bg-white">
                                <figure class="article-thumb">
                                    <video id="video-${video.id}" width="400" controls>
                                        <source src="${video.link}" type="video/mp4">
                                        Your browser does not support the video tag.
                                    </video>             
                                    <canvas id="thumbnail-${video.id}" width="400" height="300" style="display:none;"></canvas>
                                    
                                </figure> 
                                <div class="article-details">
                                    <h3 class="article-heading">
                                         <a href="${video.link}" target="_blank">
                                          <c:out value="${video.videoName}"/>
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
              
                
                <!-- Single Blog Item End -->
                
                
                <div class="col-lg-12">
                    <div class="pager text-center">
                        <a href="#" class="next-btn"> <i class="fa fa-angle-left"></i>
                        </a>
                        <span>1</span>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#" class="next-btn"> <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Area End -->
 
 


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

<script>
    function captureThumbnail(videoId, canvasId, imgId) {
        const video = document.getElementById(videoId);
        const canvas = document.getElementById(canvasId);
        const img = document.getElementById(imgId);
        const context = canvas.getContext('2d');

        video.addEventListener('loadeddata', () => {
            console.log(`Video ${videoId} loaded.`);
            // 특정 시점으로 이동 (예: 1초)
            video.currentTime = 1;
        }, { once: true });

        video.addEventListener('seeked', () => {
            console.log(`Video ${videoId} seeked to ${video.currentTime}.`);
            // 비디오의 현재 프레임을 캡처하여 캔버스에 그립니다
            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            // 캔버스를 이미지 URL로 변환합니다
            const dataURL = canvas.toDataURL('image/png');

            // 변환된 URL을 img 태그의 src로 설정합니다
            img.src = dataURL;
        }, { once: true });

        video.addEventListener('error', (e) => {
            console.error(`Error loading video ${videoId}:`, e);
        });
    }

    // 모든 비디오 요소에 대해 썸네일을 캡처합니다
    window.onload = function() {
        <c:forEach var="video" items="${videos}">
            captureThumbnail('video-${video.id}', 'thumbnail-${video.id}', 'img-thumbnail-${video.id}');
        </c:forEach>
    }
</script>
</body>

</html>