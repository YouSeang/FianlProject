<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>KB큽스쿨 헤더</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">


<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">

<link rel="shortcut icon" href="/_static/steam/favicon.ico">

<link href="https://steam.kofac.re.kr/_static/steam/css/NotoSans.css"
	type="text/css" rel="stylesheet">
<link href="https://steam.kofac.re.kr/_static/steam/css/base.css?v=2"
	type="text/css" rel="stylesheet">
<link href="https://steam.kofac.re.kr/_static/steam/css/layout.css"
	type="text/css" rel="stylesheet">
<link href="https://steam.kofac.re.kr/_static/steam/css/slick.css"
	type="text/css" rel="stylesheet">
<link href="https://steam.kofac.re.kr/_static/steam/css/slick-theme.css"
	type="text/css" rel="stylesheet">
<!-- <link href="/_static/steam/css/owl_slider.css" type="text/css" rel="stylesheet"  /> -->
<link href="https://steam.kofac.re.kr/_static/steam/css/board.css"
	type="text/css" rel="stylesheet">
<link href="https://steam.kofac.re.kr/_static/steam/css/common.css"
	type="text/css" rel="stylesheet">
<!-- <link href="/_static/steam/css/main.css" type="text/css" rel="stylesheet"  /> -->
<!-- <link href="/_static/steam/css/sub.css" type="text/css" rel="stylesheet"  /> -->
<!-- <link href="/_static/steam/css/print.css" type="text/css" rel="stylesheet"  /> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=G-1YW3EM3JLF&amp;l=dataLayer&amp;cx=c"></script>
<script src="/_static/steam/js/jquery-1.12.4.min.js"
	type="text/javascript"></script>
<script
	src="https://steam.kofac.re.kr/_static/steam/js/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="https://steam.kofac.re.kr/_static/steam/js/slick.js"
	type="text/javascript"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.js"></script> -->
<script
	src="https://steam.kofac.re.kr/_static/steam/js/owl.carousel.min.js"
	type="text/javascript"></script>
<!-- <script src="/_static/steam/js/common.js?v=1" type="text/javascript"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js"></script>
<!--
항상 최신버전의 제이쿼리를 사용하고 싶을때
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
-->

<!-- BASE CSS -->
<link href="https://steam.kofac.re.kr/_static/steam/css/base.css?v=2"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">



<!-- BASE JS  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://steam.kofac.re.kr/_static/steam/js/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="https://steam.kofac.re.kr/_static/steam/js/common.js?v=1"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js"></script>

<!-- Main CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
<link href="https://steam.kofac.re.kr/_static/steam/css/main.css?v=5"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://steam.kofac.re.kr/_static/steam/css/popup.css">
<!-- Main JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script src="https://steam.kofac.re.kr/_static/steam/js/main.js?v=2"
	type="text/javascript"></script>

<!-- <script type="text/javascript">
	var _p = '100', _p_path = '/100/';
</script>

<script type="text/javascript">
	function goTop() {
		// document.body.scrollTop = 0;
		// document.documentElement.scrollTop = 0;
		$("html, body").animate({
			scrollTop : 0
		}, "200");
	}

	function goMove(pageUrl) {
		window.location.href = pageUrl;
	}
</script> -->
</head>


