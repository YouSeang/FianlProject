<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>


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
    <script>
            function searchKeyword(keyword) {
                console.log('Searching for keyword:', keyword);
                fetch('/study/voice/search', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ keyword: keyword })
                })
                .then(response => {
                    console.log('Response status:', response.status);
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Data received:', data);
                    displayNews(data.newsList);
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
            }

            function displayNews(newsList) {
                const newsContainer = document.getElementById('news-container');
                newsContainer.innerHTML = '';

                newsList.forEach(news => {
                    const newsItem = document.createElement('div');
                    newsItem.innerHTML = `
                        <h3>${news.title}</h3>
                        <p>${news.description}</p>
                        <a href="${news.link}">Read more</a>
                        <img src="${news.imageUrl}" alt="News Image">
                    `;
                    newsContainer.appendChild(newsItem);
                });
            }
        </script>
    
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
                        <h1 class="promo-title">최근 <span>사기기법/사례</span></h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">메인</a></li>
                                <li class="breadcrumb-item active" aria-current="page">사고예방</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Promo Area End -->

    <!-- Our Causes Area Start -->
    
    <main class="main-content testimonial-page">
    
		<div class="container">
     <a class="custom-btn" onclick="searchKeyword('금융사고')">#금융사고</a>
    <a class="custom-btn" onclick="searchKeyword('금융사기')">#금융사기</a>
    <a class="custom-btn" onclick="searchKeyword('보이스피싱')">#보이스피싱</a>
    <a class="custom-btn" onclick="searchKeyword('메신저피싱')">#메신저피싱</a>
    <a class="custom-btn" onclick="searchKeyword('스미싱')">#스미싱</a>
    <a class="custom-btn" onclick="searchKeyword('대출사기')">#대출사기</a>

    <div id="news-container"></div>

      
			<div class="row">
			
				<div class="col-sm-12">
					<div class="single-testimonial">
						<div class="s-thumb">
						<ul>
                        <c:if test="${not empty newsList}">
                            <c:forEach var="news" items="${newsList}">
                             <li>
                             
						<img src="${news.imageUrl}" alt="News Image">
							<div class="s-details">
							<h3>  <a href="${news.link}" target="_blank">${news.title}</a></h3>
							<span class="status">${news.info}</span>
							<p>${news.description}</p>
							</li>
                            </c:forEach>
                        </c:if>
                    </ul>
							</div>
					</div>
				</div>
					<div class="col-lg-12">
					<div class="pager text-center">
						<a href="#" class="next-btn"> <i class="fa fa-angle-left"></i>
						</a> <span>1</span> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
						<a href="#">5</a> <a href="#" class="next-btn"> <i
							class="fa fa-angle-right"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		</main>
		
		

    <!-- Our Causes Area End -->

    

    
<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

    <!--
Javascript
======================================================== -->
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

</body>

</html>