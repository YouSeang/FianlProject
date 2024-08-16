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
    #step-indicator {
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #f0f0f0;
        font-size: 18px;
        font-weight: bold;
        color: #333;
        padding: 10px 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
        position: relative;
        max-width: 500px;
        margin-left: auto;
        margin-right: auto;
    }

    #back-button {
        width: 30px;
        height: 30px;
        margin-right: 10px;
        cursor: pointer;
    }

    #step-text {
        text-align: center;
    }

    #progress-bar {
        position: absolute;
        bottom: -5px;
        left: 0;
        width: 100%;
        height: 4px;
        background-color: #ddd;
        border-radius: 2px;
    }

    #progress-bar-fill {
        height: 100%;
        width: 0;
        background-color: #4caf50;
        border-radius: 2px;
        transition: width 0.3s ease;
    }

    #content {
        position: relative;
        width: 100%;
    }

    #main-image {
        width: 90%;
        max-width: 90%;
        display: block;
        margin: 0 auto;
    }

    .display-area {
        position: absolute;
        border: 1px solid #000;
        display: none;
    }

    .display-text {
        font-size: 16px;
    }

    @media (max-width: 767.98px) {
        .display-text {
            font-size: 12px;
        }
    }
</style>
</head>
<body>
<div id="step-indicator">
    <img id="back-button" src="/resources/images/transfer/back-button.png" alt="뒤로가기">
    <span id="step-text">1단계 / 10단계</span>
    <div id="progress-bar">
        <div id="progress-bar-fill"></div>
    </div>
