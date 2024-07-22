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
<title>이미지맵 테스트</title>
</head>
<body>
<div id="content">

	<img id="main-image"
		src="${pageContext.request.contextPath}/resources/images/transfer/transfer1.png"
		alt="" usemap="#photo" class="img-fluid">
	<map name="photo">
		<area id="area-1" target="" alt="" title="" href="#"
			coords="260,118,149,136" shape="rect">
		<area id="area-2" target="" alt="" title="" href="#"
			coords="294,116,117,15" shape="rect">
		<area id="area-3" target="" alt="" title="" href="#"
			coords="113,138,289,358" shape="rect">

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
            changeImage(newSrc);
        });
        
        // 다른 영역 클릭 시
        $(document).on('click', 'area', function(event) {
            if (this.id !== 'area-1') {
                event.preventDefault();
                var newSrc = "${pageContext.request.contextPath}/resources/images/transfer/transfer1-1.png";
                changeImage(newSrc);

                // 일정 시간 후에 다시 transfer1.png 이미지를 보여줌
                setTimeout(function() {
                    changeImage("${pageContext.request.contextPath}/resources/images/transfer/transfer1.png");
                }, 1000); // 1초 후에 이미지 변경
            }
        });
    });
</script>
</body>
</html>
