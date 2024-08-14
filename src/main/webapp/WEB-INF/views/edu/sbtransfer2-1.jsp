<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta charset="UTF-8">

<!-- jQuery 및 필요한 라이브러리 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/image-map-resizer/1.0.10/js/imageMapResizer.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- isLoggedIn 변수를 설정 -->
<script>
        var isLoggedIn = <c:out value="${sessionScope.isLoggedIn}" default="false" /> === "true";
    </script>

<title>LocKB</title>
<style>
/* 단계 표시 스타일 */
#step-indicator {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f0f0f0; /* 배경색 */
	font-size: 18px; /* 폰트 크기 */
	font-weight: bold;
	color: #333; /* 텍스트 색상 */
	padding: 10px 20px; /* 여백 */
	border-radius: 8px; /* 둥근 모서리 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 */
	margin-top: 20px; /* 위쪽 여백 */
	position: relative;
	max-width: 500px; /* 최대 너비 설정 */
	margin-left: auto; /* 가운데 정렬 */
	margin-right: auto; /* 가운데 정렬 */
}

/* 뒤로가기 버튼 스타일 */
#back-button {
	width: 30px; /* 버튼 크기 */
	height: 30px;
	margin-right: 10px; /* 텍스트와 이미지 간의 간격 */
	cursor: pointer;
}

/* 단계 텍스트 스타일 */
#step-text {
	text-align: center;
}

/* 단계 진행 바 스타일 */
#progress-bar {
	position: absolute;
	bottom: -5px; /* step-indicator의 아래쪽에 위치 */
	left: 0;
	width: 100%; /* step-indicator의 너비에 맞게 조정 */
	height: 4px;
	background-color: #ddd; /* 진행 바 배경색 */
	border-radius: 2px;
}

#progress-bar-fill {
	height: 100%;
	width: 0;
	background-color: #4caf50; /* 진행 바 채우기 색상 */
	border-radius: 2px;
	transition: width 0.3s ease;
}

#content {
	position: relative;
	width: 100%;
}

#main-image {
	width: 90%; /* 메인 이미지의 너비를 90%로 설정 */
	max-width: 90%; /* 최대 너비를 90%로 설정 */
	display: block;
	margin: 0 auto; /* 가운데 정렬 */
}

.display-area {
	position: absolute;
	border: 1px solid #000;
	display: none;
}

.display-text {
	font-size: 16px;
}

