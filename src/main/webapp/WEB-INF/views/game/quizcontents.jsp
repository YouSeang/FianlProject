<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
    <meta charset="UTF-8">
    <title>퀴즈</title>


 <style>
        /* 기본 스타일 설정 */
        area {
            cursor: pointer; /* 마우스를 올리면 포인터로 변경 */
        }

        /* hover 효과 적용 */
        #quiz1_x:hover,
        #quiz1_o:hover {
            outline: 3px solid red; /* hover 시 빨간색 윤곽선을 표시 */
        }
    </style>
    

</head>
<body>
    <div id="content" style="position: relative;">
        <img id="main-image" src="${pageContext.request.contextPath}/resources/images/quiz/quiz1.png" alt="" usemap="#quiz" class="img-fluid">
        <map name="quiz">
    <area target="_self" alt="" title="" href="" coords="1039,1433,345" shape="circle" id="quiz1_x">
    <area target="_self" alt="" title="" href="" coords="2059,1225,2147,1144,2352,1337,2543,1150,2630,1237,2440,1428,2633,1627,2543,1711,2349,1515,2147,1708,2053,1627,2259,1437" shape="poly" id="quiz1_o">
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
            
            $(document).on('click', '#quiz1_x', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/quiz/quiz1_x.png";
                var newMap = `
                	 <area target="_self" alt="" title="" href="" coords="1039,1433,345" shape="circle" id="quiz1_x">
                    <area target="_self" alt="" title="" href="" coords="2059,1225,2147,1144,2352,1337,2543,1150,2630,1237,2440,1428,2633,1627,2543,1711,2349,1515,2147,1708,2053,1627,2259,1437" shape="poly" id="quiz1_o">
                `;
                changeImage(newSrc, newMap);
            });
            $(document).on('click', '#quiz1_o', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/quiz/quiz2.png";
                var newMap = `
                	 <area target="_self" alt="" title="" href="" coords="1039,1433,345" shape="circle" id="quiz1_x">
                    <area target="_self" alt="" title="" href="" coords="2059,1225,2147,1144,2352,1337,2543,1150,2630,1237,2440,1428,2633,1627,2543,1711,2349,1515,2147,1708,2053,1627,2259,1437" shape="poly" id="quiz1_o">
                `;
                changeImage(newSrc, newMap);
            });
            
            
        });
    </script>
</body>
</html>
