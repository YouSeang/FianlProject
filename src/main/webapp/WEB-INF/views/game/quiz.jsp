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
<title>LocKB</title>

<!-- Favicon Icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">

<!-- Style Libraries -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.all.min.js"></script>
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

<!-- 비동기방식 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<style>
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
	<%@ include file="/WEB-INF/views/header0802.jsp" %> 




	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background: none; background-position: initial;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							OX <span> 퀴즈</span>
						</h1>
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

	<!-- Volunteer Area Start -->
	<section class="quiz_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="volunteer-wrap">



						<!-- Team Area Start -->
						<section class="quiz-area section-padding">
							<div class="container">
								<div class="row">
									<div class="col-lg-12">
										<div class="section-intro intro-full">
											<h2 class="section-title">
												<span class="color">금융 </span>OX 퀴즈
											</h2>
											<h3><strong>퀴즈를 풀고 금융지식을 올려요</strong></h3>
											<p>포인트는 하루에 한번만 적립됩니다.</p>
										</div>
									</div>
								</div>
								<div class="quiz-container card p-4">
									<!-- 카테고리 선택 섹션 -->
									<!--                 <div class="mb-3" style="display: none;">
                    <label for="quizCategory" class="form-label">카테고리</label>
                    <select class="form-control" id="quizCategory" disabled>
                        <option value="금융" selected>금융</option>
                    </select>
                </div> -->

								
									<!-- 퀴즈 질문 섹션 -->
									<div id="quiz-question" class="alert alert-info text-center"
										role="alert">
										<h3>퀴즈 질문이 여기에 표시됩니다.</h3>
									</div>
									
										<!-- 처음부터 다시풀기 버튼 추가 -->
									<div class="text-center mb-3">
										<button id="restart-quiz" class="custom-btn btn-warning m-2"
											onclick="restartQuiz()">처음부터 다시풀기</button>
									</div>
									
									
									<!-- 퀴즈 버튼 섹션 -->
									<div class="quiz-buttons text-center">
										<button id="btn-true" class="btn custom-btn m-2"
											style="display: none" onclick="checkAnswer('O')">O</button>
										<button id="btn-false" class="btn custom-btn m-2"
											style="display: none" onclick="checkAnswer('X')">X</button>
									</div>

									<!-- 다음 문제 및 다시 풀기 버튼 섹션 -->
									<div class="text-center mt-3">
										<button id="next-question" class="btn btn-primary m-2"
											style="display: none" onclick="loadNextQuestion()">다음
											문제로</button>
										<button id="retry-question" class="btn btn-secondary m-2"
											style="display: none" onclick="retryQuestion()">다시
											풀기</button>
									</div>
								</div>
							</div>
						</section>



					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Volunteer Area End -->




	<!-- Banner Area Start -->

	<!-- Banner Area End -->



	<!-- Team Area End -->

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

	<script>
    let currentQuestionIndex = 0;
    let score = 0;
    let questions = [];
    let userId = '<%=session.getAttribute("userId")%>'; // 로그인한 사용자 ID

    async function loadQuestions() {
        const category = '금융'; // 카테고리를 '금융'으로 고정
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
            document.getElementById('quiz-question').innerText = '금융 카테고리에 퀴즈가 없습니다.';
            document.getElementById('btn-true').style.display = 'none';
            document.getElementById('btn-false').style.display = 'none';
        }
    }

    function loadQuestion(index) {
        if (index < questions.length) {
            const quizQuestion = document.getElementById('quiz-question');
            quizQuestion.innerText = questions[index].question;
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
        const isCorrect = (answer === 'O' && question.answer) || (answer === 'X' && !question.answer);

        if (isCorrect) {
            score += question.points;

            if (userId !== null && userId !== '') { // 로그인한 경우
                Swal.fire({
                    icon: 'success',
                    title: '정답입니다!',
                    text: '누적 포인트: ' + score,
                    confirmButtonText: '다음 문제로'
                }).then((result) => {
                    if (result.isConfirmed) {
                        loadNextQuestion();
                    }
                });
                await updatePoints(question.points, '퀴즈 정답', question.id); // quizId를 함께 전송합니다.
            } else { // 로그인하지 않은 경우
                Swal.fire({
                    icon: 'success',
                    title: '정답입니다!',
                    text: '다음 문제로 넘어갑니다.',
                    confirmButtonText: '다음 문제로'
                }).then((result) => {
                    if (result.isConfirmed) {
                        loadNextQuestion();
                    }
                });
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: '오답입니다!',
                text: '설명: ' + question.explanation,
                showCancelButton: true,
                cancelButtonText: '다시 풀기'
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.cancel) {
                    retryQuestion();
                }
            });
        }
    }

    function loadNextQuestion() {
        currentQuestionIndex++;
        loadQuestion(currentQuestionIndex);
    }

    function retryQuestion() {
        loadQuestion(currentQuestionIndex);
    }

    async function updatePoints(points, reason, quizId) {
        const data = {
            pointsEarned: points,
            pointReason: reason,
            quizId: quizId // quizId를 함께 전송합니다.
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
    
    function restartQuiz() {
        currentQuestionIndex = 0;
        score = 0;
        loadQuestion(currentQuestionIndex);
    }

    // 초기 로드 시 금융 카테고리의 퀴즈를 로드합니다.
    loadQuestions();
</script>
</body>

</html>