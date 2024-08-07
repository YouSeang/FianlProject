<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>적금가입</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
    <style>
        #content {
            position: relative;
            width: 100%; /* Adjust to match the image size */
            max-width: 700px; /* Adjust as per the image size */
            margin: 0 auto;
            
            background-size: cover;
            background-position: center;
            height: 100vh; /* Adjust the height to match the image height */
        }
        #intxt {
            position: absolute;
            left: 30%; /* Adjust the position based on your image */
            top: 35%;  /* Adjust the position based on your image */
            width: 150px; /* Adjust the width based on your needs */
            height: 30px; /* Adjust the height based on your needs */
            border: 1px solid #000;
            font-size: 16px;
            background-color: white;
            text-align: center;
            z-index: 10;
        }
    </style>
</head>
<body>
    <div id="content">
        <img id="main-image" src="${pageContext.request.contextPath}/resources/images/sb/sbsavings6.png" alt="" usemap="#photo" class="img-fluid">
        <map name="photo" id="image-map">
           <area target="" alt="month" title="month" href="" coords="287,356,461,403" shape="rect">
    <area target="" alt="36" title="36" href="" coords="288,431,362,463" shape="rect">
    <area target="" alt="confirm" title="confirm" href="" coords="257,733,633,794" shape="rect" id="goto-sbsavings7">
        </map>
        <input type="text" id="intxt">
    </div>

    <script>
        $(document).ready(function() {
            $('img[usemap]').rwdImageMaps();

            function positionIntxt() {
                const img = $('#main-image')[0];
                const intxt = $('#intxt');
                const mapArea = $("area[title='month']");
                const coords = mapArea.attr("coords").split(',').map(Number);

                const scaleX = img.clientWidth / img.naturalWidth;
                const scaleY = img.clientHeight / img.naturalHeight;

                const left = coords[0] * scaleX;
                const top = coords[1] * scaleY;
                const right = coords[2] * scaleX;
                const bottom = coords[3] * scaleY;

                intxt.css({
                    display: 'block',
                    position: 'absolute',
                    left: `${left}px`,
                    top: `${top}px`,
                    width: `${right - left}px`,
                    height: `${bottom - top}px`
                });
            }

            function changeImage(newSrc, newMap) {
                $("#main-image").fadeOut(200, function() {
                    const img = $(this);
                    img.attr("src", newSrc).off('load').on('load', function() {
                        img.fadeIn(200);
                        if (newSrc.includes('sbsavings6.png')) {
                            positionIntxt();
                        } else {
                            $('#intxt').hide();
                        }
                    });

                    if (newMap) {
                        $('#image-map').html(newMap);
                        $('img[usemap]').rwdImageMaps();
                    }
                });
            }

            $('#content').on('click', 'area', function(event) {
                event.preventDefault();
                const value = $(this).attr('title');
                const targetId = $(this).attr('id');

                if (value === '36') {
                    $('#intxt').val($('#intxt').val() + value);
                } else if (targetId === 'goto-sbsavings7') {
                    changeImage("images/sbsavings7.png", `
                        <area target="_self" alt="" title="" href="#" coords="396,554,614,608" shape="rect" id="goto-sbsavings8">
                    `);
                } else if (targetId === 'goto-sbsavings8') {
                    changeImage("images/sbsavings8.png", `
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
                    `);
                } else if (targetId === 'goto-sbsavings9') {
                    // Add logic for the next step if needed
                    console.log("Next step: sbsavings9");
                }
            });

            $(window).on('resize load', function() {
                if ($('#main-image').attr("src").includes('sbsavings6.png')) {
                    positionIntxt();
                }
            });

            // Initial positioning
            setTimeout(positionIntxt, 0);
        });
    </script>
</body>
</html>