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
        display: inline-block;
    }
    #intxt {
        position: absolute;
        display: none;
        border: 1px solid #000;
        resize: none;
        font-size: 24px;
        background-color: white;
        z-index: 15;
        text-align: center;
        pointer-events: none;
    }
</style>
</head>
<body>
    <div id="content" style="position: relative;">
        <img id="main-image" src="${pageContext.request.contextPath}/resources/images/sb/sbsavings1.png" alt="" usemap="#photo" class="img-fluid">
        <map name="photo">
            <area target="_self" alt="" title="" href="#" coords="630,439,392,391" shape="rect" id="goto-sbsavings2">
            <area target="_self" alt="" title="" href="#" coords="255,40,635,39,645,376,387,378,388,444,648,449,638,779,260,793" shape="poly" id="goto-sbsavings1-1">
        </map>
        <div id="content">
        <input type="text" id="intxt"></div>
    </div>

     
     <script>
        $(document).ready(function() {
            $('img[usemap]').rwdImageMaps();

            function changeImage(newSrc, newMap) {
            	 console.log("Changing image to: " + newSrc);
                $("#main-image").fadeOut(200, function() {
                    const img = $(this);
                    img.attr("src", newSrc).off('load').on('load', function() {
                        console.log('Image load event fired for:', newSrc);
                        img.fadeIn(200, function() {
                            if (newSrc.includes('sbsavings6.png')) {
                                console.log('sbsavings6.png detected');
                                positionIntxt();
                            } else {
                                $('#intxt').hide();
                            }
                        });
                    });

                    if (newMap) {
                        $('map').html(newMap);
                        $('img[usemap]').rwdImageMaps();
                        setupKeyboardHandlers();
                    }
                });
            }

            function positionIntxt() {
                const img = $('#main-image')[0];
                const imgRect = img.getBoundingClientRect();
                const contentRect = $('#content')[0].getBoundingClientRect();

                
                const scaleX = img.width / img.naturalWidth;
                const scaleY = img.height / img.naturalHeight;

                // 원본 이미지의 좌표
                const intxtCoords = { left: 285, top: 351, right: 493, bottom: 802 };

                // 현재 이미지 크기에 맞게 조정된 좌표
                const adjustedCoords = {
                    left: intxtCoords.left * scaleX + imgRect.left - contentRect.left,
                    top: intxtCoords.top * scaleY + imgRect.top - contentRect.top,
                    width: (intxtCoords.right - intxtCoords.left) * scaleX,
                    height: (intxtCoords.bottom - intxtCoords.top) * scaleY
                };
                console.log('adjustedCoords', adjustedCoords)

                $('#intxt').css({
                    display: 'block',
                    position: 'relative',
                    top: `${adjustedCoords.top}px`,
                    left: `${adjustedCoords.left}px`,
                    width: `${adjustedCoords.width}px`,
                    height: `${adjustedCoords.height}px`
                });

                console.log('Input area CSS applied:', $('#intxt').css(['top', 'left', 'width', 'height']));
            }

            function setupKeyboardHandlers() {
                $('area').off('click').on('click', function(event) {
                    event.preventDefault();
                    const intxt = document.getElementById('intxt');
                    const value = $(this).attr('title');

                    if (value === 'back') {
                        intxt.value = intxt.value.slice(0, -1);
                    } else if (value !== 'intxt' && value !== undefined) {
                        intxt.value += value;
                    }
                });
            }

            setupKeyboardHandlers();
            $(document).on('click', 'area', function(event) {
                const targetId = $(this).attr('id');
                event.preventDefault();
                console.log(`Area clicked: ${targetId}`);

                if (targetId === 'goto-sbsavings2') {
                    var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings2.png";
                    var newMap = `
                        <area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">
                        <area target="_self" alt="" title="" href="#" coords="251,25,648,28,638,716,399,723,396,798,259,798" shape="poly" id="goto-sbsavings2-1">
                    `;
                    changeImage(newSrc, newMap);
                } else if (targetId === 'goto-sbsavings1-1') {
                    var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings1-1.png";
                    var newMap = `
                        <area target="_self" alt="" title="" href="#" coords="630,439,392,391" shape="rect" id="goto-sbsavings2">
                        <area target="_self" alt="" title="" href="#" coords="255,40,635,39,645,376,387,378,388,444,648,449,638,779,260,793" shape="poly" id="goto-sbsavings1-1">
                    `;
                    changeImage(newSrc, newMap);
                } else if (targetId === 'goto-sbsavings3') {
                    var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings3.png";
                    var newMap = `
                        <area target="_self" alt="" title="" href="#" coords="334,453,271,349" shape="rect" id="goto-sbsavings4">
                        <area target="_self" alt="" title="" href="#" coords="249,26,638,20,643,340,643,347,644,412,639,421,635,770,262,784,360,456,337,341,260,348,257,349,247,297,254,446,259,290,260,767,248,351,258,762,259,774,255,510,246,460,439,427,264,768" shape="poly" id="goto-sbsavings3-1">
                    `;
                    changeImage(newSrc, newMap);
                } else if (targetId === 'goto-sbsavings2-1') {
                    var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings2-1.png";
                    var newMap = `
                        <area target="_self" alt="" title="" href="#" coords="408,733,636,794" shape="rect" id="goto-sbsavings3">
                        <area target="_self" alt="" title="" href="#" coords="251,25,648,28,638,716,399,723,396,798,259,798" shape="poly" id="goto-sbsavings2-1">
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
                        <area target="_self" alt="" title="" href="#" coords="244,728,637,40" shape="poly" id="goto-sbsavings4-1">
                    `;
                    changeImage(newSrc, newMap);
                } else if (targetId === 'goto-sbsavings5') {
                    var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings5.png";
                    var newMap = `
                        <area target="_self" alt="" title="" href="#" coords="396,554,614,608" shape="rect" id="goto-sbsavings6">
                        <area target="_self" alt="" title="" href="#" coords="256,33,636,38,642,540,358,540,356,621,642,618,637,781,248,788" shape="poly" id="goto-sbsavings5">
                    `;
                    changeImage(newSrc, newMap);
                } else if (targetId === 'goto-sbsavings6') {
                    var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings6.png";
                    var newMap = `
                        <area target="" alt="1" title="1" href="" coords="377,538,268,476" shape="rect">
                        <area target="" alt="2" title="2" href="" coords="395,479,497,538" shape="rect">
                        <area target="" alt="3" title="3" href="" coords="512,474,624,538" shape="rect">
                        <area target="" alt="4" title="4" href="" coords="269,547,382,600" shape="rect">
                        <area target="" alt="5" title="5" href="" coords="391,545,506,604" shape="rect">
                        <area target="" alt="6" title="6" href="" coords="514,548,627,604" shape="rect">
                        <area target="" alt="7" title="7" href="" coords="266,606,382,668" shape="rect">
                        <area target="" alt="8" title="8" href="" coords="389,610,511,661" shape="rect">
                        <area target="" alt="9" title="9" href="" coords="518,611,632,665" shape="rect">
                        <area target="" alt="0" title="0" href="" coords="393,668,512,729" shape="rect">
                        <area target="" alt="back" title="back" href="" coords="519,672,626,724" shape="rect">
                        <area target="" alt="36" title="36" href="" coords="283,430,359,458" shape="rect">
                        <area target="" alt="24" title="24" href="" coords="441,459,368,429" shape="rect">
                        <area target="" alt="12" title="12" href="" coords="449,430,523,463" shape="rect">
                        <area target="" alt="6" title="6" href="" coords="531,429,609,464" shape="rect">
                        <area target="" alt="intxt" title="intxt" href="" coords="285,351,493,402" shape="rect">
                        <area target="" alt="button" title="button" href="" coords="254,733,633,794" shape="rect" id="goto-sbsavings7">
                    `;
                    changeImage(newSrc, newMap);
                } else if (targetId === 'goto-sbsavings7') {
                    var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings7.png";
                    var newMap = `
                        <area target="_self" alt="" title="" href="#" coords="396,554,614,608" shape="rect" id="goto-sbsavings8">
                    `;
                    changeImage(newSrc, newMap);
                } else if (targetId === 'goto-sbsavings8') {
                    var newSrc = "${pageContext.request.contextPath}/resources/images/sb/sbsavings8.png";
                    var newMap = `
                        <area target="" alt="1" title="1" href="" coords="275,482,384,532" shape="rect">
                        <area target="" alt="2" title="2" href="" coords="393,479,506,534" shape="rect">
                        <area target="" alt="3" title="3" href="" coords="518,476,625,537" shape="rect">
                        <area target="" alt="4" title="4" href="" coords="273,545,389,597" shape="rect">
                        <area target="" alt="5" title="5" href="" coords="397,543,510,598" shape="rect">
                        <area target="" alt="6" title="6" href="" coords="517,545,627,600" shape="rect">
                        <area target="" alt="7" title="7" href="" coords="275,605,390,657" shape="rect">
                        <area target="" alt="8" title="8" href="" coords="395,604,510,660" shape="rect">
                        <area target="" alt="9" title="9" href="" coords="518,609,627,658" shape="rect">
                        <area target="" alt="00" title="00" href="" coords="276,666,388,721" shape="rect">
                        <area target="" alt="0" title="0" href="" coords="397,669,513,721" shape="rect">
                        <area target="" alt="back" title="back" href="" coords="518,667,625,721" shape="rect">
                        <area target="" alt="100" title="100" href="" coords="285,429,344,463" shape="rect">
                        <area target="" alt="50" title="50" href="" coords="352,430,408,461" shape="rect">
                        <area target="" alt="10" title="10" href="" coords="417,429,474,462" shape="rect">
                        <area target="" alt="5" title="5" href="" coords="482,429,540,463" shape="rect">
                        <area target="" alt="1" title="1" href="" coords="545,430,607,463" shape="rect">
                        <area target="" alt="intxt" title="intxt" href="" coords="285,351,493,402" shape="rect">
                        <area target="" alt="button" title="button" href="" coords="254,733,633,794" shape="rect" id="goto-sbsavings9">
                    `;
                    changeImage(newSrc, newMap);
                }
            });


            // 윈도우 리사이즈 시 intxt 위치 조정
            $(window).resize(function() {
                if ($('#main-image').attr("src").includes('sbsavings6.png')) {
                    positionIntxt();
                }
            });

            // 이미지 로드 완료 후 intxt 위치 조정
            $('#main-image').on('load', function() {
                console.log('Image loaded:', $(this).width(), $(this).height());
                if ($(this).attr("src").includes('sbsavings6.png')) {
                    setTimeout(positionIntxt, 0);
                }
            });
        });
    </script>
</body>
</html>
