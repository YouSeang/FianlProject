<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
<meta charset="UTF-8">
<title>KB스타뱅킹 이체시뮬레이션</title>
<style>
#keypad-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 100;
            justify-content: center;
            align-items: center;
        }

        #keypad {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        #keypad input {
            font-size: 18px;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        #keypad button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        #account-number-display {
            position: absolute;
            top: 150px;
            left: 300px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 5px 10px;
            border-radius: 5px;
            display: none;
            z-index: 101;
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
	</div>
<script>
    $(document).ready(function() {
        $('img[usemap]').rwdImageMaps();
        
        // 이벤트 핸들러 정의
        function changeImage(newSrc, newMap) {
            $("#main-image").fadeOut(200, function() {
                $(this).attr("src", newSrc).fadeIn(200);
                if (newMap) {
                    $('map').html(newMap);
                    $('img[usemap]').rwdImageMaps();
                }
            });
        }
        
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
        });

        // 첫 번째 이미지에서 다른 영역 클릭 시
        $(document).on('click', 'area', function(event) {
            if ($("#main-image").attr("src").includes("transfer1.png") && this.id !== 'area-1') {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer1-1.png";
                changeImage(newSrc);
            }
        });
        
        // 두 번째 이미지 전환 이벤트
        $(document).on('click', '#area-4', function(event) {
            event.preventDefault();
            var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer3.png";
            changeImage(newSrc);
        });
        
        // 두 번째 이미지에서 특정 영역 클릭 시
        $(document).on('click', '#area-4', function(event) {
            event.preventDefault();
            $("#keypad-overlay").show(); // Show keypad overlay
        });

        // 키패드 제출 이벤트
        $(document).on('click', '#submit-account', function() {
            var accountNumber = $("#account-number").val();
            if (accountNumber) {
                $("#keypad-overlay").hide();
                $("#account-number-display").text("계좌번호: " + accountNumber).show();
            } else {
                alert('계좌번호를 입력해주세요.');
            }
        });

        // 두 번째 이미지에서 다른 영역 클릭 시
        $(document).on('click', 'area', function(event) {
            if ($("#main-image").attr("src").includes("transfer2.png") && this.id !== 'area-4') {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer2-1.png";
                changeImage(newSrc);
            }
        });
    });
</script>

</body>
</html>
