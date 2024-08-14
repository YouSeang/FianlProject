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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- jQuery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- SweetAlert2 JavaScript 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

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
	padding: 130px 98px; /* 버튼 크기 조정 */
	font-size: 90px; /* 텍스트 크기 조정 */
	border-radius: 15px; /* 모서리 둥글게 조정 */
}

#quiz-question {
	font-size: 50px; /* 글자 크기 조정 */
	font-weight: bold; /* 볼드체 */
	text-align: center; /* 중간 정렬 */
	margin-bottom: 30px; /* 아래 내용과 마진 */
	font-family: 둘기마요_거친;
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




	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background: none; background-position: initial;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							전세사기 <span>예방하기</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">메인</a></li>
								<li class="breadcrumb-item active" aria-current="page">적정
									전세가 확인</li>
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
                                <div id="prequiz-question" class="alert alert-info text-center" role="alert">
                                    <h3 id="quiz-question">퀴즈 질문이 여기에 표시됩니다.</h3>
                                </div>

                                <!-- 퀴즈 버튼 섹션 -->
                                <div class="quiz-buttons text-center">
                                    <button id="btn-true" class="btn custom-btn m-2" onclick="submitAnswer('O')">O</button>
                                    <button id="btn-false" class="btn custom-btn m-2" onclick="submitAnswer('X')">X</button>
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
                    if (index === 0) {
                        // 첫 번째 질문 로드 시 퀴즈 총 개수 설정
                        totalQuestions = data.totalQuestions; // 서버에서 제공되는 totalQuestions 값으로 설정
                    }
                    $('#quiz-question').text(data.question);
                    $('.quiz-buttons').show();
                } else {
                    $('#quiz-question').text('사전 체크 완료입니다! 이제 적정한 전세가격인지 확인해 볼까요?');
                    $('.quiz-buttons').hide();
                }
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
                            title: '완료!',
                            text: '사전 체크를 완료했습니다. 이제 적정한 전세가격인지 확인해볼까요?',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '${pageContext.request.contextPath}/calculate';
                            }
                        });
                    } else {
                        Swal.fire({
                            icon: 'success',
                            title: '적정합니다! 다음 단계를 확인하세요.',
                            confirmButtonText: '다음 질문으로'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                currentQuestionIndex++;
                                loadQuestion(currentQuestionIndex);
                            }
                        });
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: '앗! 전세계약 전 다시한번 확인하세요.',
                        confirmButtonText: '다시 풀기'
                    });
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
