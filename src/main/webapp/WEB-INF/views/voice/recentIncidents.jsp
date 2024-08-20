<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Tariqul Islam">

<title>LocKB</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="preconnect" href="https://statics.goorm.io" crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet" href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
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

.news-list {
	list-style-type: none;
	padding: 0;
}

.news-list li {
	display: flex;
	margin-bottom: 20px;
	padding: 15px;
	border-radius: 8px;
	background-color: #fff;
	box-shadow: 0 6px 10px rgba(0.1, 0.1, 0.1, 0.3);
}

.img-wrapper {
	flex: 1;
	max-width: 150px;
	margin-right: 15px;
}

.img-wrapper img {
	width: 100%;
	height: auto;
	display: block;
	border-radius: 8px;
}

.s-details {
	flex: 2;
}

.s-details h3 {
	margin-top: 0;
	font-size: 1.1rem;
}

.s-details p {
	margin-bottom: 0;
	color: #555;
	font-size: 0.9rem;
}

.s-details .status {
	font-size: 0.8rem;
	color: #999;
	display: block;
	margin-bottom: 10px;
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
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<section class="promo-area" data-stellar-background-ratio="0.5" style="background: none; background-position: initial;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							최근 <span>사기기법/사례</span>
						</h1>
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

	<main class="main-content testimonial-page">
		<div class="container">
			<div class="section-intro intro-full">
				<h3 class="section-title">최근 금융사고 뉴스</h3>
				<p>키워드로 뉴스내용을 확인해보세요.</p>
				<br><br>
				<a class="custom-btn" onclick="searchKeyword('금융사고')">#금융사고</a>
				<a class="custom-btn" onclick="searchKeyword('금융사기')">#금융사기</a>
				<a class="custom-btn" onclick="searchKeyword('보이스피싱')">#보이스피싱</a>
				<a class="custom-btn" onclick="searchKeyword('메신저피싱')">#메신저피싱</a>
				<a class="custom-btn" onclick="searchKeyword('스미싱')">#스미싱</a>
				<a class="custom-btn" onclick="searchKeyword('대출사기')">#대출사기</a><br><br>
			</div>

			<div class="col-sm-12">
				<div id="news-container"></div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="pager text-center">
				<a href="#" class="next-btn"><i class="fa fa-angle-left"></i></a> <span>1</span>
				<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
			</div>
		</div>
	</main>

	<!-- Footer start-->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

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

	<script>
		let currentKeyword = '금융사고'; // 기본 키워드 설정

		function searchKeyword(keyword, page = 1) {
			currentKeyword = keyword; // 현재 키워드를 저장
			console.log('Searching for keyword:', keyword, 'on page:', page);
			fetch('search', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({ keyword: keyword, page: page })
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
			console.log('Displaying news:', newsList);
			const newsContainer = document.getElementById('news-container');
			if (!newsContainer) {
				console.error('news-container element not found');
				return;
			}
			newsContainer.innerHTML = '';

			const ulElement = document.createElement('ul');
			ulElement.classList.add('news-list');
			
			newsList.forEach(news => {
				console.log('News item:', news);
				console.log('Image URL:', news.imageUrl); // Debugging line

				const liElement = document.createElement('li');

				const imgWrapper = document.createElement('div');
				imgWrapper.classList.add('img-wrapper');

				const imgElement = document.createElement('img');
				imgElement.src = news.imageUrl;
				imgElement.alt = "News Image";
				imgWrapper.appendChild(imgElement);

				liElement.appendChild(imgWrapper);

				const detailsDiv = document.createElement('div');
				detailsDiv.classList.add('s-details');

				const titleElement = document.createElement('h3');
				const linkElement = document.createElement('a');
				linkElement.href = news.link;
				linkElement.target = "_blank";
				linkElement.textContent = news.title;
				titleElement.appendChild(linkElement);
				detailsDiv.appendChild(titleElement);

				const infoElement = document.createElement('span');
				infoElement.classList.add('status');
				infoElement.textContent = news.info;
				detailsDiv.appendChild(infoElement);

				const descriptionElement = document.createElement('p');
				descriptionElement.textContent = news.description;
				detailsDiv.appendChild(descriptionElement);

				liElement.appendChild(detailsDiv);

				ulElement.appendChild(liElement);

				console.log('Appended news item:', liElement.innerHTML);
			});

			newsContainer.appendChild(ulElement);
			console.log('Final newsContainer innerHTML:', newsContainer.innerHTML);
		}

		window.onload = function() {
			searchKeyword('금융사고');
		}
	</script>
	      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>
</html>
