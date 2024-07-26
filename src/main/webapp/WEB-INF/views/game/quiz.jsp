<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- 
================================================================================ -->
<!-- 비동기방식 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
                         <h1 class="promo-title">OX <span> 퀴즈</span></h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">메인</a></li>
                                <li class="breadcrumb-item active" aria-current="page">금융게임</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Promo Area End -->

    <!-- Team Area Start -->
    <section class="donations-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-intro intro-full">
                        <h2 class="section-title"> <span class="color">OX</span> 퀴즈</h2>
                        <p>퀴즈를 풀고 금융지식을 올려요</p>
                    </div>
                </div>
            </div>
             <div class="quiz-container">
                <div class="mb-3">
                    <label for="quizCategory" class="form-label">카테고리 선택</label>
                    <select class="form-control" id="quizCategory" onchange="loadQuestions()">
                        <option value="">카테고리 선택</option>
                        <option value="금융">금융</option>
                        <option value="사회">사회</option>
                        <option value="생활지식">생활지식</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
                <div id="quiz-question">퀴즈 질문이 여기에 표시됩니다.</div>
                <div class="quiz-buttons">
                    <button id="btn-true" style="display:none" onclick="checkAnswer('O')">O</button>
                    <button id="btn-false" style="display:none" onclick="checkAnswer('X')">X</button>
                </div>
                <div id="quiz-feedback"></div>
                <button id="next-question" style="display: none;" onclick="loadNextQuestion()">다음 문제로</button>
                <button id="retry-question" style="display: none;" onclick="retryQuestion()">다시 풀기</button>
            </div>
        </div>
    </section>
     
    <!-- Team Area End -->

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
        let currentQuestionIndex = 0;
        let score = 0;
        let questions = [];
        let userId = '<%= session.getAttribute("userId") %>'; // 로그인한 사용자 ID

        async function loadQuestions() {
            const category = document.getElementById('quizCategory').value;
            if (category) {
                const response = await fetch('${pageContext.request.contextPath}/game/quiz/category/' + category);
                questions = await response.json();
                console.log('Fetched Questions: ', questions); // Fetch 결과를 로그로 출력
                if (questions.length > 0) {
                    document.getElementById('btn-true').style.display = 'inline';
                    document.getElementById('btn-false').style.display = 'inline';
                    currentQuestionIndex = 0;
                    score = 0;
                    loadQuestion(currentQuestionIndex);
                } else {
                    document.getElementById('quiz-question').innerText = '선택한 카테고리에 퀴즈가 없습니다.';
                    document.getElementById('btn-true').style.display = 'none';
                    document.getElementById('btn-false').style.display = 'none';
                }
            }
        }

        function loadQuestion(index) {
            if (index < questions.length) {
                const quizQuestion = document.getElementById('quiz-question');
                quizQuestion.innerText = questions[index].question;
                document.getElementById('quiz-feedback').innerText = '';
                document.getElementById('next-question').style.display = 'none';
                document.getElementById('retry-question').style.display = 'none';
            } else {
            	document.getElementById('quiz-question').innerText = '퀴즈를 모두 완료했습니다!';
                document.getElementById('quiz-buttons').style.display = 'none';
                document.getElementById('next-question').style.display = 'none';
                document.getElementById('retry-question').style.display = 'none';
            }
        }

        async function checkAnswer(answer) {
            const question = questions[currentQuestionIndex];
            const feedback = document.getElementById('quiz-feedback');
            if ((answer === 'O' && question.answer) || (answer === 'X' && !question.answer)) {
                score += question.points;
                feedback.innerText = '정답입니다! 점수: ' + score;
                await updatePoints(question.points, '퀴즈 정답');
                document.getElementById('next-question').style.display = 'inline';
            } else {
                feedback.innerText = '오답입니다. 이유: ' + question.explanation;
                document.getElementById('retry-question').style.display = 'inline';
            }
        }

        function loadNextQuestion() {
            currentQuestionIndex++;
            loadQuestion(currentQuestionIndex);
        }

        function retryQuestion() {
            loadQuestion(currentQuestionIndex);
        }

        async function updatePoints(points, reason) {
            const data = {
                userId: userId,
                pointsEarned: points,
                pointReason: reason
            };
            const response = await fetch('${pageContext.request.contextPath}/game/quiz/points/update', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            });
            const result = await response.json();
            console.log(result.message);
        }

        // 초기 로드
        loadQuestion(currentQuestionIndex);
    </script>

</body>

</html>