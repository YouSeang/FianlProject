<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="preconnect" href="https://statics.goorm.io"
	crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />
<link rel="stylesheet"
	href="https://statics.goorm.io/fonts/GoormSans/v1.0.0/GoormSans.min.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/image-map-resizer/1.0.10/js/imageMapResizer.min.js"></script>
<title>LocKB</title>
<style>
@font-face {
	font-family: 'Goorm Sans';
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, p, a {
	font-family: 'Goorm Sans' !important;
}

#content {
	position: relative;
}

#display-area, #display-area1, #display-area2, #display-area3,
	#display-area4, #keypad-area {
	position: absolute;
	border: 1px solid #000;
	display: none;
}

#keypad-area {
	z-index: 10; /* `keypad-area`가 위에 보이도록 설정 */
}
</style>
</head>
<body>
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

		<!-- 입력계좌번호를 표시할 영역 -->
		<div id="display-area"
			style="position: absolute; top: 119px; left: 280px; width: 326px; height: 42px; border: 1px solid #000; display: none;">
			<!-- 입력계좌번호를 표시할 곳 -->
			<span id="display-text"
				style="display: block; line-height: 42px; text-align: left; font-size: 24px;"></span>
		</div>

		<!-- 첫 번째 단계에서 입력한 계좌번호를 표시할 영역 -->
		<div id="display-area1"
			style="position: absolute; top: 119px; left: 280px; width: 326px; height: 42px; border: 1px solid #000; display: none;">
			<!-- 계좌번호를 표시할 곳 -->
			<span id="display-text1"
				style="display: block; line-height: 42px; text-align: left; font-size: 24px;"></span>
		</div>

		<!-- 이체금액 입력 시 표시할 영역 -->
		<div id="display-area2"
			style="position: absolute; top: 160px; left: 280px; width: 326px; height: 42px; border: 1px solid #000; display: none;">
			<!-- 이체금액을 표시할 곳 -->
			<span id="display-text2"
				style="display: block; line-height: 42px; text-align: left; font-size: 24px;"></span>
		</div>

		<!-- 이체확인 페이지에서 받는 분 계좌 확인 영역 -->
		<div id="display-area3"
			style="position: absolute; top: 160px; left: 280px; width: 326px; height: 42px; border: 1px solid #000; display: none;">
			<!-- 이체확인 페이지에서 받는 분 계좌 표시할 곳 -->
			<span id="display-text3"
				style="display: block; line-height: 42px; text-align: left; font-size: 24px;"></span>
		</div>

		<!-- 이체확인 페이지에서 보내는 금액 확인 영역 -->
		<div id="display-area4"
			style="position: absolute; top: 160px; left: 280px; width: 326px; height: 42px; border: 1px solid #000; display: none;">
			<!-- 이체확인 페이지에서 보내는 금액 표시할 곳 -->
			<span id="display-text4"
				style="display: block; line-height: 42px; text-align: left; font-size: 24px;"></span>
		</div>

		<!-- 이체확인 상세페이지에서 보내는 금액 확인 영역 -->
		<div id="display-area5"
			style="position: absolute; top: 160px; left: 280px; width: 326px; height: 42px; border: 1px solid #000; display: none;">
			<!-- 이체확인 페이지에서 보내는 금액 표시할 곳 -->
			<span id="display-text5"
				style="display: block; line-height: 42px; text-align: left; font-size: 24px;"></span>
		</div>

		<!--이체완료페이지에서 보낸 금액 확인 영역 -->
		<div id="display-area6"
			style="position: absolute; top: 160px; left: 280px; width: 326px; height: 42px; border: 1px solid #000; display: none;">
			<!-- 이체완료페이지에서 보낸 금액 표시할 곳 -->
			<span id="display-text6"
				style="display: block; line-height: 42px; text-align: center; font-size: 24px;"></span>
		</div>
	</div>

	<script>
	$(document).ready(function() {
	    // 이미지가 로드된 후 rwdImageMaps를 호출하여 반응형으로 설정
	    $("#main-image").on('load', function() {
	        $('img[usemap]').rwdImageMaps();
	    }).each(function() {
	        if(this.complete) $(this).trigger('load');
	    });
	});
	
        var inputaccountNum = ""; // 입력된 계좌번호를 저장할 변수
        var inputpay = ""; // 입력된 금액을 저장할 변수
        var originalImgWidth, originalImgHeight;

        function changeImage(newSrc, newMap, displayAreaCoords, displayAreaCoords1, displayAreaCoords2, displayAreaCoords3, displayAreaCoords4, displayAreaCoords5, displayAreaCoords6, keypadAreaCoords) {
            $("#main-image").fadeOut(200, function() {
                $(this).attr("src", newSrc).fadeIn(200);

                $(this).on('load', function() {
                    var $img = $(this);
                    var originalImgWidth = $img[0].naturalWidth; // 원본 이미지의 실제 너비
                    var originalImgHeight = $img[0].naturalHeight; // 원본 이미지의 실제 높이

                    // 좌표 비율을 계산하는 함수
                    function calculateResponsiveCoords(originalCoords) {
                        var coordsArr = originalCoords.split(',').map(Number);
                        var newCoords = coordsArr.map(function(coord, index) {
                            return (coord / originalImgWidth) * $img.width();
                        });
                        return newCoords.join(',');
                    }

                    // 이미지가 로드된 후 좌표 비율을 계산하여 적용
                    function updateAreaPosition(coords, selector) {
                        if (coords) {
                            var newCoords = calculateResponsiveCoords(coords);
                            var coordsArr = newCoords.split(',').map(Number);
                            var top = coordsArr[1];
                            var left = coordsArr[0];
                            var width = coordsArr[2] - coordsArr[0];
                            var height = coordsArr[3] - coordsArr[1];
                            $(selector).css({
                                top: top + 'px',
                                left: left + 'px',
                                width: width + 'px',
                                height: height + 'px'
                            }).show();
                        } else {
                            $(selector).hide();
                        }
                    }

                    // 새로운 맵이 있을 때 반응형으로 설정
                    if (newMap) {
                        $('map').html(newMap);
                        $('img[usemap]').rwdImageMaps(); // 새 맵을 반응형으로 설정
                    }

                    // 좌표를 반응형으로 업데이트
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

            // 콘솔에 원본 이미지 크기와 좌표를 출력
            console.log("Original Image Width:", originalImgWidth);
            console.log("Original Image Height:", originalImgHeight);
            console.log("Display Area Coords:", displayAreaCoords);
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
            var displayAreaCoords = "281,124,612,163"; // display-area의 위치와 크기를 설정
            var keypadAreaCoords = "281,124,612,163"; // keypad-area의 위치와 크기를 설정

            changeImage(newSrc, newMap, displayAreaCoords, null, null, null, null, null, null, keypadAreaCoords);
        });

        // 클릭 가능한 영역 클릭 시 숫자 처리 (계좌번호입력)
        $(document).on('click', 'area', function(event) {
            event.preventDefault();
            var areaId = $(this).attr('id');
            var value = ''; // 기본값은 빈 문자열

            // 현재 이미지에 따라 숫자 처리 구분
            var currentSrc = $("#main-image").attr("src");
            var isAccountInput = currentSrc.includes("transfer2-1.png");

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
            if (areaId === 'keypad-00') value = '00';
            
            // keypad-10의 경우 마지막 숫자를 제거
            if (areaId === 'keypad-10') {
                if (isAccountInput) {
                    inputaccountNum = inputaccountNum.slice(0, -1);
                    $("#display-text").text(inputaccountNum); // 수정된 부분
                } else {
                    inputpay = inputpay.slice(0, -1);
                    $("#display-text2").text(inputpay);
                }
            } else {
                // 다른 숫자 키패드
                if (isAccountInput) {
                    inputaccountNum += value;
                    $("#display-text").text(inputaccountNum); // 수정된 부분
                } else {
                    inputpay += value;
                    $("#display-text2").text(inputpay);
                }
            }
        });

        // 세 번째 이미지 전환 이벤트
        $(document).on('click', '#keypad-check', function(event) {
            event.preventDefault();
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
                <area id="keypad-next" target="" alt="" title="" href="#" coords="259,728,635,784" shape="rect">
            `;
            var displayAreaCoords1 = "342,110,527,128"; // display-area1의 위치와 크기를 설정
            var displayAreaCoords2 = "374,186,463,210"; // display-area2의 위치와 크기를 설정
            var keypadAreaCoords = "281,124,612,163"; // keypad-area의 위치와 크기를 설정
            
            changeImage(newSrc, newMap, null, displayAreaCoords1, displayAreaCoords2, null, null, null, null, keypadAreaCoords);
        });
        
        // 네 번째 이미지 전환 이벤트 (금액 입력 후 '확인'버튼 클릭')
        $(document).on('click', '#keypad-next', function(event) {
            event.preventDefault();
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
        });
        
        // 다섯 번째 이미지 전환 이벤트 (이체정보 확인 후 '다음' 버튼 클릭 시)
        $(document).on('click', '#area-7', function(event) {
            event.preventDefault();
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
            var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer6.png";
            var newMap = `
                <area id="area-9" target="" alt="" title="" href="#" coords="258,119,637,164" shape="rect">
            `;
            var displayAreaCoords6 = "347,266,467,289"; // display-area6의 위치와 크기를 설정
            var keypadAreaCoords = ""; // keypad-area의 위치와 크기를 설정
            changeImage(newSrc, newMap, null, null, null, null, null,null,displayAreaCoords6, keypadAreaCoords);

            // 클릭 가능한 영역 숨기기
            $("#display-area").hide();
        });
</script>

</body>
</html>
