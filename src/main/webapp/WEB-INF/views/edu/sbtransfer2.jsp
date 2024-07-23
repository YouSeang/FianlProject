<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>

    <meta charset="UTF-8">
    <title>KB스타뱅킹 이체시뮬레이션</title>
   <style>
        #content {
            position: relative;
        }
        #display-area, #keypad-area {
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

        <!-- 숫자를 표시할 영역 -->
    <div id="display-area"
    style="position: absolute; top: 119px; left: 280px; width: 326px; height: 42px; border: 1px solid #000; display: none;">
    <!-- 숫자를 표시할 곳 -->
    <span id="display-text"
        style="display: block; line-height: 42px; text-align: center; font-size: 24px;"></span>
</div>
    </div>

    <script>
    $(document).ready(function() {
        // 이미지 맵을 반응형으로 설정
        $('img[usemap]').rwdImageMaps();

        // 이미지 전환 및 맵 업데이트 함수
        function changeImage(newSrc, newMap, displayAreaCoords, keypadAreaCoords) {
            $("#main-image").fadeOut(200, function() {
                $(this).attr("src", newSrc).fadeIn(200);
                if (newMap) {
                    $('map').html(newMap); // 새 맵 적용
                    $('img[usemap]').rwdImageMaps(); // 새 맵을 반응형으로 설정
                }
                // display-area 위치 조정
                if (displayAreaCoords) {
                    var coords = displayAreaCoords.split(',').map(Number);
                    var top = coords[1];
                    var left = coords[0];
                    var width = coords[2] - coords[0];
                    var height = coords[3] - coords[1];
                    $("#display-area").css({
                        top: top + 'px',
                        left: left + 'px',
                        width: width + 'px',
                        height: height + 'px'
                    }).show();
                } else {
                    $("#display-area").hide(); // coords가 없으면 숨기기
                }
                // keypad-area 위치 조정
                if (keypadAreaCoords) {
                    var coords = keypadAreaCoords.split(',').map(Number);
                    var top = coords[1];
                    var left = coords[0];
                    var width = coords[2] - coords[0];
                    var height = coords[3] - coords[1];
                    $("#keypad-area").css({
                        top: top + 'px',
                        left: left + 'px',
                        width: width + 'px',
                        height: height + 'px'
                    }).show();
                } else {
                    $("#keypad-area").hide(); // coords가 없으면 숨기기
                }
            });
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
                `;
                var displayAreaCoords = "280,119,606,161"; // display-area의 위치와 크기를 설정
                var keypadAreaCoords = "280,119,606,161"; // keypad-area의 위치와 크기를 설정
                changeImage(newSrc, newMap, displayAreaCoords, keypadAreaCoords);
            });

            // 클릭 가능한 영역 클릭 시 숫자 처리
            var inputNumbers = ""; // 입력된 숫자를 저장할 변수
            $(document).on('click', 'area', function(event) {
                event.preventDefault();
                var areaId = $(this).attr('id');
                var value = ''; // 기본값은 빈 문자열

                // 클릭한 영역의 ID에 따라 값을 설정
                if (areaId === 'keypad-1') value = '1';
                if (areaId === 'keypad-2') value = '2';
                if (areaId === 'keypad-3') value = '3';

                // 숫자 표시
                inputNumbers += value; // 입력된 숫자를 추가
                $("#display-text").text(inputNumbers); // 계속해서 숫자 표시
            });
        });
    </script>
</body>
</html>
