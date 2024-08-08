<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">

<!-- Template Title -->
<title>스미싱</title>

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

<!-- Theme CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.form-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 600px;
}

.form-container h2 {
	margin-top: 0;
	color: #333;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-group textarea {
	resize: vertical;
	min-height: 100px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
        var contextPath = '${pageContext.request.contextPath}';
    </script>
<script>
    function sendSmishing(buttonType) {
        var formData = {
            to: $('#to').val(),
            text: $('#text').val(),
            buttonType: buttonType,
            pointReason: '스미싱 체험완료'
        };

        $.ajax({
            url: contextPath + '/sendSmishing',
            method: 'POST',
            data: formData,
            success: function(response) {
                if (response.isSent) {
                    Swal.fire({
                        title: '문자 발송 성공!',
                        text: '문자가 성공적으로 발송되었습니다. ' + response.pointUpdateResult,
                        icon: 'success',
                        confirmButtonText: '확인',
                        showDenyButton: true,
                        denyButtonText: '체험 다시하기'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: '포인트 업데이트 완료!',
                                text: response.pointUpdateResult,
                                icon: 'success'
                            }).then(() => {
                                window.location.href = contextPath + "/voice/smishing";
                            });
                        } else if (result.isDenied) {
                            location.reload();
                        }
                    });
                } else {
                    Swal.fire('문자 발송 실패', response.message || '문자 발송에 실패했습니다.', 'error');
                }
            },
            error: function(xhr, status, error) {
                Swal.fire('문자 발송 실패', `상태: ${status}, 오류: ${error}`, 'error');
            }
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
	<jsp:include page="/WEB-INF/views/header0802.jsp" />

	<!-- 배너영역 Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>스미싱</span> 시뮬레이션
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">smishing</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너영억 End -->

	<!-- Ourself Area Start -->
	<section class="ourself-area section-padding">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-sm-6">
					<div class="about-txt">
						<h3 class="section-title mb-4">
							스미싱<span class="color"> 시뮬레이션 </span>
						</h3>
						<p>
						<h2>스미싱이란?</h2>
						<br /> 문자메시지(SMS)와 피싱(Phishing)의 합성어로, ① 가짜 문자메시지내 인터넷주소 클릭하면 → ②
						악성코드가 스마트폰에 설치되어 → ③ 피해자가 모르는 사이에 소액결제 피해 발생 또는 개인·금융정보 탈취하는 사기
						수법입니다.
						</p>
						<ul>
							<li>스미싱을 체험하고자 하는 휴대폰 번호 및 함께 전송하고 싶은 메시지가 있다면 입력 후
								'체험하기'버튼을 클릭하세요<br /> ex) '어머니, 이런 문자를 받으시면 링크를 절대 클릭하시면 안돼요!'
							</li>
							<li>해당 휴대폰번호로 발송되는 문자의 인터넷주소는 클릭하셔도 되지만, 실제 사례에서는 유의하세요</li>
							<li>스미싱 시뮬레이션은 로그인 후 하루에 한 번만 가능합니다.</li>
						</ul>
						<div class="form-container">
							<h2>스미싱 시뮬레이션</h2>
							<div class="form-group">
								<label for="to">전송받을 휴대폰 번호: </label> <input type="text" id="to"
									name="to" required>
							</div>
							<div class="form-group">
								<label for="text">받는 분께 전할 메시지:</label>
								<textarea id="text" name="text" required></textarea>
							</div>


							<div class="form-group">
								<c:forEach var="scenario" items="${scenarios}">
									<button type="button" name="buttonType"
										value="${scenario.type}" class="custom-btn"
										onclick="sendSmishing('${scenario.type}')">${scenario.type}
										체험하기</button>
								</c:forEach>
							</div>
							<!-- <div class="form-group">
								<button type="button" name="buttonType" value="delivery"
									class="custom-btn" onclick="sendSmishing('delivery')">택배문자
									체험하기</button>
								<button type="button" name="buttonType" value="invitation"
									class="custom-btn" onclick="sendSmishing('invitation')">청접장문자
									체험하기</button>
							</div> -->
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div
						class="ourself-gallery owl-carousel shadow owl-loaded owl-drag">
						<div class="owl-stage-outer">
							<div class="owl-stage"
								style="transform: translate3d(-1072px, 0px, 0px); transition: all 0s ease 0s; width: 2680px;">
								<div class="owl-item cloned" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
								<div class="owl-item cloned" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
								<div class="owl-item active" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
								<div class="owl-item cloned" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is
												runningcpgjagkrl smoothly.</figcaption>
										</figure>
									</div>
								</div>
								<div class="owl-item cloned" style="width: 536px;">
									<div class="single-item">
										<figure>
											<img src="/study/resources/images/incident/voiceIntro.jpg"
												alt="">
											<figcaption>Education Proggrame is running
												smoothly.</figcaption>
										</figure>
									</div>
								</div>
							</div>
						</div>
						<div class="owl-nav disabled">
							<div class="owl-prev">
								<i class="fa fa-angle-left"></i>
							</div>
							<div class="owl-next">
								<i class="fa fa-angle-right"></i>
							</div>
						</div>
						<div class="owl-dots disabled"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Ourself Area End -->

	<!-- Footer start-->
	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!-- Javascript -->
	<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.stellar.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.scrollUp.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js' />"></script>
	<script
		src="<c:url value='/resources/js/jquery.magnific-popup.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.syotimer.min.js' />"></script>
	<script src="<c:url value='/resources/js/wow.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.counterup.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.waypoints.min.js' />"></script>
	<script src="<c:url value='/resources/js/isotope.pkgd.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.ajaxchimp.min.js' />"></script>
	<script src="<c:url value='/resources/js/form.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/resources/js/custom.js' />"></script>
</body>

</html>