@media ( max-width : 767.98px) {
	.display-text {
		font-size: 12px;
	}
	#warning-text {
		font-size: 3px; /* 폰트 크기 더 줄이기 */
		padding: 3px; /* 패딩 더 줄이기 */
		top: 35%; /* 위치 더 위로 조정 */
		max-width: 90%; /* 최대 너비 줄이기 */
		line-height: 1.2; /* 줄 간격 줄이기 */
		box-shadow: none; /* 그림자 제거 */
		border: 1px solid red; /* 간단한 테두리 추가 */
	}
}
</style>
</head>
<body>


	<div id="step-indicator">
		<img id="back-button" src="/resources/images/transfer/back-button.png"
			alt="뒤로가기"> <span id="step-text">1단계 / 7단계</span>
		<div id="progress-bar">
			<div id="progress-bar-fill"></div>
		</div>
	</div>

	<div id="content">



		<img id="main-image"
			src="${pageContext.request.contextPath}/resources/images/transfer/transfer1.png"
			alt="" usemap="#photo">
		<map name="photo">
			<area id="area-1" target="_self" alt="" title="" href="#"
				coords="331,259,569,294" shape="rect">
			<area id="area-2" target="_self" alt="" title="" href="#"
				coords="262,33,637,256" shape="rect">
			<area id="area-3" target="_self" alt="" title="" href="#"
				coords="258,298,639,779" shape="rect">
		</map>

		<!-- 경고 문구를 추가 -->
		<div id="warning-text"
			style="display: none; position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); color: red; font-size: 15px; background: white; padding: 10px; font-weight: bold; max-width: 50%; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
			[잔액부족] <br />출금가능금액 5,760,803원
		</div>

		<!-- 입력계좌번호를 표시할 영역 -->
		<div id="display-area" class="display-area">
			<span id="display-text" class="display-text"></span>
		</div>

		<!-- 첫 번째 단계에서 입력한 계좌번호를 표시할 영역 -->
		<div id="display-area1" class="display-area">
			<span id="display-text1" class="display-text"></span>
		</div>

		<!-- 이체금액 입력 시 표시할 영역 -->
		<div id="display-area2" class="display-area">
			<span id="display-text2" class="display-text"></span>
		</div>

		<!-- 이체확인 페이지에서 받는 분 계좌 확인 영역 -->
		<div id="display-area3" class="display-area">
			<span id="display-text3" class="display-text"></span>
		</div>

		<!-- 이체확인 페이지에서 보내는 금액 확인 영역 -->
		<div id="display-area4" class="display-area">
			<span id="display-text4" class="display-text"></span>
		</div>

		<!-- 이체확인 상세페이지에서 보내는 금액 확인 영역 -->
		<div id="display-area5" class="display-area">
			<span id="display-text5" class="display-text"></span>
		</div>

		<!-- 이체완료페이지에서 보낸 금액 확인 영역 -->
		<div id="display-area6" class="display-area">
			<span id="display-text6" class="display-text"></span>
		</div>
	</div>



	<script>
    $(document).ready(function() {
    	var currentStep = 1; // 현재 단계를 추적하는 변수
    	
    	 // 페이지 로딩 시 초기 상태 설정
        $('#back-button').hide(); // 처음 페이지 로드 시 뒤로가기 버튼 숨기기
    	
    	
        // 이미지가 로드된 후 rwdImageMaps를 호출하여 반응형으로 설정
        $("#main-image").on('load', function() {
            $('img[usemap]').rwdImageMaps();
            resizeImageMap();
        }).each(function() {
            if(this.complete) $(this).trigger('load');
        });

        var inputaccountNum = ""; // 입력된 계좌번호를 저장할 변수
        var inputpay = ""; // 입력된 금액을 저장할 변수

        function resizeImageMap() {
            var img = $("#main-image");
            var imgWidth = img.width();
            var imgHeight = img.height();

            $('map area').each(function() {
                var originalCoords = $(this).data('coords');
                if (!originalCoords) {
                    originalCoords = $(this).attr('coords');
                    $(this).data('coords', originalCoords);
                }

                var coords = originalCoords.split(',').map(Number);
                var newCoords = coords.map(function(coord, index) {
                    return index % 2 === 0 ? (coord / img[0].naturalWidth) * imgWidth : (coord / img[0].naturalHeight) * imgHeight;
                });

                $(this).attr('coords', newCoords.join(','));
            });
        }

        function changeImage(newSrc, newMap, displayAreaCoords, displayAreaCoords1, displayAreaCoords2, displayAreaCoords3, displayAreaCoords4, displayAreaCoords5, displayAreaCoords6, keypadAreaCoords) {
            $("#main-image").fadeOut(200, function() {
                $(this).attr("src", newSrc).fadeIn(200);

                $(this).on('load', function() {
                    var $img = $(this);

                    // 새로운 맵이 있을 때 반응형으로 설정
                    if (newMap) {
                        $('map').html(newMap);
                        $('img[usemap]').rwdImageMaps(); // 새 맵을 반응형으로 설정
                    }

                    resizeImageMap(); // 이미지 크기에 따라 좌표 재설정

                    // 좌표를 반응형으로 업데이트
                    function updateAreaPosition(coords, selector) {
                        if (coords) {
                            var coordsArr = coords.split(',').map(Number);
                            var top = coordsArr[1] / $img[0].naturalHeight * 100;
                            var left = coordsArr[0] / $img[0].naturalWidth * 100;
                            var width = (coordsArr[2] - coordsArr[0]) / $img[0].naturalWidth * 100;
                            var height = (coordsArr[3] - coordsArr[1]) / $img[0].naturalHeight * 100;
                            $(selector).css({
                                top: top + '%',
                                left: left + '%',
                                width: width + '%',
                                height: height + '%'
                            }).show();
                        } else {
                            $(selector).hide();
                        }
                    }

                    updateAreaPosition(displayAreaCoords, "#display-area");
                    $("#display-text1").text(inputaccountNum);
                    updateAreaPosition(displayAreaCoords1, "#display-area1");
                    $("#display-text2").text(inputpay);
                    updateAreaPosition(displayAreaCoords2, "#display-area2");
                    $("#display-text3").text(inputaccountNum);
                    updateAreaPosition(displayAreaCoords3, "#display-area3");
                    $("#display-text4").text(inputpay);
                    updateAreaPosition(displayAreaCoords4, "#display-area4");
                    $("#display-text5").text(inputpay);
                    updateAreaPosition(displayAreaCoords5, "#display-area5");
                    $("#display-text6").text(inputpay);
                    updateAreaPosition(displayAreaCoords6, "#display-area6");
                    updateAreaPosition(keypadAreaCoords, "#keypad-area");
                });
            });
        }
        
        // 단계 업데이트 함수
       function updateStepIndicator() {
    $("#step-text").text(currentStep + "단계 / 7단계");
    if (currentStep === 1) {
        $('#back-button').hide(); // 1단계에서는 숨기기
    } else {
        $('#back-button').show(); // 2단계부터는 항상 표시
    }

    // 단계에 따른 진행 바 채우기
    var progress = ((currentStep - 1) / 6) * 100; // 7단계 중 1단계를 제외한 6단계로 계산
    $('#progress-bar-fill').css('width', progress + '%');
}
        
       // 포인트 업데이트 함수 추가
       function updatePoints() {
           $.ajax({
               url: "${pageContext.request.contextPath}/updatePoints",
               method: "POST",
               data: { pointReason: '스타뱅킹 이체 체험완료' },
               success: function (response) {
                   Swal.fire({
                       title: '포인트 업데이트 완료!',
                       text: response,
                       icon: 'success'
                   }).then(() => {
                       window.close();
                   });
               },
               error: function (xhr, status, error) {
                   console.error("Failed to update points. Status: " + status + ", Error: " + error);
                   Swal.fire({
                       title: '포인트 업데이트 실패',
                       text: `상태: ${status}, 오류: ${error}`,
                       icon: 'error'
                   }).then(() => {
                       window.close();
                   });
               }
           });
       }

        // 뒤로가기 버튼 클릭 이벤트
        $("#back-button").on("click", function() {
            if (currentStep > 1) {
                currentStep--;
                changeStep(currentStep);
                updateStepIndicator();
            }
        });

     // 단계 변경 함수
        function changeStep(step) {
            var newSrc;
            var newMap;

            switch (step) {
                case 1:
                    newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer1.png";
                    newMap = `
                        <area id="area-1" target="_self" alt="" title="" href="#" coords="331,259,569,294" shape="rect">
                        <area id="area-2" target="_self" alt="" title="" href="#" coords="262,33,637,256" shape="rect">
                        <area id="area-3" target="_self" alt="" title="" href="#" coords="258,298,639,779" shape="rect">
                    `;
                    break;
                case 2:
                    newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer2.png";
                    newMap = `
                        <area id="area-4" target="" alt="" title="" href="#" coords="258,119,637,164" shape="rect">
                        <area id="area-5" target="" alt="" title="" href="#" coords="257,31,641,94" shape="rect">
                        <area id="area-6" target="" alt="" title="" href="#" coords="259,173,638,786" shape="rect">
                    `;
                    break;
                case 3:
                    newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer3.png";
                    newMap = `
                        <area id="keypad-1" target="" alt="" title="" href="#" coords="266,495,375,550" shape="rect">
                        <area id="keypad-2" target="" alt="" title="" href="#" coords="387,496,500,550" shape="rect">
                        <area id="keypad-3" target="" alt="" title="" href="#" coords="513,498,620,550" shape="rect">
                        <area id="keypad-4" target="" alt="" title="" href="#" coords="265,555,375,604" shape="rect">
                        <area id="keypad-5" target="" alt="" title="" href="#" coords="387,554,500,603" shape="rect">
                        <area id="keypad-6" target="" alt="" title="" href="#" coords="513,554,619,603" shape="rect">
                        <area id="keypad-7" target="" alt="" title="" href="#" coords="267,610,373,657" shape="rect">
                        <area id="keypad-8" target="" alt="" title="" href="#" coords="386,610,499,656" shape="rect">
                        <area id="keypad-9" target="" alt="" title="" href="#" coords="512,612,617,655" shape="rect">
                        <area id="keypad-0" target="" alt="" title="" href="#" coords="386,664,498,708" shape="rect">
                        <area id="keypad-10" target="" alt="" title="" href="#" coords="527,665,619,709" shape="rect">
                        <area id="keypad-check" target="" alt="" title="" href="#" coords="259,728,635,784" shape="rect">
                    `;
                    break;
                // 이후 단계도 추가 가능
            }

            changeImage(newSrc, newMap);
        }
     

        // 첫 번째 이미지에서 다른 영역 클릭 시
        $(document).on('click', '#area-2, #area-3', function(event) {
            if ($("#main-image").attr("src").includes("transfer1.png")) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer1error.png";
                changeImage(newSrc);
            }
        });

        // 두 번째 이미지에서 다른 영역 클릭 시
        $(document).on('click', '#area-5, #area-6', function(event) {
            if ($("#main-image").attr("src").includes("transfer2.png")) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer2error.png";
                changeImage(newSrc);
            }
        });

        // 첫 번째 이미지 전환 이벤트
        $(document).on('click', '#area-1', function(event) {
        	event.preventDefault();
            currentStep = 2;
            updateStepIndicator();
            
            var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer2.png";
            var newMap = `
                <area id="area-4" target="" alt="" title="" href="#" coords="258,119,637,164" shape="rect">
                <area id="area-5" target="" alt="" title="" href="#" coords="257,31,641,94" shape="rect">
                <area id="area-6" target="" alt="" title="" href="#" coords="259,173,638,786" shape="rect">
            `;
            changeImage(newSrc, newMap);

            // 클릭 가능한 영역 숨기기
            $("#display-area").hide();
        });

        // 두 번째 이미지 전환 이벤트
        $(document).on('click', '#area-4', function(event) {
        	 event.preventDefault();
             currentStep = 3; // 현재 단계를 3로 설정
             updateStepIndicator(); // 단계 표시 업데이트
             
            var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer2-1.png";
            var newMap = `
                <area id="keypad-1" target="" alt="" title="" href="#" coords="266,495,375,550" shape="rect">
                <area id="keypad-2" target="" alt="" title="" href="#" coords="387,496,500,550" shape="rect">
                <area id="keypad-3" target="" alt="" title="" href="#" coords="513,498,620,550" shape="rect">
                <area id="keypad-4" target="" alt="" title="" href="#" coords="265,555,375,604" shape="rect">
                <area id="keypad-5" target="" alt="" title="" href="#" coords="387,554,500,603" shape="rect">
                <area id="keypad-6" target="" alt="" title="" href="#" coords="513,554,619,603" shape="rect">
                <area id="keypad-7" target="" alt="" title="" href="#" coords="267,610,373,657" shape="rect">
                <area id="keypad-8" target="" alt="" title="" href="#" coords="386,610,499,656" shape="rect">
                <area id="keypad-9" target="" alt="" title="" href="#" coords="512,612,617,655" shape="rect">
                <area id="keypad-0" target="" alt="" title="" href="#" coords="386,664,498,708" shape="rect">
                <area id="keypad-10" target="" alt="" title="" href="#" coords="527,665,619,709" shape="rect">
                <area id="keypad-check" target="" alt="" title="" href="#" coords="259,728,635,784" shape="rect">
            `;
            var displayAreaCoords = "298,130,595,162"; // display-area의 위치와 크기를 설정
            var keypadAreaCoords = "281,124,612,163"; // keypad-area의 위치와 크기를 설정

            changeImage(newSrc, newMap, displayAreaCoords, null, null, null, null, null, null, keypadAreaCoords);
        });

     // 클릭 가능한 영역 클릭 시 숫자 처리 (계좌번호입력)
        var inputpay = "";
        $(document).on('click', 'area', function(event) {
            event.preventDefault();
            var areaId = $(this).attr('id');
            var value = ''; // 기본값은 빈 문자열

            // 현재 이미지에 따라 숫자 처리 구분
            var currentSrc = $("#main-image").attr("src");
            var isAccountInput = currentSrc.includes("transfer2-1.png") || currentSrc.includes("transfer3error.png");

            // 클릭한 영역의 ID에 따라 값을 설정
            if (areaId === 'keypad-1') value = '1';
            if (areaId === 'keypad-2') value = '2';
            if (areaId === 'keypad-3') value = '3';
            if (areaId === 'keypad-4') value = '4';
            if (areaId === 'keypad-5') value = '5';
            if (areaId === 'keypad-6') value = '6';
            if (areaId === 'keypad-7') value = '7';
            if (areaId === 'keypad-8') value = '8';
            if (areaId === 'keypad-9') value = '9';
            if (areaId === 'keypad-0') value = '0';

            // 금액 특수 영역 처리
             // keypad-total의 경우 금액을 초기화하고 설정된 total 금액으로 초기화
    if (areaId === 'keypad-total') {
        inputpay = '5760803';
    }
            if (areaId === 'keypad-100man') value = '1000000';
            if (areaId === 'keypad-10man') value = '100000';
            if (areaId === 'keypad-5man') value = '50000';
            if (areaId === 'keypad-1man') value = '10000';

            // keypad-10의 경우 마지막 숫자를 제거
            if (areaId === 'keypad-10') {
                if (isAccountInput) {
                    inputaccountNum = inputaccountNum.slice(0, -1);
                    $("#display-text").text(inputaccountNum);
                } else {
                    inputpay = inputpay.slice(0, -1);
                    $("#display-text2").text(inputpay);
                }
            } else {
                // 다른 숫자 키패드
                if (isAccountInput) {
                    inputaccountNum += value;
                    $("#display-text").text(inputaccountNum);
                } else {
                    // 금액 입력 시, 누른 값에 따라 처리
                    if (['keypad-100man', 'keypad-10man', 'keypad-5man', 'keypad-1man'].includes(areaId)) {
                        // 특수영역 클릭 시 현재 금액에 더함
                        var currentAmount = parseInt(inputpay.replace(/,/g, '')) || 0;
                        var addedAmount = parseInt(value) || 0;
                        inputpay = (currentAmount + addedAmount).toString();
                    } else {
                        // 숫자 클릭 시 누적
                        inputpay = (inputpay || '') + value;
                    }
                    // 천 단위 콤마 추가
                    inputpay = parseInt(inputpay.replace(/,/g, '') || 0).toLocaleString();
                    $("#display-text2").text(inputpay);
                }
            }
            
            // 초기 상태에서 inputpay가 빈 문자열이면 "0"으로 표시
            if (!inputpay) {
                $("#display-text2").text("0");
            }
        });

     // 세 번째 이미지 전환 이벤트 (계좌번호 입력 화면에서 다음 단계로)
        $(document).on('click', '#keypad-check', function(event) {
        	event.preventDefault();
            currentStep = 4; // 현재 단계를 4으로 설정
            updateStepIndicator(); // 단계 표시 업데이트
            
            if (inputaccountNum === "") {
                // 계좌번호가 입력되지 않은 경우 오류 이미지 표시
                var errorSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer3error.png"; // 오류 이미지 경로
                var errorMap = `
                    <area id="keypad-1" target="" alt="" title="" href="#" coords="293,124,589,160" shape="rect">
                    <area id="keypad-2" target="" alt="" title="" href="#" coords="258,487,637,733" shape="rect">
                    <area id="keypad-3" target="" alt="" title="" href="#" coords="369,548,272,503" shape="rect">
                    <area id="keypad-4" target="" alt="" title="" href="#" coords="265,555,375,604" shape="rect">
                    <area id="keypad-5" target="" alt="" title="" href="#" coords="387,554,500,603" shape="rect">
                    <area id="keypad-6" target="" alt="" title="" href="#" coords="513,554,619,603" shape="rect">
                    <area id="keypad-7" target="" alt="" title="" href="#" coords="267,610,373,657" shape="rect">
                    <area id="keypad-8" target="" alt="" title="" href="#" coords="386,610,499,656" shape="rect">
                    <area id="keypad-9" target="" alt="" title="" href="#" coords="512,612,617,655" shape="rect">
                    <area id="keypad-0" target="" alt="" title="" href="#" coords="386,664,498,708" shape="rect">
                    <area id="keypad-10" target="" alt="" title="" href="#" coords="527,665,619,709" shape="rect">
                    <area id="keypad-check" target="" alt="" title="" href="#" coords="259,728,635,784" shape="rect">
                `; // 오류 화면에서도 키패드 영역 활성화
                var displayAreaCoords = "293,124,589,160"; // display-area1의 위치와 크기를 설정
                var keypadAreaCoords = "254,487,633,733"; // keypad-area의 위치와 크기를 설정

                changeImage(errorSrc, errorMap, displayAreaCoords, null, null, null, null, null, null, keypadAreaCoords);  // 오류 이미지를 표시하고 키패드 활성화
            } else {
                // 계좌번호가 입력된 경우 정상적으로 다음 이미지로 전환
                var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer3.png";
                var newMap = `
                    <area id="keypad-1" target="" alt="" title="" href="#" coords="266,495,375,550" shape="rect">
                    <area id="keypad-2" target="" alt="" title="" href="#" coords="387,496,500,550" shape="rect">
                    <area id="keypad-3" target="" alt="" title="" href="#" coords="513,498,620,550" shape="rect">
                    <area id="keypad-4" target="" alt="" title="" href="#" coords="265,555,375,604" shape="rect">
                    <area id="keypad-5" target="" alt="" title="" href="#" coords="387,554,500,603" shape="rect">
                    <area id="keypad-6" target="" alt="" title="" href="#" coords="513,554,619,603" shape="rect">
                    <area id="keypad-7" target="" alt="" title="" href="#" coords="267,610,373,657" shape="rect">
                    <area id="keypad-8" target="" alt="" title="" href="#" coords="386,610,499,656" shape="rect">
                    <area id="keypad-9" target="" alt="" title="" href="#" coords="512,612,617,655" shape="rect">
                    <area id="keypad-0" target="" alt="" title="" href="#" coords="386,664,498,708" shape="rect">
                    <area id="keypad-10" target="" alt="" title="" href="#" coords="527,665,619,709" shape="rect">
                    <area id="keypad-00" target="" alt="" title="" href="#" coords="276,665,369,710" shape="rect">
                    <area id="keypad-total" target="" alt="" title="" href="#" coords="283,452,344,482" shape="rect">
                    <area id="keypad-100man" target="" alt="" title="" href="#" coords="348,453,412,482" shape="rect">
                    <area id="keypad-10man" target="" alt="" title="" href="#" coords="415,453,477,483" shape="rect">
                    <area id="keypad-5man" target="" alt="" title="" href="#" coords="482,452,542,482" shape="rect">
                    <area id="keypad-1man" target="" alt="" title="" href="#" coords="549,452,611,483" shape="rect">
                    <area id="keypad-next" target="" alt="" title="" href="#" coords="259,728,635,784" shape="rect">
                `;
                var displayAreaCoords1 = "342,110,527,128"; // display-area1의 위치와 크기를 설정
                var displayAreaCoords2 = "374,186,463,210"; // display-area2의 위치와 크기를 설정
                var keypadAreaCoords = "281,124,612,163"; // keypad-area의 위치와 크기를 설정
                
                changeImage(newSrc, newMap, null, displayAreaCoords1, displayAreaCoords2, null, null, null, null, keypadAreaCoords);
            }
        });
        
     // 네 번째 이미지 전환 이벤트 (금액 입력 후 '확인'버튼 클릭')
        $(document).on('click', '#keypad-next', function(event) {
        	  event.preventDefault();
              currentStep = 5; // 현재 단계를 5로 설정
              updateStepIndicator(); // 단계 표시 업데이트

            var maxAmount = 5760803; // 출금 가능 최대 금액
            var currentAmount = parseInt(inputpay.replace(/,/g, '')) || 0;

            if (currentAmount > maxAmount) {
                // 금액이 초과되었을 때 경고 문구 표시
                $("#warning-text").text("[잔액이 부족합니다]").show();
            } else {
                // 정상적인 금액일 때만 다음 이미지로 전환
                var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer4.png";
                var newMap = `
                    <area id="area-7" target="" alt="" title="" href="#" coords="257,728,635,784" shape="rect">
                `;
                var displayAreaCoords3 = "343,172,533,193"; // display-area3의 위치와 크기를 설정
                var displayAreaCoords4 = "352,269,478,299"; // display-area4의 위치와 크기를 설정
                var keypadAreaCoords = ""; // keypad-area의 위치와 크기를 설정

                changeImage(newSrc, newMap, null, null, null, displayAreaCoords3, displayAreaCoords4, null, null, keypadAreaCoords);

                // 클릭 가능한 영역 숨기기
                $("#display-area").hide();

                // 경고 문구 숨기기 (혹시 표시되어 있으면)
                $("#warning-text").hide();
            }
        });
        
        // 다섯 번째 이미지 전환 이벤트 (이체정보 확인 후 '다음' 버튼 클릭 시)
        $(document).on('click', '#area-7', function(event) {
        	 event.preventDefault();
             currentStep = 6; // 현재 단계를 6로 설정
             updateStepIndicator(); // 단계 표시 업데이트
             
            var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer5.png";
            var newMap = `
                <area id="area-8" target="" alt="" title="" href="#" coords="257,728,635,784" shape="rect">
            `;
            var displayAreaCoords3 = "343,172,533,193"; // display-area3의 위치와 크기를 설정
            var displayAreaCoords4 = "352,269,478,299"; // display-area4의 위치와 크기를 설정
            var displayAreaCoords5 = "316,582,404,604"; // display-area5의 위치와 크기를 설정
            var keypadAreaCoords = ""; // keypad-area의 위치와 크기를 설정
            changeImage(newSrc, newMap, null, null, null, displayAreaCoords3, displayAreaCoords4, displayAreaCoords5, null, keypadAreaCoords);

            // 클릭 가능한 영역 숨기기
            $("#display-area").hide();
        });
        
        // 여섯 번째 이미지 전환 이벤트 (상세 이체정보 확인 후 '다음' 버튼 클릭 시)
        $(document).on('click', '#area-8', function(event) {
        	event.preventDefault();
            currentStep = 7; // 현재 단계를 7으로 설정
            updateStepIndicator(); // 단계 표시 업데이트
            
            var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer6.png";
            var newMap = `
                <area id="area-9" target="" alt="" title="" href="#" coords="258,119,637,164" shape="rect">
            `;
            var displayAreaCoords6 = "347,266,467,289"; // display-area6의 위치와 크기를 설정
            var keypadAreaCoords = ""; // keypad-area의 위치와 크기를 설정
            changeImage(newSrc, newMap, null, null, null, null, null, null, displayAreaCoords6, keypadAreaCoords);

            // 클릭 가능한 영역 숨기기
            $("#display-area").hide();
        });

        // 창 크기 변경 시 이미지 맵 크기 조정
        $(window).resize(resizeImageMap);
    });
    </script>

</body>
</html>
