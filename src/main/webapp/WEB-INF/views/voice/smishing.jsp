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

.custom-btn {
	margin-bottom: 10px; /* 버튼들 사이에 아래쪽 여백을 추가합니다. 값은 필요에 따라 조정하세요. */
}

.form-group {
	display: flex;
	flex-wrap: wrap;
	gap: 10px; /* 버튼들이 줄바꿈될 때 버튼들 사이의 간격을 설정합니다. */
}

.tooltip-icon-container {
    display: inline-flex;
    align-items: center;
    position: relative;
    margin-top: 10px; /* 리스트와의 간격을 조정 */
}

.info-text {
    margin-right: 8px;
    font-size: 14px;
    font-weight: bold;
    color: #333;
}

.info-icon {
    display: inline-block;
    width: 20px;
    height: 20px;
    background-color: #ccc; /* 배경색을 회색으로 변경 */
    color: #fff;
    text-align: center;
    line-height: 20px;
    border-radius: 50%;
    cursor: pointer;
    font-size: 14px;
    font-weight: bold;
}

.tooltip-container {
    position: absolute;
    display: none;
    bottom: 30px; /* 아이콘의 위쪽에 툴팁을 배치 */
    left: 0;
    z-index: 1000;
    width: 500px;
    padding: 10px;
    border: 1px solid #ddd;
    background-color: #fff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.tooltip-container::before {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 10px;
    border-width: 5px;
    border-style: solid;
    border-color: #ddd transparent transparent transparent;
}

.tooltip-image strong {
    display: block;
    margin-bottom: 5px;
    font-size: 16px;
}

.tooltip-image img {
    width: 100%;
    height: auto;
    border-radius: 8px;
}

.tooltip-icon-container:hover .tooltip-container {
    display: block;
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
                    let messageHtml = '문자가 성공적으로 발송되었습니다.';
                    if (response.isUserLoggedIn && response.pointUpdateResult) {
                        messageHtml += '<br>' + response.pointUpdateResult;
                    }

                    Swal.fire({
                        title: '문자 발송 성공!',
                        html: messageHtml,
                        icon: 'success',
                        confirmButtonText: '확인',
                        showDenyButton: true,
                        denyButtonText: '체험 다시하기'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = contextPath + "/voice/smishing";
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
	<!-- <div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div> -->
	<jsp:include page="/WEB-INF/views/header0802.jsp" />

	<!-- 배너영역 Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/securebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>스미싱</span> 시뮬레이션
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">

								<li class="breadcrumb-item active" aria-current="page">LocKB</li>
								<li class="breadcrumb-item"><a>:락비</a></li>
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
				<div class="col-lg-7 col-sm-6">
					<div class="about-txt">
						<h3 class="section-title mb-4">
							스미싱&nbsp;<span class="color"> 시뮬레이션 </span>
						</h3>
						<p>
						<h2>스미싱이란?</h2>
						<br /> 문자메시지(SMS)와 피싱(Phishing)의 합성어로, ① 가짜 문자메시지내 인터넷주소 클릭하면 → ②
						악성코드가 스마트폰에 설치되어 → ③ 피해자가 모르는 사이에 소액결제 피해 발생 또는 개인·금융정보 탈취하는 사기
						수법입니다.
						</p>
						<ul>
							<li>스미싱을 체험하고자 하는 휴대폰 번호 및 함께 전송하고 싶은 메시지가 있다면 입력 후
								'체험하기'버튼을 클릭하세요<br /> ex) '엄마, 요즘 이런식의 스미싱 문자가 유행이래 조심해!'
							</li>
							<li>해당 휴대폰번호로 발송되는 문자의 인터넷주소는 클릭하셔도 되지만, 실제 사례에서는 유의하세요.</li>
							<li>포인트는 하루에 한번만 지급됩니다.</li>
						</ul>

						<div class="tooltip-icon-container">
							<span class="info-text">예시 이미지</span> <span class="info-icon">?</span>
							<div class="tooltip-container">
								<div class="tooltip-image">
									<h3><strong>스미싱 문자전송 예시입니다.</strong></h3>
									<img
										src="${pageContext.request.contextPath}/resources/images/secure/smishing.png"
										alt="스미싱 시뮬레이션 이미지">
								</div>
							</div>
						</div>
						<div class="form-container">
							<h2>스미싱 시뮬레이션</h2>
							<div class="form-group">
								<label for="to">전송받을 휴대폰 번호: </label> <input type="text" id="to"
									name="to" placeholder="01012345678" required>
							</div>
							<div class="form-group">
								<label for="text">받는 분께 전할 메시지:</label>
								<textarea id="text" name="text"
									placeholder="받는 분께 보낼 메시지를 입력해주세요" required></textarea>
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
				<div class="col-lg-5 col-sm-8">
					<div class="ourself-gallery owl-carousel shadow">
						<div class="single-item">
							<figure>
								<img
									src="${pageContext.request.contextPath}/resources/images/incident/smishingimage.png"
									alt="">

							</figure>
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
