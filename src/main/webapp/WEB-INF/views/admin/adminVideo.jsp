<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Admin Video Management">
    <meta name="author" content="Your Name">
    <title>Admin Video Management</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        .nav-tabs .nav-link.active {
            color: black;
        }
        .nav-tabs .nav-link {
            color: #007bff;
        }
        .tab-content {
            margin-top: 20px;
        }
        .thumbnail-img {
            display: block;
            margin-top: 10px;
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
<!-- <!-- Preloader
<div id="preloader">
    <div class="preloader">
        <span></span> <span></span>
    </div>
</div> -->

<!-- Header Start -->
<%@ include file="/WEB-INF/views/header.jsp"%>

<!-- Main Area Start -->
<main class="main-content">
    <div class="container mt-5">
        <h2>Video Management</h2>

        <!-- Right-aligned button -->
        <div class="text-end mb-3">
            <a href="${pageContext.request.contextPath}/admin/videoAdd" class="btn btn-primary">새 비디오 추가</a>
        </div>
        
        <!-- Video List -->
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
                                    <img id="img-thumbnail-${video.id}" class="thumbnail-img" src="" alt="Thumbnail">
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
                                    <a href="${pageContext.request.contextPath}/admin/videoEdit?id=${video.id}" class="btn btn-warning btn-sm">Edit</a>
                                    <form action="${pageContext.request.contextPath}/admin/videoDelete" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="${video.id}">
                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </div>
</main>
<!-- Main Area End -->

<!-- Footer start-->
<%@ include file="/WEB-INF/views/footer.jsp"%>

<!-- Javascript -->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
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
