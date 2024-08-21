<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">

<!-- Template Title -->
<title>LocKB</title>

<!-- Favicon Icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Plugins CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">

<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- Theme CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- SweetAlert2 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!-- jQuery 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- SweetAlert2 JavaScript 추가 -->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}

.quiz_area {
	background-color: #fef6c2; /* 원하는 배경색으로 변경 */
}

.btn.custom-btn {
	padding: 100px 100px; /* 버튼 크기 조정 */
	font-size: 90px; /* 텍스트 크기 조정 */
	border-radius: 30px; /* 모서리 둥글게 조정 */
}

#quiz-question {
	font-size: 40px; /* 글자 크기 조정 */
	font-weight: bold; /* 볼드체 */
	text-align: center; /* 중간 정렬 */
	margin-bottom: 30px; /* 아래 내용과 마진 */
	font-family: 둘기마요_거친;
}

/* 기존 스타일 유지 */
.btn.custom-btn {
	padding: 70px 70px; /* 버튼 크기 조정 */
	font-size: 90px; /* 텍스트 크기 조정 */
	border-radius: 100px; /* 모서리 둥글게 조정 */
	background-color: #689dc9; /* 파란색 배경 */
	color: white; /* 텍스트 색상 흰색 */
	border: none; /* 테두리 제거 */
}

/* 마우스 오버 시 버튼 색상을 조금 더 진하게 */
.btn.custom-btn:hover {
	background-color: #1c81ce;
}
</style>

</head>

<body>

	<%@ include file="/WEB-INF/views/header0802.jsp"%>




	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/securebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							전세사기 <span>예방하기</span>
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

	<!-- Volunteer Area Start -->
	<section class="quiz_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="volunteer-wrap">
						<section class="quiz-area section-padding">
							<div class="quiz-container card p-4">
								<!-- 퀴즈 질문 섹션 -->
								<div id="prequiz-question" class="alert alert-info text-center"
									role="alert">
									<c:choose>
										<c:when test="${not empty quiz.imageUrl}">
											<c:out value="${quiz.imageUrl}" />
											<!-- 여기에 이미지 경로가 제대로 출력되는지 확인 -->
											<img id="quiz-image"
												src="/resources/images/secure/${quiz.imageUrl}"
												alt="Quiz Image"
												style="width: 200%; height: auto; max-width: 1500px; margin-top: 10px; display: block;">
										</c:when>
										<c:otherwise>
											<img id="quiz-image" style="display: none;">
										</c:otherwise>
									</c:choose>
									<h3 id="quiz-question" style="margin-top: 30px;">${quiz.question}</h3>
								</div>



								<!-- 퀴즈 버튼 섹션 -->
								<div class="quiz-buttons text-center">
									<button id="btn-true" class="btn custom-btn m-2"
										onclick="submitAnswer('O')">O</button>
									<button id="btn-false" class="btn custom-btn m-2"
										onclick="submitAnswer('X')">X</button>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
    let currentQuestionIndex = 0;
    let totalQuestions = 0; // 전체 퀴즈 수를 설정하세요
    let correctAnswers = 0;

    function loadQuestion(index) {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/getQuiz',
            type: 'GET',
            data: { index: index },
            success: function (data) {
                if (data) {
                    console.log("Quiz data:", data);

                    // 첫 번째 질문 로드 시 퀴즈 총 개수 설정
                    if (index === 0) {
                        totalQuestions = data.totalQuestions; 
                    }

                    // 이미지 처리
                    if (data.imageUrl) {
                        $('#quiz-image').attr('src', '${pageContext.request.contextPath}/resources/images/secure/' + data.imageUrl).show();
                    } else {
                        $('#quiz-image').hide();
                    }

                    // 질문 텍스트 업데이트
                    $('#quiz-question').text(data.question);
                    $('.quiz-buttons').show();
                } else {
                    $('#quiz-question').text('사전 체크 완료입니다! 이제 적정한 전세가격인지 확인해 볼까요?');
                    $('.quiz-buttons').hide();
                }
            },
            error: function() {
                console.error("Error loading question.");
            }
        });
    }


    function submitAnswer(answer) {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/checkAnswer',
            type: 'POST',
            data: { index: currentQuestionIndex, answer: answer },
            success: function (isCorrect) {
                if (isCorrect) {
                    correctAnswers++;
                    if (correctAnswers >= totalQuestions) { // 조건 확인
                        Swal.fire({
                            icon: 'success',
                            title: '네. 정답은 1번입니다!',
                            html: '<span style="font-size: larger;">사전 체크가 완료됐어요.<br>이제 내 전세가가 적정한 전세가격인지<br> 확인해보러 갈까요?</span><br>',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '${pageContext.request.contextPath}/calculate';
                            }
                        });
                    } else {
                        Swal.fire({
                            icon: 'success',
                            html: '<strong>적정합니다!<br>다음 단계를 확인하세요.</strong>',
                            confirmButtonText: '다음 질문으로'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                currentQuestionIndex++;
                                loadQuestion(currentQuestionIndex);
                            }
                        });
                    }
                } else {
                    if (currentQuestionIndex >= totalQuestions - 1) { // 마지막 질문이고, 틀린 경우
                        Swal.fire({
                            icon: 'error',
                            title: '아닙니다. 다시풀어보세요!',
                            html: '주택A의 임대인은, 대출금 2억 원과 보증금 2억 원을 통해 집값의 80%를 마련했어요. 대표적인 깡통주택 유형이죠. 반면에, 주택B의 임대인은 대출금 5천만원과 보증금 2억 원을 합쳐서 집값의 50%만이 타인의 돈으로 구성된 집을 갖고 있어요.',
                            confirmButtonText: '다시 풀기'
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            html: '<strong>앗! 전세계약 전 다시한번 확인하세요.</strong>',
                            confirmButtonText: '다시 풀기'
                        });
                    }
                }
            }
        });
    }



    $(document).ready(function () {
        loadQuestion(currentQuestionIndex);
    });

    </script>
	<!-- Volunteer Area End -->

	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Javascript -->
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