<body style="overflow: visible auto;">
	<div class="headerWrap">

		<div class="header">
			<div class="ht-menu">
				<ul>
					<li><a href="javascript:void(0)" onclick="sso_login();"
						class="head_pc" title="새창이동">로그인</a></li>
					<li><a
						href="https://logins.kofac.re.kr/ssoJoin.do?SITECODE=steam">회원가입</a></li>
				</ul>
			</div>
			<div class="menu_wrap">
				<div class="site_area">
					<div class="container">
						<div class="tit">전체메뉴</div>
						<div class="site_btm">
							<div class="site_scroll">
								<ul class="">
									<li>
										<div class="tit">사고예방</div>
										<ul class="site_gnb">
											<li><a href="/brd/board/204/L/menu/208">금융사고현황</a>
												<ul class="s_sub_list">
													<li><a href="/brd/board/204/L/menu/208">2024년</a></li>
													<li><a href="/bns/list/menu/209">2023년</a></li>
													<li><a
														href="https://lms.kofac.re.kr/front/trainapply/onlineList.do?menuSeq=10408&amp;groupSeq=1"
														target="_blank" title="새창">2022년</a></li>
													<li><a href="/brd/board/269/L/menu/211">2021년~</a></li>
													<li><a href="/cms/content/view/213">최신 사기기법 사례</a></li>
													<li><a href="/cms/content/view/214">금융사고예방 시뮬레이션</a></li>
												</ul></li>
											<li>
												<div class="tit">금융교육</div>
												<ul class="site_gnb">
													<li><a href="/learning/curriculum/list/menu/219">교과중심</a>
														<ul class="s_sub_list">
															<li><a href="/learning/curriculum/list/menu/219">초등학교</a></li>
															<li><a href="/learning/curriculum/list/menu/220">중학교</a></li>
															<li><a href="/learning/curriculum/list/menu/221">고등학교</a></li>
														</ul></li>
													<li><a href="/learning/curriculum/list/menu/223">창의적
															체험활동 중심</a>
														<ul class="s_sub_list">
															<li><a href="/learning/curriculum/list/menu/223">자율·자치
																	활동</a></li>
															<li><a href="/learning/curriculum/list/menu/224">동아리
																	활동</a></li>
															<li><a href="/learning/curriculum/list/menu/225">진로
																	활동</a></li>
														</ul></li>
													<li><a href="/learning/curriculum/list/menu/226">교내
															특별활동</a></li>
													<li><a href="/learning/curriculum/list/menu/520">교외
															체험활동</a>
														<ul class="s_sub_list">
															<li><a href="/learning/curriculum/list/menu/520">학교밖
																	프로그램</a></li>
															<li><a href="/brd/board/523/L/menu/518">운영기관현황</a></li>
														</ul></li>
												</ul>
											</li>
											<li>
												<div class="tit">나의보안</div>
												<ul class="site_gnb">
													<li><a href="/brd/board/257/L/menu/230">안내서</a></li>
													<li><a href="/brd/board/258/L/menu/231">연구보고서</a></li>
													<li><a href="/brd/board/259/L/menu/232">사례집</a></li>
													<li><a href="/brd/board/260/L/menu/233">영상 자료</a></li>
													<li><a href="/brd/board/261/L/menu/234">기타 자료</a></li>
												</ul>
											</li>
											<li>
												<div class="tit">소통마당</div>
												<ul class="site_gnb">
													<li><a href="/qna/list/menu/243">묻고 답하기</a></li>
													<li><a href="/community/list/menu/238">커뮤니티</a>
														<ul class="s_sub_list">
															<li><a href="/community/list/menu/238">학생
																	연구과제(R&amp;E)</a></li>
															<li><a href="/community/list/menu/239">교원연수</a></li>
															<li><a href="/community/list/menu/241">무한상상실</a></li>
															<li><a href="/community/list/menu/242">선도학교</a></li>
														</ul></li>
													<li><a href="/qna/mach/list/menu/524">전문가 찾기</a>
														<ul class="s_sub_list">
															<li><a href="/qna/mach/list/menu/524">전문가 매칭</a></li>
															<li><a href="/cms/content/view/245">전문가 정보</a></li>
															<li><a href="/expert/registration/form/menu/246">전문가
																	등록</a></li>
														</ul></li>
												</ul>
											</li>
											<li>
												<div class="tit">나의 공간</div>
												<ul class="site_gnb">
													<li><a href="/scp/my/list/menu/248">스크랩 자료</a></li>
													<li><a href="/scp/my/list/menu/249">내가 본 자료</a></li>
													<li><a href="/myp/qna/list/menu/250">내가 쓴 글</a></li>
													<li><a
														href="https://logins.kofac.re.kr/ssoMdfy.do?SITECODE=test_steam">개인정보
															관리</a>
														<ul class="s_sub_list">
															<li><a
																href="https://logins.kofac.re.kr/ssoMdfy.do?SITECODE=test_steam"
																target="_blank" title="새창">회원정보 수정</a></li>
															<li><a href="/mypage/expert/view/menu/252">전문가정보
																	수정</a></li>
														</ul></li>
												</ul>
											</li>
										</ul>
							</div>
						</div>
					</div>
					<!--gnb 햄버거 메뉴-->
					<div class="site_c">
						<button type="button" class="cheese">
							<span class="line"></span> <span class="line"></span> <span
								class="line"></span> <strong class="skip">전체 메뉴 닫힘</strong>
						</button>
					</div>
				</div>

			</div>



			<div class="gnbArea clearfix">
				<!--//로고 -->
				<h1 class="logo">
					<a href="/"><img src="resources/headerimages/logo.png" alt="KB큽스쿨"></a>
				</h1>
				<!-- 메인 gnb  -->
				<ul class="gnb">
					<li><a href="/brd/board/204/L/menu/208" id="gnb"
						data-menu-idx="206">사고예방</a>
						<div class="dropdown" style="">
							<div class="head">
								<strong class="tit">사고예방</strong>
								<p class="description">
									<img
										src="resources/headerimages/사고예방.png"
										alt=""> <span>금융사고예방을 위한 자료를 제공합니다.</span>
								</p>
							</div>

							<div class="body">
								<ul class="list depth2">
									<li>
										<div class="tit">
											<a href="/brd/board/204/L/menu/208" data-menu-idx="207">금융사고현황</a>
										</div>
										<ul class="h_sub_list">
											<li><a href="/brd/board/204/L/menu/208">2024년</a></li>
											<li><a href="/bns/list/menu/209">2023년</a></li>
											<li><a href="/brd/board/269/L/menu/211">2022년</a></li>
											<li><a href="/brd/board/269/L/menu/211">2021년~</a></li>
										</ul>
									</li>
									<li>
										<div class="tit">
											<a href="/cms/content/view/213" data-menu-idx="213">최신
												사기기법 사례</a>
										</div>
									</li>
									<li>
										<div class="tit">
											<a href="/cms/content/view/214" data-menu-idx="214">금융사고예방
												시뮬레이션</a>
											<ul class="h_sub_list">
												<li><a href="/brd/board/204/L/menu/208">메신저피싱</a></li>
												<li><a href="/bns/list/menu/209">보이스피싱</a></li>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div></li>
					<li class=""><a href="/learning/curriculum/list/menu/219"
						id="gnb" data-menu-idx="217" class="">금융교육</a>
						<div class="dropdown">
							<div class="head">
								<strong class="tit">금융교육</strong>
								<p class="description">
									<img
										src="resources/headerimages/금융교육.png"
										alt=""> <span>디지털금융을 배워볼 수 있습니다.</span>
								</p>
							</div>

							<div class="body">
								<ul class="list depth2">
									<li>
										<div class="tit">
											<a href="/learning/curriculum/list/menu/219"
												data-menu-idx="218">KB스타뱅킹 체험</a>
										</div>
										<ul class="h_sub_list">
											<li><a href="/learning/curriculum/list/menu/219">회원가입</a>
											</li>
											<li><a href="/learning/curriculum/list/menu/220">이체</a>
											</li>
											<li><a href="/learning/curriculum/list/menu/221">적금가입</a>
											</li>
										</ul>
									</li>
									<li>
										<div class="tit">
											<a href="/learning/curriculum/list/menu/223"
												data-menu-idx="222">인터넷뱅킹 체험</a>
										</div>
										<ul class="h_sub_list">
											<li><a href="/learning/curriculum/list/menu/223">회원가입</a></li>
											<li><a href="/learning/curriculum/list/menu/224">이체</a></li>
											<li><a href="/learning/curriculum/list/menu/225">적금가입</a></li>
										</ul>
									</li>
									<li>
										<div class="tit">
											<a href="/learning/curriculum/list/menu/226"
												data-menu-idx="226">금융퀴즈</a>
										</div>
									</li>
									<li>
										<div class="tit">
											<a href="/learning/curriculum/list/menu/520"
												data-menu-idx="227">교육영상</a>
										</div>
									</li>
								</ul>
							</div>
						</div></li>
					<li class=""><a href="/brd/board/257/L/menu/230" id="gnb"
						data-menu-idx="228" class="">나의보안</a>
						<div class="dropdown">
							<div class="head">
								<strong class="tit">나의보안</strong>
								<p class="description">
									<img
										src="resources/headerimages/나의보안.png"
										alt=""> <span>보안을 강화할 수 있는 방법을 제공하고 나의 보안점수를 확인할
										수 있습니다.</span>
								</p>
							</div>

							<div class="body">
								<ul class="list depth2">
									<li style="min-height: 62px;">
										<div class="tit">
											<a href="/brd/board/257/L/menu/230" data-menu-idx="230">보안강화방법</a>
										</div>
									</li>
									<li style="min-height: 62px;">
										<div class="tit">
											<a href="/brd/board/258/L/menu/231" data-menu-idx="231">나의
												보안점수</a>
										</div>
									</li>
								</ul>
							</div>
						</div></li>
					<li class=""><a href="/qna/list/menu/243" id="gnb"
						data-menu-idx="236" class="">소통마당</a>
						<div class="dropdown">
							<div class="head">
								<strong class="tit">소통마당</strong>
								<p class="description">
									<img
										src="resources/headerimages/소통창구.png"
										alt=""> <span>공지사항 및 이벤트를 확인하실 수 있습니다</span>
								</p>
							</div>

							<div class="body">
								<ul class="list depth2">
									<li>
										<div class="tit">
											<a href="/qna/list/menu/243" data-menu-idx="243">공지사항</a>
										</div>
									</li>
									<li>
										<div class="tit">
											<a href="/community/list/menu/238" data-menu-idx="237">이벤트</a>
										</div>
									</li>
								</ul>
							</div>
						</div></li>
				</ul>

			</div>
</body>

</html>