</div>

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
$(document).ready(function() {
    var currentStep = 1;
    var inputdate = ""; // 입력된 가입기간 저장 변수
    var inputpay = ""; // 입력된 금액을 저장할 변수

    $('#back-button').hide(); // 처음 페이지 로드 시 뒤로가기 버튼 숨기기

    $("#main-image").on('load', function() {
        $('img[usemap]').rwdImageMaps();
        resizeImageMap();
    }).each(function() {
        if (this.complete) $(this).trigger('load');
    });

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
                if (newMap) {
                    $('map').html(newMap);
                    $('img[usemap]').rwdImageMaps();
                }
                resizeImageMap();

                // Reset all display areas
                $(".display-area").hide();

                // Update only relevant display areas
                updateAreaPosition(displayAreaCoords, "#display-area");
                updateAreaPosition(displayAreaCoords1, "#display-area1");
                updateAreaPosition(displayAreaCoords2, "#display-area2");
                updateAreaPosition(displayAreaCoords3, "#display-area3");
                updateAreaPosition(displayAreaCoords4, "#display-area4");
                updateAreaPosition(displayAreaCoords5, "#display-area5");
                updateAreaPosition(displayAreaCoords6, "#display-area6");

                // Update display texts
                $("#display-text1").text(inputdate);
                $("#display-text2").text(inputpay);
                $("#display-text3").text(inputdate);
                $("#display-text4").text(inputpay);
                $("#display-text5").text(inputpay);
                $("#display-text6").text(inputpay);
            });
        });
    }

    function updateStepIndicator() {
        $("#step-text").text(currentStep + "단계 / 10단계");
        if (currentStep === 1) {
            $('#back-button').hide(); // 1단계에서는 숨기기
        } else {
            $('#back-button').show(); // 2단계부터는 항상 표시
        }

        var progress = ((currentStep - 1) / 9) * 100; // 10단계 중 1단계를 제외한 9단계로 계산
        $('#progress-bar-fill').css('width', progress + '%');
    }

    function updatePoints() {
        $.ajax({
            url: "${pageContext.request.contextPath}/updatePoints",
            method: "POST",
            data: { pointReason: '스타뱅킹 적금가입 체험완료' },
            success: function (response) {
                Swal.fire({
                    title: '포인트 업데이트 완료!',
                    text: response,
                    icon: 'success'
                }).then(() => {
                    window.close();
                });
            },
            error: function (xhr, status, error) {
                console.error("Failed to update points. Status: " + status + ", Error: " + error);
                Swal.fire({
                    title: '포인트 업데이트 실패',
                    text: `상태: ${status}, 오류: ${error}`,
                    icon: 'error'
                }).then(() => {
                    window.close();
                });
            }
        });
    }

    function changeStep(step) {
        currentStep = step; // 단계 값을 갱신
        updateStepIndicator(); // 단계 표시 업데이트

        var newSrc;
        var newMap;
        var displayAreaCoords, displayAreaCoords1, displayAreaCoords2, displayAreaCoords3, displayAreaCoords4, displayAreaCoords5, displayAreaCoords6;

        switch (step) {
            case 1:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings1.png";
                newMap = `
                    <area target="_self" alt="" title="" href="#" coords="630,439,392,391" shape="rect" id="goto-sbsavings2">
                    <area target="_self" alt="" title="" href="#" coords="255,40,635,39,645,376,387,378,388,444,648,449,638,779,260,793" shape="poly" id="goto-sbsavings1-1">
                `;
                break;
            case 2:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings2.png";
                newMap = `
                    <area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">
                    <area target="_self" alt="" title="" href="#" coords="251,25,648,28,638,716,399,723,396,798,259,798" shape="poly" id="goto-sbsavings2-1">
                `;
                break;
            case 3:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings3.png";
                newMap = `
                    <area target="_self" alt="" title="" href="#" coords="264,341,331,714" shape="rect" id="goto-sbsavings4">
                    <area target="_self" alt="" title="" href="#" coords="260,34,254,326,353,327,354,724,245,732,255,797,623,790,633,42" shape="poly" id="goto-sbsavings3-1">
                `;
                break;
            case 4:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings4.png";
                newMap = `
                    <area target="_self" alt="" title="" href="#" coords="244,728,631,793" shape="rect" id="goto-sbsavings5">
                    <area target="_self" alt="" title="" href="#" coords="244,728,637,40" shape="poly" id="goto-sbsavings4-1">
                `;
                break;
            case 5:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings5.png";
                newMap = `
                    <area target="_self" alt="" title="" href="#" coords="407,544,623,603" shape="rect" id="goto-sbsavings6">
                    <area target="_self" alt="" title="" href="#" coords="391,536,629,537,621,46,265,49,260,794,634,793,633,612,391,612" shape="poly" id="goto-sbsavings5-1">
                `;
                break;
            case 6:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings6.png";
                newMap = `
                    <area id="1" target="" alt="1" title="1" href="" coords="377,538,268,476" shape="rect">
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
                    <area id="keypad-check" target="" alt="button" title="button" href="" coords="254,733,633,794" shape="rect" id="goto-sbsavings7">
                `;
                displayAreaCoords = "287,342,607,405";
                break;
            case 7:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings7.png";
                newMap = `
                    <area target="" alt="" title="" href="#" coords="291,627,611,691" shape="rect" id="goto-sbsavings8">
                `;
                displayAreaCoords3 = "423,552,567,599";
                break;
            case 8:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings8.png";
                newMap = `
                    <area target="" alt="1000000" title="1000000" href="" coords="289,428,347,461" shape="rect">
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
                    <area id="keypad-check2" target="" alt="button" title="button" href="" coords="261,729,629,792" shape="rect" id="goto-sbsavings9">
                `;
                displayAreaCoords4 = "287,342,607,405";
                break;
            case 9:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings9.png";
                newMap = `
                    <area target="" alt="" title="" href="#" coords="251,734,632,794" shape="rect" id="goto-sbsavings10">
                `;
                displayAreaCoords3 = "422,313,460,342";
                break;
            case 10:
                newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings10.png";
                newMap = `
                    <area target="_self" alt="" title="" href="#" coords="253,734,637,799" shape="rect" id="finish">
                `;
                displayAreaCoords4 = "420,494,498,529";
                break;
        }

        changeImage(newSrc, newMap, displayAreaCoords, displayAreaCoords1, displayAreaCoords2, displayAreaCoords3, displayAreaCoords4, displayAreaCoords5, displayAreaCoords6);
    }

    $("#back-button").on("click", function() {
        if (currentStep > 1) {
            changeStep(currentStep - 1); // 단계를 감소시켜 이전 단계로 이동
        }
    });

    $(document).on('click', 'area', function(event) {
        event.preventDefault();
        const targetId = $(this).attr('id');

        switch(targetId) {
            case 'goto-sbsavings2':
                changeStep(2);
                break;
            case 'goto-sbsavings3':
                changeStep(3);
                break;
            case 'goto-sbsavings4':
                changeStep(4);
                break;
            case 'goto-sbsavings5':
                changeStep(5);
                break;
            case 'goto-sbsavings6':
                changeStep(6);
                break;
            case 'goto-sbsavings7':
                changeStep(7);
                break;
            case 'goto-sbsavings8':
                changeStep(8);
                break;
            case 'goto-sbsavings9':
                changeStep(9);
                break;
            case 'goto-sbsavings10':
                changeStep(10);
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
        changeStep(7);
    });

    $(document).on('click', '#keypad-check2', function(event) {
        event.preventDefault();
        changeStep(9);
    });

    $(window).resize(resizeImageMap);
});

function sbSavingsClick() {
    var pointReason = "상품가입 시뮬레이션 완료";
    var userId = "${sessionScope.userId}";

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
