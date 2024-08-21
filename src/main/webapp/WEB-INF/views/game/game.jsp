<%@ page contentType="text/html; charset=UTF-8"%>
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
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- 비동기방식 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

.game_area {
	background-color: #fef6c2; /* 원하는 배경색으로 변경 */
}

#game {
	padding: 30px;
	background: #fff2cc; /* 퀴즈 배경색과 비슷한 색상으로 변경 */
	border-radius: 15px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.cell {
	display: inline-block;
	position: relative;
	width: 150px;
	height: 150px;
	overflow: hidden;
	background: url('<c:url value="/resources/images/game/mole-hole.png"/>')
		center center no-repeat;
	background-size: cover;
	margin: 5px;
}

.gopher, .bomb, .dead {
	width: 150px;
	height: 150px;
	bottom: 0;
	position: absolute;
	transition: bottom 1s;
}

.gopher {
	background: url('<c:url value="/resources/images/game/criminal.png"/>')
		center center no-repeat;
	background-size: cover;
}

.dead {
	background: url('<c:url value="/resources/images/game/criminal2.png"/>')
		center center no-repeat;
	background-size: cover;
}

.bomb {
	background: url('<c:url value="/resources/images/game/police.png"/>')
		center center no-repeat;
	background-size: cover;
}

.boom {
	background: url('<c:url value="/resources/images/game/explode.png"/>')
		center center no-repeat;
	background-size: cover;
}

.hidden {
	bottom: -150px;
}

#timer, #score {
	font-size: 30px;
	font-weight: bold;
}

#startButton, #resetButton {
	margin: 10px;
	padding: 10px 20px;
	font-size: 18px;
	border-radius: 5px;
	background-color: #f0a500; /* O, X 버튼 색상과 동일한 색상으로 변경 */
	color: white;
	border: none;
	transition: background-color 0.3s;
}

#startButton:hover, #resetButton:hover {
	background-color: #d48f00; /* O, X 버튼 색상과 동일한 색상으로 변경 */
}
</style>

</head>

<body>
	
	<jsp:include page="/WEB-INF/views/header0802.jsp" />

	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background: none; background-position: initial;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							범죄자 <span>잡기</span>
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item active" aria-current="page">LocKB</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo Area End -->

	<!-- Game Area Start -->
	<section class="game_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2">

					<div class="section-intro intro-full">
						<h2 class="section-title">
							<span class="color">범죄자</span> 잡기
						</h2>
						<h3>
							<strong>1점당 5포인트씩 적립됩니다.</strong>
						</h3>
						<p>포인트는 하루에 한번만 적립됩니다. 시작을 누르면 게임이 시작됩니다.</p>
					</div>

					<div id="game" class="text-center">
						<div>
							<span id="timer">60</span>초&nbsp; <span id="score">0</span>점
						</div>
						<div class="row mt-4 justify-content-center">
							<c:forEach var="row" begin="0" end="2">
								<div class="col-12 d-flex justify-content-center">
									<c:forEach var="col" begin="0" end="2">
										<div class="cell" data-index="${row * 3 + col}">
											<div class="gopher hidden"></div>
											<div class="bomb hidden"></div>
										</div>
									</c:forEach>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="text-center mt-4">
						<button id="startButton">시작</button>
						<button id="resetButton">재시작</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Game Area End -->

	<jsp:include page="/WEB-INF/views/footer.jsp" />

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
    const $$cells = document.querySelectorAll('.cell');
    let gameInterval;
    let gameStarted = false;
    let timer = 10;
    let score = 0;

    function tick() {
        if (timer <= 0) {
            endGame();  // 게임 종료 시 endGame 함수 호출
            return;
        }

        timer--;
        document.getElementById('timer').innerText = timer;

        // 모든 두더지와 폭탄을 숨긴 후 새로운 두더지와 폭탄을 표시
        $$cells.forEach(($cell) => {
            $cell.querySelector('.gopher').classList.add('hidden');
            $cell.querySelector('.bomb').classList.add('hidden');
        });

        // 새로운 두더지와 폭탄을 랜덤으로 표시
        $$cells.forEach(($cell) => {
            const randomValue = Math.random();
            if (randomValue < 0.3) {
                const $gopher = $cell.querySelector('.gopher');
                $gopher.classList.remove('hidden');
                setTimeout(() => {
                    $gopher.classList.add('hidden');
                }, 1000);
            } else if (randomValue < 0.5) {
                const $bomb = $cell.querySelector('.bomb');
                $bomb.classList.remove('hidden');
                setTimeout(() => {
                    $bomb.classList.add('hidden');
                }, 1000);
            }
        });
    }

    function endGame() {
        clearInterval(gameInterval);
        gameStarted = false;
        document.getElementById('startButton').disabled = false;
        
        // 서버에 점수 전송
        fetch('${pageContext.request.contextPath}/game/end', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ score: score })
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            
            // 포인트 적립 여부 안내 메시지와 함께 총점을 표시
            let message = '총점: ' + score + '점<br>' + data.message;  // 서버에서 반환된 메시지 포함

            Swal.fire({
                title: '게임 오버!',
                html: message,
                icon: 'success',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    // 페이지 리로드 또는 다른 액션을 원할 경우 이곳에서 처리
                    location.reload();  // 페이지를 리로드
                }
            });
        })
        .catch((error) => {
            console.error('Error:', error);
            Swal.fire({
                title: '오류 발생',
                text: '점수 전송 중 오류가 발생했습니다.',
                icon: 'error',
                confirmButtonText: '확인'
            });
        });
    }

    // 나머지 기존 게임 로직 코드 유지
    $$cells.forEach(($cell) => {
        $cell.querySelector('.gopher').addEventListener('click', (event) => {
            const $gopher = event.target;
            if (!$gopher.classList.contains('dead')) {
                score++;
                document.getElementById('score').innerText = score;
                $gopher.classList.add('dead');
                setTimeout(() => {
                    $gopher.classList.remove('dead');
                    $gopher.classList.add('hidden');
                }, 500);
            }
        });
        $cell.querySelector('.bomb').addEventListener('click', (event) => {
            const $bomb = event.target;
            $bomb.classList.add('boom');
            setTimeout(() => {
                $bomb.classList.remove('boom');
                $bomb.classList.add('hidden');
            }, 500);
        });
    });

    document.getElementById('startButton').addEventListener('click', (event) => {
        event.preventDefault();
        if (!gameStarted) {
            timer = 10;
            score = 0;
            document.getElementById('timer').innerText = timer;
            document.getElementById('score').innerText = score;
            document.getElementById('startButton').disabled = true;
            gameStarted = true;
            tick(); // 첫 번째 tick을 즉시 시작
            gameInterval = setInterval(tick, 1000); // 그 후 매 초마다 tick 실행
        }
    });

    document.getElementById('resetButton').addEventListener('click', (event) => {
        event.preventDefault();
        document.getElementById('timer').innerText = '10';
        document.getElementById('score').innerText = '0';
        document.getElementById('startButton').disabled = false;
        gameStarted = false;
        clearInterval(gameInterval);
        $$cells.forEach(($cell) => {
            $cell.querySelector('.gopher').classList.add('hidden');
            $cell.querySelector('.bomb').classList.add('hidden');
        });
    });
</script>
      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>

</html>
