<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="출석체크">
<meta name="author" content="Your Name">
<title>LocKB</title>
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
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">

<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<!-- Style css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}

.fc-daygrid-day-top {
	display: flex;
	justify-content: flex-end;
	align-items: flex-start;
	padding: 5px;
	position: absolute;
	top: 0;
	right: 0;
}

.fc-daygrid-day-frame {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	height: 100px; /* 각 셀의 높이를 동일하게 설정 */
	position: relative;
}

.fc-daygrid-event {
	background-color: transparent; /* 이벤트 배경색 제거 */
	border: none; /* 이벤트 테두리 제거 */
}

.fc-daygrid-event .fc-event-main {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px; /* 이미지 위쪽에 마진 추가 */
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
	<jsp:include page="/WEB-INF/views/header0802.jsp" />

	<!-- 배너영역 Start -->
	<section class="promo-area" data-stellar-background-ratio="0.5" 
	style="background-image: url('${pageContext.request.contextPath}/resources/images/bgimg/boardbgimg.jpg'); background-position: center; background-size: cover; background-attachment: fixed;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap">
						<h1 class="promo-title s-title">출석<span>체크</span></h1>
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
	<!-- 배너영역 End -->

	<!-- 출석체크영역 start -->
	<section class="donations-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-intro intro-full">
						<h2 class="section-title">
							LocKB <span class="color">출석체크</span>
						</h2>
						<p>매일 출석체크하고 포인트도 챙겨보세요!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div id="calendar" style="margin-top: 20px;"></div>
								<!-- 달력을 표시할 요소 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 출석체크영역 end -->

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!-- 로그인 상태 확인 스크립틀릿 -->
	<%
	Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
	if (isLoggedIn == null) {
		isLoggedIn = false;
	}
	String serverDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	%>
	<script>
        var isLoggedIn = <%=isLoggedIn%>;
        var serverDate = '<%=serverDate%>';

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                timeZone: 'Asia/Seoul',
                locale: 'ko',
                events: '${pageContext.request.contextPath}/getAttendance',
                dateClick: function(info) {
                    checkAttendance(info.dateStr);
                },
                eventContent: function(arg) {
                    if (arg.event.title === '출석체크') { // 이벤트 제목이 '출석체크'일 때만 이미지 표시
                        return { html: '<img src="${pageContext.request.contextPath}/resources/images/events/출석.png" style="width:80px;height:80px;"/>' };
                    }
                }
            });
            calendar.render();
        });

        function checkAttendance(dateStr) {
            if (!isLoggedIn) {
                Swal.fire({
                    title: '출석체크 실패',
                    text: '출석체크를 하려면 로그인이 필요합니다. 로그인 후 이용해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return;
            }

            // 오늘 날짜와 선택한 날짜 비교
            if (dateStr !== serverDate) {
                Swal.fire({
                    title: '출석체크 실패',
                    text: '출석체크는 오늘 날짜만 가능합니다.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return;
            }

            console.log("Sending dateStr: " + dateStr);
            $.ajax({
                url: "${pageContext.request.contextPath}/checkAttendance",
                method: "POST",
                data: { date: dateStr },
                success: function(response) {
                    if (isLoggedIn === true) {
                        // 로그인한 사용자만 포인트 업데이트
                        $.ajax({
                            url: "${pageContext.request.contextPath}/updatePoints",
                            method: "POST",
                            data: { pointReason: '출석체크' },
                            success: function(response) {
                                Swal.fire({
                                    title: '출석체크 완료!',
                                    text: '포인트 지급이 완료되었습니다.',
                                    icon: 'success',
                                    confirmButtonText: '확인'
                                }).then(() => {
                                    location.reload();
                                });
                            },
                            error: function(xhr, status, error) {
                                Swal.fire({
                                    title: '출석체크 완료',
                                    text: `포인트 지급이 완료되었습니다.: ${error}`,
                                    icon: 'error',
                                    confirmButtonText: '확인'
                                }).then(() => {
                                    location.reload();
                                });
                            }
                        });
                    } else {
                        Swal.fire({
                            title: '출석체크 완료!',
                            text: '오늘의 출석체크가 완료되었습니다.',
                            icon: 'success',
                            confirmButtonText: '확인'
                        }).then(() => {
                            location.reload();
                        });
                    }
                },
                error: function(xhr, status, error) {
                    Swal.fire({
                        title: '출석체크 실패',
                        text: `이미 출석체크가 완료되었습니다: ${error}`,
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        }
    </script>

	<!-- Javascript -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.stellar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrollUp.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.syotimer.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/wow.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/form.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
      	<%@ include file="/WEB-INF/views/chatbot.jsp"%> 
</body>
</html>
