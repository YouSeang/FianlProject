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

<!-- Template Titgle -->
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


<style type="text/css">
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}
</style>
</head>

<body>

	<!-- header start -->
	<%@ include file="/WEB-INF/views/header0802.jsp"%>

	<!-- Promo Area Start -->



	<section class="promo-area" data-stellar-background-ratio="0.5"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/securebgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title">
							금융&nbsp;<span>사고 현황</span>
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
	<!-- Promo Area End -->


	<!-- Main Area Start -->
	<main class="main-content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="single-product">
						<div class="row mb-5">
							<div class="col-lg-5 col-sm-6">
								<div class="sp-thumb">
									<img
										src="${pageContext.request.contextPath}/resources/
									images/incident/overView.png"
										alt="">
								</div>
							</div>
							<div class="col-lg-7 col-sm-6">
								<div class="sp-details">
									<h2>사기 유형별 현황</h2>
									<!-- <span class="pricing"><strong>Price:</strong> $120.50</span> -->
									<p>보이스피싱은 일반적으로 검찰, 경찰, 금융감독원 등을 사칭하고 의심계좌가 발견되었다며 수사를 할
										것처럼 겁을 주어 안전한 계좌로 돈을 이체 또는 전달하라는 ‘기관사칭형’과 저리에 대 출을 해주기 위해
										거래실적을 만들어야 한다거 나 추가 대출을 위해서는 기존 대출금을 모두 상 환해야 한다는 ‘대출사기형’이 가장
										대표적이다. 그 외에도 아들·딸 등 지인을 사칭하는 방법이 계속 유행하고 있으며, 그 당시의 사회적 이슈를
										이용하는 새로운 수법이 계속 생겨나고 있다. 예 를 들면, 최근에는 ‘재난지원금’, ‘대환대출’ 등을 받기
										위해서는 개인정보를 입력하고 관련 비용 을 먼저 납부해야 한다는 ‘선비용 수법(advance payment)’이
										활용되고 있다. ‘기관사칭형’과 ‘대 출사기형’은 보통 1:3의 비율로, ‘대출사기형’이 더 많이 발생하고
										있다. 즉, 코로나19 감염병 사 태로 인해 경제적 어려움을 겪고 있는 서민층들 에게 낮은 이자로 대출을 해줄
										것처럼 속이는 수 법이 검찰 등을 사칭하는 수법보다 3배 이상 더 많이 발생하고 있는 것이다(그림 X-19).</p>
									<p>소수에 불과하던 ‘대면편취’ 방식이 2020년 1만 5,686건으로 ‘비대면 편취’ 방식과 거의
										같아지더니, 2021년에는 2만 3,425건으로 ‘비대면편취’ 방식 7,557건보다 3배 이상 더 많이
										발생하였다</p>
									<div class="product-meta mt-4">
										<span class="me-3"><strong>출처:</strong> 금융감독원</span> <span><strong>주소:</strong>
											https://kostat.go.kr/</span>
									</div>
									<div class="s-cart d-flex">

										<!-- 				<div class="cart-cta ms-3">
											<button class="custom-btn unfill me-2">버튼1</button>
											<button class="custom-btn">버튼2</button>
										</div> -->
									</div>

								</div>
							</div>
						</div>
						<div class="row mb-5">
							<!-- Item Review Start -->
							<div class="col-lg-12">
								<div class="product-tab shadow-sm">
									<ul>
										<li class="active" data-tab="description">연도별 피해액</li>
										<li data-tab="extra-info" class="">유형별 규모</li>
										<li data-tab="review">최근 통계</li>
									</ul>
									<div class="tab-content">
										<div id="description">
											<div class="row">
												<div class="col-lg-7 order-2 order-lg-1">
													<div class="desc-txt pe-lg-5 me-lg-4">
														<h3>보이스피싱 피해액</h3>
														<p>보이스피싱 피해액을 연도별로 살펴보면, 2006년에는 106억 원, 2009년에는 621억
															원으 로 소폭 증가하다가 2011년 1,019억 원의 피해 가 발생해 최초로 1,000억 원을
															돌파하였다. 그 리고 2015년 2,040억 원, 2018년 4,040억 원, 2021년 7,744억
															원이 발생해 피해액이 계속 증 가하고 있다. 이처럼 매년 사건 발생 건수는 다 소 감소하거나 3만여
															건에서 정체되어 있지만, 피해액수가 계속 늘어난다는 점이 심각한 문제 다. 즉, 1건당 피해금액은
															2006년 712만 원, 2011년 1,236만 원, 2015년 1,100만 원으로 1,000만 원
															내외를 유지하다가 2019년 1,699만 원, 2020년 2,210만 원, 2021년에는 2,500만
															원으로 최고를 기록하였다. 이는 발생 건수의 경우 관계기관의 노력 등으로 감소하였으나, 범 인들이
															범행수법을 진화시키고 악성앱을 통해 피해자의 휴대폰을 원격조종하게 되면서 피해 금액이 늘어난 것으로
															분석할 수 있다. 2006년 부터 2021년까지 누적 피해금액은 3조 8,681억 원이다</p>
														<p>메신저피싱은 2020년 급격한 증가세를 보였 다. 경찰청 통계에 따르면 2019년
															2,963건이 발 생하였는데, 2020년에는 1만 3,224건으로 4.5배 증가하였고, 2021년에는
															1만 7,841건으로 빠르 게 증가하였다. 보이스피싱 콜센터 일당들도 코 로나19 감염병 사태로 인해
															음성보다는 메신저피 싱으로 이동한 것으로 추정할 수 있다. 연도별 피 해금액은 2020년 587억
															원에서 2021년 1,265억 원으로 크게 늘어났다. 2021년 기준 메신저피싱 1건당 피해금액은
															709만 원이다</p>
													</div>
												</div>
												<div class="col-lg-5 order-1 order-lg-2 mb-4 mb-lg-0">
													<img class="img-fluid"
														src="${pageContext.request.contextPath}/resources/images/incident/overView2.png"
														alt="Incident Overview">
												</div>
											</div>
										</div>
										<div id="extra-info">
											<h3>보이스피싱 유형별 통계</h3>
											<table class="table w-75">
												<thead>
													<tr>
														<th>구분</th>
														<th>기관사칭형_발생건수</th>
														<th>기관사칭형_피해액_억원</th>
														<th>기관사칭형_검거건수</th>
														<th>기관사칭형_검거인원</th>
														<th>대출사기형_발생건수</th>
														<th>대출사기형_피해액_억원</th>
														<th>대출사기형_검거건수</th>
														<th>대출사기형_검거인원</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2016</td>
														<td>3384</td>
														<td>541</td>
														<td>3860</td>
														<td>5682</td>
														<td>13656</td>
														<td>927</td>
														<td>7526</td>
														<td>9884</td>
													</tr>
													<tr>
														<td>2017</td>
														<td>5685</td>
														<td>967</td>
														<td>3776</td>
														<td>4925</td>
														<td>18574</td>
														<td>1503</td>
														<td>15842</td>
														<td>20548</td>
													</tr>
													<tr>
														<td>2018</td>
														<td>6221</td>
														<td>1430</td>
														<td>4673</td>
														<td>5491</td>
														<td>27911</td>
														<td>2610</td>
														<td>25279</td>
														<td>32133</td>
													</tr>
													<tr>
														<td>2019</td>
														<td>7219</td>
														<td>2506</td>
														<td>5487</td>
														<td>6045</td>
														<td>30448</td>
														<td>3892</td>
														<td>33791</td>
														<td>42668</td>
													</tr>
													<tr>
														<td>2020</td>
														<td>7844</td>
														<td>2144</td>
														<td>4297</td>
														<td>4797</td>
														<td>23837</td>
														<td>4856</td>
														<td>29754</td>
														<td>34527</td>
													</tr>
													<tr>
														<td>2021</td>
														<td>7017</td>
														<td>1741</td>
														<td>1954</td>
														<td>1895</td>
														<td>23965</td>
														<td>6003</td>
														<td>25693</td>
														<td>24502</td>
													</tr>
													<tr>
														<td>2022</td>
														<td>8930</td>
														<td>2077</td>
														<td>4103</td>
														<td>4500</td>
														<td>12902</td>
														<td>3361</td>
														<td>20419</td>
														<td>20530</td>
													</tr>
													<tr>
														<td>2023</td>
														<td>11314</td>
														<td>2364</td>
														<td>7352</td>
														<td>8039</td>
														<td>7588</td>
														<td>2108</td>
														<td>13639</td>
														<td>14347</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div id="review">
											<ol>
												<li>
													<article class="single-comment">
														<h3 class="name">최근 통계</h3>
														<div class="comment-thumb">
															<img
																src="${pageContext.request.contextPath}/resources/
															images/incident/phone.jpg"
																alt="Comment" style="width: 700px; height: auto; margin-right: 20px; margin-bottom: 20px;">
														</div>
														<div>

															<span class="date"><strong>작년 보이스피싱 피해자
																	1인당 1,700만원 피해, 전년比 1.5배↑ - 2023년 보이스피싱 피해현황 분석 -</strong></span>
															<p>□(피해규모)’23년 보이스피싱 피해액은 1,965억원으로 전년(1,451억원)보다
																514억원(35.4%) 증가 ◦피해자 수는 감소(10.2%↓)하였으나, 1천만원 이상 고액 피해사례가
																증가 □(피해구제)｢통합신고대응센터(☎112)｣ 개소에 따른 보이스피싱 구제절차 일원화 등으로 신속한
																지급정지가 가능해짐에 따라 환급률 개선*(7.1%p↑) * 피해금액 1,965억원 중 652억원이
																피해자에게 환급 □(유형별)주요 사기유형별 비중은 대출빙자형(35.2%)-가족·지인 사칭형
																메신저피싱(33.7%)-정부기관 사칭형(31.1%) 順* * 메신저피싱 피해는 크게 감소하였으나,
																정부기관 사칭형 및 대출빙자형 피해 증가 □(연령별)20대 이하(+139억원) 및
																30대(+135억원) 피해 크게 증가 □(권역별)사기이용계좌 중 인터넷전문은행 비중은 감소한 반면,
																상호금융조합 등 중소서민금융권 비중이 증가하는 등 풍선효과를 보임</p>

														</div>
													</article>
												</li>
											</ol>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-5 pb-4"></div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
	</main>
	<!-- Main Area End -->



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