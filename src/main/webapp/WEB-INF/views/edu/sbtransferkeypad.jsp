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
            position: relative; /* 부모 div를 relative로 설정 */
        }
        /* 클릭 가능한 영역 스타일 (디버그용) */
        .clickable-area {
            position: absolute;
            cursor: pointer;
            background: rgba(255, 0, 0, 0.3); /* 클릭 영역의 시각적 표시 (디버그용) */
            z-index: 10; /* 클릭 가능한 영역을 이미지 위에 표시 */
        }
        #keypad-area {
            position: absolute; /* 키패드 영역 위치 설정 */
            top: 485px;
            left: 257px;
            width: 377px;
            height: 245px;
            z-index: 5; /* 이미지 위에 위치하도록 설정 */
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

        <!-- 키패드 영역 start -->
        <div id="keypad-area" style="display: none;">
            <!-- 클릭 가능한 영역을 여기에 포함 -->
            <div class="clickable-area" id="keypad-1"
                style="top: 10px; left: 10px; width: 109px; height: 55px;"
                data-value="1"></div>
            <div class="clickable-area" id="keypad-2"
                style="top: 10px; left: 130px; width: 113px; height: 54px;"
                data-value="2"></div>
            <div class="clickable-area" id="keypad-3"
                style="top: 10px; left: 250px; width: 105px; height: 55px;"
                data-value="3"></div>
            <!-- 추가로 필요한 클릭 가능한 영역 추가 가능 -->
        </div>

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
            function changeImage(newSrc, newMap) {
                $("#main-image").fadeOut(200, function() {
                    $(this).attr("src", newSrc).fadeIn(200);
                    if (newMap) {
                        $('map').html(newMap); // 새 맵 적용
                        $('img[usemap]').rwdImageMaps(); // 새 맵을 반응형으로 설정
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
                $("#keypad-area").hide();
                $("#display-area").hide();
            });

            // 두 번째 이미지 전환 이벤트
            $(document).on('click', '#area-4', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer2-1.png";
                var newMap = `
                    <area id="keypad-area" target="" alt="" title="" href="#" coords="257,485,634,730" shape="rect">
                `;
                changeImage(newSrc, newMap);

                // 두 번째 이미지로 전환 후 클릭 가능한 영역 표시
                $("#keypad-area").show();
                $("#display-area").show(); // display-area를 보이도록 설정
            });

            // 클릭 가능한 영역에서 숫자 클릭 시 숫자 처리
            $(document).on('click', '.clickable-area', function(event) {
                var value = $(this).data('value'); // 클릭한 영역의 숫자 값
                $("#display-text").text(value); // 숫자 표시
            });

            // 특정 영역 클릭 시 처리 (키패드 영역 클릭 시)
            $(document).on('click', '#keypad-area', function(event) {
                event.preventDefault();
                // 키패드 관련 로직이 필요할 경우 여기에 추가
            });
        });
    </script>
</body>
</html>
