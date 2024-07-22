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
    <title>이미지맵 테스트</title>
</head>
<body>
    <img id="main-image" src="${pageContext.request.contextPath}/resources/images/sb/sbjoin1.png" alt="" usemap="#photo" class="img-fluid">
    <map name="photo">
        <area target="_self" alt="" title="" href="#" coords="1065,2014,122,1829" shape="rect" id="change-image-area">
    </map>
    <script>
        $(document).ready(function() {
            $('img[usemap]').rwdImageMaps();

            $("#change-image-area").click(function(event) {
                event.preventDefault();
                $("#main-image").fadeOut(500, function() {
                    $(this).attr("src", "${pageContext.request.contextPath}/resources/images/sb/sbjoin2.png").fadeIn(500);
                });
            });
        });
    </script>
</body>
</html>
