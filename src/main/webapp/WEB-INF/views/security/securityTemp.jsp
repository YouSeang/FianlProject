<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>

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

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
/* Custom Styles */
.ks-cboxtags li {
	margin-bottom: 10px;
	list-style: none;
}

.ks-cboxtags input[type="checkbox"] {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	position: relative;
}

.ks-cboxtags input[type="checkbox"]::before {
	content: "";
	display: block;
	width: 100%;
	height: 100%;
	background-color: white;
	border: 2px solid #000;
	position: absolute;
	top: 0;
	left: 0;
}

.ks-cboxtags input[type="checkbox"]:checked::before {
	background-color: #ffb200;
	border-color: black;
}

.ks-cboxtags input[type="checkbox"]:checked::after {
	content: "";
	display: block;
	width: 5px;
	height: 10px;
	border: solid black;
	border-width: 0 3px 3px 0;
	position: absolute;
	top: 5px;
	left: 9px;
	transform: rotate(45deg);
}

.ks-cboxtags label {
	font-size: 20px;
}

/* Add margin between checkbox section and footer */
.ftco-section {
	margin-bottom: 50px;
	margin-top: 50px;
	font-family: 둘기마요_거친;
}

/* Add margin between checkbox section and header */
.promo-area {
	margin-bottom: 50px;
}

.donation-form {
    background-color: #f8f9fa; /* 연한 회색 배경 */
    padding: 20px; /* 내부 여백 조정 */
    border-radius: 8px;
    width: 120%; /* 폭을 100%로 설정 */
    max-width: 1200px; /* 최대 폭 설정 (필요 시 조정 가능) */
    margin: 0 auto; /* 가운데 정렬 */
}

.card {
	margin-bottom: 15px;
	border-radius: 8px;
}

.card-body {
	display: flex;
	align-items: center;
}

.submit-btn {
	background-color: #ffb200;
	border: 2px solid black;
	color: black;
	font-size: 22px;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	text-align: center;
	width: 100%;
}

.submit-btn:hover {
	background-color: #ff9900;
}

.separator {
    border-top: 2px solid #ddd;
    margin: 20px 0;
}

.no-wrap {
    white-space: nowrap;
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
	<%@ include file="/WEB-INF/views/header.jsp"%>



	<!-- Promo Area Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5" style="background: none; background-position: initial;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							<span>나의</span> 보안 점수
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">메인</a></li>
								<li class="breadcrumb-item active" aria-current="page">보안점수</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo Area End -->

<!-- Upcoming Event Area Start -->
    <section class="upcoming-events section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-intro">
                        <h2 class="section-title">나의 <span> 정보 보안 온도</span></h2>
                        				<div class="text-center">
					<h4 class="no-wrap justify-content-center">현재 실천하고 있는 것을 체크하고,확인하기 버튼을 눌러보세요.</h4>
				</div>
                    </div>
                </div>
            </div>
	<!-- Checkbox Section Start -->
	<section class="ftco-section">
		<div class="container">
			<div class="row">

			</div>
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="wrap w-100">


						<form action="${pageContext.request.contextPath}/submitChecklist"
							method="post">
							<div class="donation-form p-3 p-xl-4 rounded-6">
								<ul class="ks-cboxtags p-0 m-0">
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-1" name="category1[]"
													value="1"> <label for="category1-1" class="mb-0">스마트폰에 암호/패턴을 설정해 놓았다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-2" name="category1[]"
													value="1"> <label for="category1-2" class="mb-0">스미싱 문자 유포에 유의해 스미싱 차단 앱을 설치하였다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-3" name="category1[]"
													value="1"> <label for="category1-3" class="mb-0">스팸메세지 차단기능을 설정해 놓았다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-4" name="category1[]"
													value="1"> <label for="category1-4" class="mb-0">스마트폰 앱의 권한은 필요한 것만 허용을 해두었다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category1-5" name="category1[]"
													value="1"> <label for="category1-5" class="mb-0">소프트웨어를 항상 최신 버전으로 업데이트 해둔다.</label>
											</div>
										</div>
									</li>
									 <div class="separator"></div> <!-- 구분선 추가 -->
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-1" name="category2[]"
													value="1"> <label for="category2-1" class="mb-0">은행 어플에서 제공하는 입출금 알림서비스를 등록해 놓았다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-2" name="category2[]"
													value="1"> <label for="category2-2" class="mb-0">보안카드 번호 및 중요 개인정보가 휴대폰 사진첩에 저장 되어 있지 않다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-3" name="category2[]"
													value="1"> <label for="category2-3" class="mb-0">금융사 어플 비밀번호 혹은 패턴을 주기적으로 변경하고 있다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-4" name="category2[]"
													value="1"> <label for="category2-4" class="mb-0">계좌 비밀번호를 주기적으로 변경하고 있다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category2-5" name="category2[]"
													value="1"> <label for="category2-5" class="mb-0">택배 송장 정보는 떼어내고 폐기한다.</label>
											</div>
										</div>
									</li>
									
									<div class="separator"></div> <!-- 구분선 추가 -->
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-1" name="category3[]"
													value="1"> <label for="category3-1" class="mb-0">웹사이트 등에서 다운로드 받는 각종 프로그램의 출처 등 관련 정보를 확인한다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-2" name="category3[]"
													value="1"> <label for="category3-2" class="mb-0">공용 컴퓨터 등에서 업무 처리 후 계정 로그아웃을 생활화 한다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-3" name="category3[]"
													value="1"> <label for="category3-3" class="mb-0">기관에서 전송된 문자의 링크를 확인하지 않고는 클릭하지 않는다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-4" name="category3[]"
													value="1"> <label for="category3-4" class="mb-0">사용하고 있는 이메일 계정에 스팸 방지 기능을 설정해 두었다.</label>
											</div>
										</div>
									</li>
									<li>
										<div class="card">
											<div class="card-body">
												<input type="checkbox" id="category3-5" name="category3[]"
													value="1"> <label for="category3-5" class="mb-0">웹 사이트 등에서 다운로드 받는 각종 프로그램의 출처 등 관련 정보를 확인한다.</label>
											</div>
										</div>
									</li>
								</ul>
								<div class="text-center mt-4">
									<button type="submit" class="submit-btn">보안온도 확인하기</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Checkbox Section End -->
        </div>
    </section>
    <!-- Upcoming Event Area End -->



	<!-- Footer Area Start -->
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
