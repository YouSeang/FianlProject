<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>

    <meta charset="UTF-8">
    <title>적금가입</title>
    <style>
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
        display: none; /* 기본적으로 보이지 않도록 설정 */
    }

    .display-text {
        font-size: 16px;
    }

    @media ( max-width : 767.98px) {
        .display-text {
            font-size: 12px;
        }
    }
    </style>
</head>
<body>
    <div id="content">
        <img id="main-image" src="${pageContext.request.contextPath}/resources/images/sb/sbsavings1.png" alt="" usemap="#photo" class="img-fluid">
        <map name="photo">
            <area target="_self" alt="" title="" href="#" coords="630,439,392,391" shape="rect" id="goto-sbsavings2">
            <area target="_self" alt="" title="" href="#" coords="255,40,635,39,645,376,387,378,388,444,648,449,638,779,260,793" shape="poly" id="goto-sbsavings1-1">
        </map>
        
        <div id="display-area" class="display-area">
            <span id="display-text" class="display-text"></span>
        </div>
        <div id="display-area1" class="display-area">
            <span id="display-text1" class="display-text"></span>
        </div>
        <div id="display-area2" class="display-area">
            <span id="display-text2" class="display-text"></span>
        </div>
        <div id="display-area3" class="display-area">
            <span id="display-text3" class="display-text"></span>
        </div>
        <div id="display-area4" class="display-area">
            <span id="display-text4" class="display-text"></span>
        </div>
        <div id="display-area5" class="display-area">
            <span id="display-text5" class="display-text"></span>
        </div>
        <div id="display-area6" class="display-area">
            <span id="display-text6" class="display-text"></span>
        </div>
    </div>

    <script>
    
    let userId = '<%=session.getAttribute("userId")%>';
    
  
    
    $(document).ready(function() {
        $("#main-image").on('load', function() {
            $('img[usemap]').rwdImageMaps();
            resizeImageMap();
        }).each(function() {
            if (this.complete) $(this).trigger('load');
        });

        var inputdate = ""; // 입력된 가입기간 저장 변수
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

        function updateAreaPosition(coords, selector) {
            if (coords) {
                var coordsArr = coords.split(',').map(Number);
                var img = $("#main-image");
                var top = (coordsArr[1] / img[0].naturalHeight) * 100;
                var left = (coordsArr[0] / img[0].naturalWidth) * 100;
                var width = ((coordsArr[2] - coordsArr[0]) / img[0].naturalWidth) * 100;
                var height = ((coordsArr[3] - coordsArr[1]) / img[0].naturalHeight) * 100;
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

        function changeImage(newSrc, newMap, displayAreaCoords, displayAreaCoords1, displayAreaCoords2, displayAreaCoords3, displayAreaCoords4, displayAreaCoords5, displayAreaCoords6) {
            $("#main-image").fadeOut(200, function() {
                $(this).attr("src", newSrc).fadeIn(200);

                $(this).on('load', function() {
                    var img = $("#main-image");

                    if (newMap) {
                        $('map').html(newMap);
                        $('img[usemap]').rwdImageMaps();
                    }
                    resizeImageMap();

                    // Reset all display areas
                    $(".display-area").hide();

                    // Update only relevant display areas
                    updateAreaPosition(displayAreaCoords, "#display-area");
                    $("#display-text1").text(inputdate);
                    updateAreaPosition(displayAreaCoords1, "#display-area1");
                    $("#display-text2").text(inputpay);
                    updateAreaPosition(displayAreaCoords2, "#display-area2");
                    $("#display-text3").text(inputdate);
                    updateAreaPosition(displayAreaCoords3, "#display-area3");
                    $("#display-text4").text(inputpay);
                    updateAreaPosition(displayAreaCoords4, "#display-area4");
                    $("#display-text5").text(inputpay);
                    updateAreaPosition(displayAreaCoords5, "#display-area5");
                    $("#display-text6").text(inputpay);
                    updateAreaPosition(displayAreaCoords6, "#display-area6");
                });
            });
        }

        $(document).on('click', 'area', function(event) {
            event.preventDefault();
            const targetId = $(this).attr('id');

            switch(targetId) {
                case 'goto-sbsavings1-1':
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings1-1.png",
                        `<area target="_self" alt="" title="" href="#" coords="630,439,392,391" shape="rect" id="goto-sbsavings2">`);
                    break;
                case 'goto-sbsavings2':
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings2.png",
                        `<area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">
                         <area target="_self" alt="" title="" href="#" coords="251,25,648,28,638,716,399,723,396,798,259,798" shape="poly" id="goto-sbsavings2-1">`);
                    break;
                case 'goto-sbsavings2-1':
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings2-1.png",
                        `<area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">`);
                    break;
                case 'goto-sbsavings3':
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings3.png",
                        `<area target="_self" alt="" title="" href="#" coords="264,341,331,714" shape="rect" id="goto-sbsavings4">
                         <area target="_self" alt="" title="" href="#" coords="260,34,254,326,353,327,354,724,245,732,255,797,623,790,633,42" shape="poly" id="goto-sbsavings3-1">`);
                    break;
                case 'goto-sbsavings3-1':
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings3-1.png",
                        `<area target="_self" alt="" title="" href="#" coords="264,341,331,714" shape="rect" id="goto-sbsavings4">`);
                    break;
                case 'goto-sbsavings4':
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings4.png",
                        `<area target="_self" alt="" title="" href="#" coords="244,728,631,793" shape="rect" id="goto-sbsavings5">
                         <area target="_self" alt="" title="" href="#" coords="244,728,637,40" shape="poly" id="goto-sbsavings4-1">`);
                    break;
                case 'goto-sbsavings4-1':
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings4-1.png",
                        `<area target="_self" alt="" title="" href="#" coords="244,728,631,793" shape="rect" id="goto-sbsavings5">`);
                    break;
                case 'goto-sbsavings5':
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings5.png",
                        `<area target="_self" alt="" title="" href="#" coords="407,544,623,603" shape="rect" id="goto-sbsavings6">
                         <area target="_self" alt="" title="" href="#" coords="391,536,629,537,621,46,265,49,260,794,634,793,633,612,391,612" shape="poly" id="goto-sbsavings5">`);
                    break;
                case 'goto-sbsavings6':
                    var displayAreaCoords = "287,342,607,405";
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings6.png",
                        `<area id="1" target="" alt="1" title="1" href="" coords="377,538,268,476" shape="rect">
                         <area id="2" target="" alt="2" title="2" href="" coords="395,479,497,538" shape="rect">
                         <area id="3" target="" alt="3" title="3" href="" coords="512,474,624,538" shape="rect">
                         <area id="4" target="" alt="4" title="4" href="" coords="269,547,382,600" shape="rect">
                         <area id="5" target="" alt="5" title="5" href="" coords="391,545,506,604" shape="rect">
                         <area id="6" target="" alt="6" title="6" href="" coords="514,548,627,604" shape="rect">
                         <area id="7" target="" alt="7" title="7" href="" coords="266,606,382,668" shape="rect">
                         <area id="8" target="" alt="8" title="8" href="" coords="389,610,511,661" shape="rect">
                         <area id="9" target="" alt="9" title="9" href="" coords="518,611,632,665" shape="rect">
                         <area id="0" target="" alt="0" title="0" href="" coords="393,668,512,729" shape="rect">
                         <area id="back" target="" alt="back" title="back" href="" coords="519,672,626,724" shape="rect">
                         <area id="36" target="" alt="36" title="36" href="" coords="283,430,359,458" shape="rect">
                         <area id="24" target="" alt="24" title="24" href="" coords="441,459,368,429" shape="rect">
                         <area id="12" target="" alt="12" title="12" href="" coords="449,430,523,463" shape="rect">
                         <area id="keypad-check" target="" alt="button" title="button" href="" coords="254,733,633,794" shape="rect" id="goto-sbsavings7">`,
                        displayAreaCoords);
                    break;
                case 'goto-sbsavings8':
                    var displayAreaCoords3 = "287,342,607,405";
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings8.png",
                        `<area target="" alt="1000000" title="1000000" href="" coords="289,428,347,461" shape="rect">
    <area id="500000" target="" alt="500000" title="500000" href="" coords="354,427,412,460" shape="rect">
    <area id="100000" target="" alt="100000" title="100000" href="" coords="417,428,478,462" shape="rect">
    <area id="50000" target="" alt="50000" title="50000" href="" coords="484,428,541,463" shape="rect">
    <area id="10000" target="" alt="10000" title="10000" href="" coords="547,427,604,465" shape="rect">
    <area id="1" target="" alt="1" title="1" href="" coords="265,481,387,537" shape="rect">
    <area id="2" target="" alt="2" title="2" href="" coords="393,479,511,536" shape="rect">
    <area id="3" target="" alt="3" title="3" href="" coords="517,478,626,537" shape="rect">
    <area id="4" target="" alt="4" title="4" href="" coords="267,544,387,597" shape="rect">
    <area id="5" target="" alt="5" title="5" href="" coords="392,542,516,599" shape="rect">
    <area id="6" target="" alt="6" title="6" href="" coords="520,541,627,601" shape="rect">
    <area id="7" target="" alt="7" title="7" href="" coords="267,603,389,658" shape="rect">
    <area id="8" target="" alt="8" title="8" href="" coords="393,604,516,657" shape="rect">
    <area id="9" target="" alt="9" title="9" href="" coords="520,605,630,657" shape="rect">
    <area id="00" target="" alt="00" title="00" href="" coords="266,664,389,723" shape="rect">
    <area id="0" target="" alt="0" title="0" href="" coords="393,664,518,722" shape="rect">
    <area id="back" target="" alt="button" title="button" href="" coords="521,663,627,721" shape="rect">
    <area id="keypad-check2" target="" alt="button" title="button" href="" coords="261,729,629,792" shape="rect" id="goto-sbsavings9">`,
                        displayAreaCoords3);
                    // Display inputpay in display-area3
                    $("#display-text3").text(inputpay);
                    $("#display-area3").css('display', 'block');
                    break;
                case 'goto-sbsavings10':
                	var displayAreaCoords4 = "420,494,498,529";
                    changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings10.png",
                        `<area target="_self" alt="" title="" href="#" coords="253,734,637,799" shape="rect" id="finish">`,
                        displayAreaCoords4);
                    // Display inputpay in display-area4
                    $("#display-text5").text(inputpay);
                    $("#display-area5").css('display', 'block');
                    break;
                case 'finish':
                    sbSavingsClick();
                    break;
            
            }
        });

        $(document).on('click', 'area', function(event) {
            event.preventDefault();
            var areaId = $(this).attr('id');
            var value = '';
            var currentSrc = $("#main-image").attr("src");

            if (['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '36', '24', '12', '1000000', '500000', '100000', '50000', '10000', '00'].includes(areaId)) {
                value = areaId;
            } else if (areaId === 'back') {
                if (currentSrc.includes("sbsavings6.png")) {
                    inputdate = inputdate.slice(0, -1);
                    $("#display-text").text(inputdate);
                } else if (currentSrc.includes("sbsavings8.png")) {
                    inputpay = inputpay.slice(0, -1);
                    $("#display-text3").text(inputpay);
                } else {
                    inputpay = inputpay.slice(0, -1);
                    $("#display-text4").text(inputpay);
                }
                return;
            }

            if (currentSrc.includes("sbsavings6.png")) {
                inputdate += value;
                $("#display-text").text(inputdate);
            } else if (currentSrc.includes("sbsavings8.png")) {
                inputpay += value;
                $("#display-text3").text(inputpay);
            } else {
                inputpay += value;
                $("#display-text4").text(inputpay);
            }
        });

        $(document).on('click', '#keypad-check', function(event) {
            event.preventDefault();
            changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings7.png",
                `<area target="" alt="" title="" href="#" coords="291,627,611,691" shape="rect" id="goto-sbsavings8">`,
                null, "423,552,567,599");
            $(".display-area").hide(); // Hide all display areas
        });

        $(document).on('click', '#keypad-check2', function(event) {
            event.preventDefault();
            changeImage("${pageContext.request.contextPath}/resources/images/sb/sbsavings9.png",
                `<area target="" alt="" title="" href="#" coords="251,734,632,794" shape="rect" id="goto-sbsavings10">`,
                null, "422,313,460,342", "422,367,494,396");
            // Display inputpay in display-area4
            $("#display-text4").text(inputpay);
            $("#display-area4").css('display', 'block');
        });

        $(window).resize(resizeImageMap);
    });
    
    
    function sbSavingsClick() {
        var pointReason = "상품가입 시뮬레이션 완료";

        $.ajax({
            url: "${pageContext.request.contextPath}/edu/sbsavings/updatePoints", 
            type: "POST",
            data: JSON.stringify({
                userId: userId,
                pointsEarned: 500,
                pointReason: pointReason
            }),
            contentType: "application/json; charset=UTF-8",
            success: function(response) {
                console.log("포인트 적립 성공: ", response);
                if (response.status === "success") {
                    Swal.fire({
                        title: '포인트 적립 성공',
                        text: '500포인트가 적립되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    });
                } else {
                    Swal.fire({
                        title: '포인트 적립 실패',
                        text: '포인트 적립에 실패했습니다. 다시 시도해 주세요.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            },
            error: function(error) {
                console.log("포인트 적립 실패: ", error);
                Swal.fire({
                    title: '포인트 적립 실패',
                    text: '포인트 적립에 실패했습니다. 다시 시도해 주세요.',
                    icon: 'error',
                    confirmButtonText: '확인'
                });
            }
        });
    }
    </script>
</body>
</html>
