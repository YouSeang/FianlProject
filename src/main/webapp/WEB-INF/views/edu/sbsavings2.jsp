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
    <title>적금가입</title>
</head>
<body>
    <div id="content">
        <img id="main-image" src="${pageContext.request.contextPath}/resources/images/sb/sbsavings1.png" alt="" usemap="#photo" class="img-fluid">
        <map name="photo">
           <area target="_self" alt="" title="" href="#" coords="630,439,392,391" shape="rect" id="change-image-area">
           <area target="_self" alt="" title="" href="#" coords="255,40,635,39,645,376,387,378,388,444,648,449,638,779,260,793" shape="poly" id="unchange-image-area">
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
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings1-1.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="630,439,392,391" shape="rect" id="change-image-area">
                    <area target="_self" alt="" title="" href="#" coords="255,40,635,39,645,376,387,378,388,444,648,449,638,779,260,793" shape="poly" id="unchange-image-area">
                `;
                changeImage(newSrc, newMap);
            });
            
            // 내맘대로적금 가입 시작화면 
            $(document).on('click', '#change-image-area', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings2.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">
                	<area target="_self" alt="" title="" href="#" coords="251,25,648,28,638,716,399,723,396,798,259,798" shape="poly" id="goto-sbsavings2-1">
                `;
                changeImage(newSrc, newMap);
            });
            
            //내맘대로적금 가입 버튼 선택유도
            $(document).on('click', '#goto-sbsavings2-1', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings2-1.png";
                var newMap = `
                	<area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">
                	<area target="_self" alt="" title="" href="#" coords="251,25,648,28,638,716,399,723,396,798,259,798" shape="poly" id="goto-sbsavings3-1">                
                	`;
                changeImage(newSrc, newMap);
            });

            // 적금가입 약관동의 안내
            $(document).on('click', '#goto-sbsavings3', function(event) {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings3.png";
                var newMap = `
                	<area target="_self" alt="" title="" href="#" coords="299,365,21" shape="circle" id="goto-sbsavings4">
                	<area target="_self" alt="" title="" href="#" coords="251,25,648,28,638,716,399,723,396,798,259,798" shape="poly" id="goto-sbsavings3-1">                
                	`;
                changeImage(newSrc, newMap);
            });
            
            
        });
    </script>
</body>
</html>
