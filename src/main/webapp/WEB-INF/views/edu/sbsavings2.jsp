<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
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
        
        <!-- 가입기간를 표시할 영역 -->
        <div id="display-area" class="display-area">
            <span id="display-text" class="display-text"></span>
        </div>

        <!-- 첫 번째 단계에서 입력한 가입기간를 표시할 영역 -->
        <div id="display-area1" class="display-area">
            <span id="display-text1" class="display-text"></span>
        </div>

        <!-- 가입금액 입력 시 표시할 영역 -->
        <div id="display-area2" class="display-area">
            <span id="display-text2" class="display-text"></span>
        </div>

        <!-- 입력한 가입기간를 표시할 영역2 -->
        <div id="display-area3" class="display-area">
            <span id="display-text3" class="display-text"></span>
        </div>

        <!-- 입력한 가입금액를 표시할 영역2 -->
        <div id="display-area4" class="display-area">
            <span id="display-text4" class="display-text"></span>
        </div>

        <!-- 입력한 가입기간를 표시할 영역3 -->
        <div id="display-area5" class="display-area">
            <span id="display-text5" class="display-text"></span>
        </div>

        <!-- 입력한 가입금액을 표시할 영역3 -->
        <div id="display-area6" class="display-area">
            <span id="display-text6" class="display-text"></span>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        $("#main-image").on('load', function() {
            $('img[usemap]').rwdImageMaps();
            resizeImageMap();
        }).each(function() {
            if(this.complete) $(this).trigger('load');
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

        function changeImage(newSrc, newMap, displayAreaCoords, displayAreaCoords1, displayAreaCoords2, displayAreaCoords3, displayAreaCoords4, displayAreaCoords5, displayAreaCoords6, keypadAreaCoords) {
            $("#main-image").fadeOut(200, function() {
                $(this).attr("src", newSrc).fadeIn(200);

                $(this).on('load', function() {
                    var img = $("#main-image");

                    if (newMap) {
                        $('map').html(newMap);
                        $('img[usemap]').rwdImageMaps();
                    }
                    resizeImageMap(); // 이미지 크기에 따라 좌표 재설정

                    // 좌표를 반응형으로 업데이트
                    function updateAreaPosition(coords, selector) {
                        if (coords) {
                            var coordsArr = coords.split(',').map(Number);
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
            const targetId = $(this).attr('id');
            event.preventDefault();

            if (targetId === 'goto-sbsavings1-1') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings1-1.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="630,439,392,391" shape="rect" id="goto-sbsavings2">
                `;
                changeImage(newSrc, newMap);
            } else if (targetId === 'goto-sbsavings2') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings2.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">
                    <area target="_self" alt="" title="" href="#" coords="251,25,648,28,638,716,399,723,396,798,259,798" shape="poly" id="goto-sbsavings2-1">
                `;
                changeImage(newSrc, newMap);
            } else if (targetId === 'goto-sbsavings2-1') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings2-1.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">
                `;
                changeImage(newSrc, newMap);
            } else if (targetId === 'goto-sbsavings3') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings3.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="264,341,331,714" shape="rect" id="goto-sbsavings4">
                    <area target="_self" alt="" title="" href="#" coords="260,34,254,326,353,327,354,724,245,732,255,797,623,790,633,42" shape="poly" id="goto-sbsavings3-1">
                `;
                changeImage(newSrc, newMap);
            } else if (targetId === 'goto-sbsavings3-1') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings3-1.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="264,341,331,714" shape="rect" id="goto-sbsavings4">
                `;
                changeImage(newSrc, newMap);
            } else if (targetId === 'goto-sbsavings4') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings4.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="244,728,631,793" shape="rect" id="goto-sbsavings5">
                    <area target="_self" alt="" title="" href="#" coords="244,728,637,40" shape="poly" id="goto-sbsavings4-1">
                `;
                changeImage(newSrc, newMap);
            } else if (targetId === 'goto-sbsavings4-1') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings4-1.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="244,728,631,793" shape="rect" id="goto-sbsavings5">
                `;
                changeImage(newSrc, newMap);
            } else if (targetId === 'goto-sbsavings5') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings5.png";
                var newMap = `
                    <area target="_self" alt="" title="" href="#" coords="407,544,623,603" shape="rect" id="goto-sbsavings6">
                    <area target="_self" alt="" title="" href="#" coords="391,536,629,537,621,46,265,49,260,794,634,793,633,612,391,612" shape="poly" id="goto-sbsavings5">
                `;
                changeImage(newSrc, newMap);
                $("#display-area").hide();
                
            } else if (targetId === 'goto-sbsavings6') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings6.png";
                var newMap = `
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
                var displayAreaCoords = "287,342,607,405"; // display-area의 위치와 크기를 설정
                changeImage(newSrc, newMap, displayAreaCoords, null, null, null, null, null, null, null);

                // display-area를 보이도록 설정
                $("#display-area").css('display', 'block');
            }
        });

        // 클릭 가능한 영역 클릭 시 숫자 처리 (계좌번호 입력)
        $(document).on('click', 'area', function(event) {
            event.preventDefault();
            var areaId = $(this).attr('id');
            var value = '';

            var currentSrc = $("#main-image").attr("src");
            var isInputdate = currentSrc.includes("sbsavings6.png");

            if (areaId === '1') value = '1';
            if (areaId === '2') value = '2';
            if (areaId === '3') value = '3';
            if (areaId === '4') value = '4';
            if (areaId === '5') value = '5';
            if (areaId === '6') value = '6';
            if (areaId === '7') value = '7';
            if (areaId === '8') value = '8';
            if (areaId === '9') value = '9';
            if (areaId === '0') value = '0';
            if (areaId === '36') value = '36';
            if (areaId === '24') value = '24';

            if (areaId === 'back') {
                if (isInputdate) {
                    inputdate = inputdate.slice(0, -1);  // 마지막 글자 삭제
                    $("#display-text").text(inputdate); // 업데이트된 inputdate를 화면에 표시
                } else {
                    inputpay = inputpay.slice(0, -1);
                    $("#display-text2").text(inputpay);
                }
            } else {
                if (isInputdate) {
                    inputdate += value;  // 선택된 값을 inputdate에 추가
                    $("#display-text").text(inputdate); // 업데이트된 inputdate를 화면에 표시
                } else {
                    inputpay += value;
                    $("#display-text2").text(inputpay);
                }
            }
        });
        
        $(document).on('click', '#keypad-check', function(event) {
            event.preventDefault();
            var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings7.png";
            var newMap = `
                <area target="" alt="" title="" href="#" coords="291,627,611,691" shape="rect" id="goto-sbsavings8">
                            `;
            var displayAreaCoords1 = "423,552,567,599"; // display-area1의 위치와 크기를 설정
            /* var displayAreaCoords2 = "291,627,611,691"; // display-area2의 위치와 크기를 설정
            var keypadAreaCoords = "281,124,612,163"; // keypad-area의 위치와 크기를 설정
            */ 
            changeImage(newSrc, newMap, null, displayAreaCoords1, null, null, null, null, null, null);
            $("#display-area3").hide();
            
        });
        
        $(document).on('click', 'area', function(event) {
            const targetId = $(this).attr('id');
            event.preventDefault();
            
            if (targetId === 'goto-sbsavings8') {
                var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings8.png";
                var newMap = `
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
                    
                    <area id="keypad-check2" target="" alt="button" title="button" href="" coords="254,733,633,794" shape="rect" id="goto-sbsavings9">
                `;
                var displayAreaCoords3 = "287,342,607,405"; // display-area의 위치와 크기를 설정
                changeImage(newSrc, newMap, displayAreaCoords3, null, null, null, null, null, null, null);

                // display-area를 보이도록 설정
                $("#display-area3").css('display', 'block');
            }
        });
     // 클릭 가능한 영역 클릭 시 숫자 처리 (계좌번호 입력)
        $(document).on('click', 'area', function(event) {
            event.preventDefault();
            var areaId = $(this).attr('id');
            var value = '';

            var currentSrc = $("#main-image").attr("src");
            var isInputdate = currentSrc.includes("sbsavings8.png");

            if (areaId === '1') value = '1';
            if (areaId === '2') value = '2';
            if (areaId === '3') value = '3';
            if (areaId === '4') value = '4';
            if (areaId === '5') value = '5';
            if (areaId === '6') value = '6';
            if (areaId === '7') value = '7';
            if (areaId === '8') value = '8';
            if (areaId === '9') value = '9';
            if (areaId === '0') value = '0';
            if (areaId === '36') value = '36';
            if (areaId === '24') value = '24';
            if (areaId === '12') value = '12';
            if (areaId === 'back') {
                if (isInputdate) {
                    inputdate = inputdate.slice(0, -1);  // 마지막 글자 삭제
                    $("#display-text3").text(inputdate); // 업데이트된 inputdate를 화면에 표시
                } else {
                    inputpay = inputpay.slice(0, -1);
                    $("#display-text4").text(inputpay);
                }
            } else {
                if (isInputdate) {
                    inputdate += value;  // 선택된 값을 inputdate에 추가
                    $("#display-text3").text(inputdate); // 업데이트된 inputdate를 화면에 표시
                } else {
                    inputpay += value;
                    $("#display-text4").text(inputpay);
                }
            }
        });
        
        $(document).on('click', '#keypad-check2', function(event) {
            event.preventDefault();
            var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings9.png";
            var newMap = `
                <area target="" alt="" title="" href="#" coords="291,627,611,691" shape="rect" id="goto-sbsavings10">
                            `;
            var displayAreaCoords1 = "423,552,567,599"; // display-area1의 위치와 크기를 설정
            /* var displayAreaCoords2 = "291,627,611,691"; // display-area2의 위치와 크기를 설정
            var keypadAreaCoords = "281,124,612,163"; // keypad-area의 위치와 크기를 설정
            */ 
            changeImage(newSrc, newMap, null, displayAreaCoords1, displayAreaCoords2, null, null, null, null, keypadAreaCoords);
        });
        
        
        $(window).resize(resizeImageMap);
    });
    </script>
</body>
</html>
