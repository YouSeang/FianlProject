<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
    <meta charset="UTF-8">
    <title>LocKB</title>
</head>
<body>
    <div id="content">
        <img id="main-image" src="${pageContext.request.contextPath}/resources/images/sb/sbjoin1.png" alt="" usemap="#photo" class="img-fluid">
        <map name="photo">
           <area target="_self" alt="" title="" href="#" coords="239,730,644,794" shape="rect" id="change-image-area">
           <area target="_self" alt="" title="" href="#" coords="239,730,647,30" shape="rect" id="unchange-image-area">
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

            // unchange-image-area 클릭 이벤트
            $(document).on('click', '#unchange-image-area', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbjoin1-1.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="239,730,644,794" shape="rect" id="change-image-area">
                    <area target="_self" alt="" title="" href="#" coords="239,730,647,30" shape="rect" id="unchange-image-area">
                `;
                changeImage(newSrc, newMap);
            });
            
            // 첫 번째 이미지 전환 이벤트
            $(document).on('click', '#change-image-area', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbjoin2.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="239,730,644,794" shape="rect" id="goto-sbjoin3">
                `;
                changeImage(newSrc, newMap);
            });

            // 두 번째 이미지 전환 이벤트
            $(document).on('click', '#goto-sbjoin3', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbjoin3.png";
                changeImage(newSrc);
            });
        });
    </script>
</body>
</html>
