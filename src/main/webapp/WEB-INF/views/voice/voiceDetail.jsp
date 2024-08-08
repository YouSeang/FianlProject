<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Voice Detail">
<meta name="author" content="Your Name">
<title>LocKB</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.banner-btn a.custom-btn {
	margin-right: 10px;
	padding: 15px 30px;
	font-size: 18px;
}

#recordButton {
	color: white;
	background-color: #fc0707;
	border: none;
	border-radius: 20px;
	padding: 15px 30px;
	font-size: 22px;
	text-align: center;
	display: inline-block;
	cursor: pointer;
	text-decoration: none;
	font-weight: bold;
}

#recordButton:hover {
	border: 2px solid #ebc0b6; /* 호버 시 테두리 추가 */
}
</style>
</head>
<body>
	<h1>데이터 확인용</h1>
	<p id="result"></p>
	<div id="voiceDetail">
		<p id="voicePath"></p>
		<p id="isFinal"></p>
		<p id="voiceNotFound"></p>
		<p id="finalMessage"></p>
	</div>
	<audio id="audioPlayer" controls style="display: none;" autoplay></audio>
	<section class="banner-area parallax-banner bg-cover"
		data-stellar-background-ratio=".6"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/banner/voiceBanner3.jpg');">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="banner-info">
						<h1 class="banner-title text-white" style="color: white;">
							범인의 음성에
							<div>답변을 완성하세요.</div>
						</h1>
						<div class="donation-form p-3 p-xl-4 rounded-6">
							<p style="color: red;">이것은, 범죄자의 실제 목소리입니다.</p>
							<h2 class="mb-4"></h2>
							<canvas class="visualizer" height="60px" style="width: 100%;"></canvas>
						</div>
						<div class="banner-meta mt-5">
							<span>정확한 발성으로 말씀해주세요</span> <span>start/stop버튼을 눌러주세요</span>
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1 mt-5 mt-lg-0">
					<div class="banner-btn mt-5 d-flex align-items-center">
						<a class="custom-btn2" id="recordButton"
							onclick="toggleRecording()">답변 시작</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
    let voiceType;
    let userId = '<c:out value="${sessionScope.userId}"/>'; // JSP에서 세션 값을 JavaScript로 전달
    let audioPlayer;
    let scenarioName; // 세앙 시나리오 name

    $(document).ready(function() {
        console.log("User ID from session: ", userId); // JavaScript 콘솔에 출력
        audioPlayer = document.getElementById("audioPlayer");
        var urlParams = new URLSearchParams(window.location.search);
        voiceType = urlParams.get('voice');
        scenarioName = urlParams.get('scenarioName'); // 시나리오 이름 설정
        
        Swal.fire({
            title: voiceType === 'impersonation' ? '기관사칭 금융사기 연루 케이스' : '정부 지원 저금리 대출 안내 케이스',
            text: '확인 버튼을 누르면 보이스 피싱 범인과의 시뮬레이션 통화가 시작됩니다.',
            icon: 'info',
            confirmButtonText: '확인'
        }).then((result) => {
            if (result.isConfirmed) {
                setTimeout(playAudio, 3000); // 3초 후에 음성 재생
            }
        });
    });

    function playAudio() {
        if (voiceType) {
            var audioPath = "";
            if (voiceType === "impersonation") {
                audioPath = "impersonation1.m4a"; // 기관사칭 음성 파일 경로
            } else if (voiceType === "loan") {
                audioPath = "loan1.mp3"; // 대출사기 음성 파일 경로
            }

            if (audioPath) {
                var audioSrc = "${pageContext.request.contextPath}/resources/audio/" + audioPath + "?t=" + new Date().getTime();
                audioPlayer.src = audioSrc;
                audioPlayer.style.display = "block";
                
                audioPlayer.load();
                audioPlayer.play().then(() => {
                    console.log("Audio is playing.");
                }).catch(error => {
                    console.error("Failed to play audio automatically. Trying to play after user interaction.", error);
                    document.getElementById("result").innerText += " Click to play.";
                    document.getElementById("result").onclick = function() {
                        audioPlayer.play();
                    };
                });
            }
        }
    }

    var mediaRecorder;
    var socket;
    let audioCtx;
    const canvas = document.querySelector(".visualizer");
    const canvasCtx = canvas.getContext("2d");

    function toggleRecording() {
        if (mediaRecorder && mediaRecorder.state === "recording") {
            stopRecording();
        } else {
            startRecording();
        }
    }

    function startRecording() {
    	var urlParams = new URLSearchParams(window.location.search); // URL 파라미터 가져오기
        navigator.mediaDevices.getUserMedia({ audio: true })
            .then(function(stream) {
                mediaRecorder = new MediaRecorder(stream, { mimeType: 'audio/webm', timeSlice: 1000 });
                mediaRecorder.ondataavailable = function(event) {
                    if (event.data.size > 0) {
                        sendData(event.data);
                    }
                };
                mediaRecorder.start();
                visualize(stream);
                console.log("Recording started.");
                document.getElementById("recordButton").style.backgroundColor = "#ffb200"; // 답변 시작 시 배경색 변경
                
            })
            .catch(function(error) {
                console.error("Error accessing media devices.", error);
            });

        document.getElementById("recordButton").innerText = "답변 종료";
        
        socket = new WebSocket("ws://localhost:8080/study/audio?scenarioName=" + scenarioName);
        socket.binaryType = "arraybuffer";

        socket.onopen = function(event) {
            console.log("WebSocket connection opened.");
        };

        socket.onmessage = function(event) {
            console.log("Received from server: ", event.data);
            document.getElementById("result").innerText = event.data;
            getVoiceData(event.data, scenarioName);
        };

        socket.onclose = function(event) {
            console.log("WebSocket connection closed.");
        };

        socket.onerror = function(error) {
            console.error("WebSocket error: ", error);
        };
    }

    function stopRecording() {
        mediaRecorder.stop();
        document.getElementById("recordButton").innerText = "답변 시작";
        document.getElementById("recordButton").style.backgroundColor = "#fc0707"; // 답변 종료 시 배경색 변경
    }

    function sendData(audioBlob) {
    	console.log("Sending audio data to server"); // Debug message
        var reader = new FileReader();
        reader.onload = function(event) {
            if (socket.readyState === WebSocket.OPEN) {
                socket.send(event.target.result);
                console.log("Sent audio data to server.");
            } else {
                console.error("WebSocket is not open. Ready state: " + socket.readyState);
            }
        };
        reader.readAsArrayBuffer(audioBlob);
    }

    // scenarioName 추가
    function getVoiceData(id, scenarioName) {
        console.log("Requesting voice data with id: " + id + " and scenario: " + scenarioName); // Debug message
        $.ajax({
            url: "${pageContext.request.contextPath}/getVoice",
            method: "GET",
            data: { id: id, scenarioName: scenarioName},
            success: function(response) {
                console.log("AJAX request successful. Response:", response);

                var data;
                try {
                    data = JSON.parse(response);
                    console.log("Parsed JSON:", data);
                    console.log("Audio Path:", data.audioPath);
                    console.log("Is Final:", data.isFinal);
                    console.log("Voice Not Found:", data.voiceNotFound);
                } catch (e) {
                    console.error("Failed to parse JSON response: ", response);
                    return;
                }
                $("#voicePath").text("Audio Path: " + data.audioPath);
                $("#isFinal").text("Is Final: " + data.isFinal);
                $("#voiceNotFound").text("Voice Not Found: " + data.voiceNotFound);
                
                if (data.isFinal) {
                    let finalMessage = "";
                    if (scenarioName  === "impersonation") {
                        finalMessage = "범인은 고립된 장소로 유도하여 주변인의 간섭이나 도움을 차단하고, 제 3자에게 알리면 소환장이 발부된다는 식의 압박을 하는 경우가 많으니 이를 주의 바랍니다.";
                        showAlert(finalMessage);
                    } else if (scenarioName  === "loan") {
                        finalMessage = "범인은 대출 조건을 맞추기 위한 편법으로 타 대출을 일시적으로 실행하게끔 유도하여 상환 목적으로 자금을 갈취하는 경우가 많으니 주의 바랍니다.";
                        showMultipleAlerts(finalMessage);
                    }
                    $("#finalMessage").text(finalMessage);
                    
                    // 12초 후에 SweetAlert2 알림 창 띄우기
                    setTimeout(() => {
                        Swal.fire({
                            title: '체험 종료',
                            text: finalMessage,
                            icon: 'info',
                            confirmButtonText: '닫기'
                        });
                    }, 12000); // 12초 후 실행

                    // 포인트 업데이트 요청
                    $.ajax({
                        url: "${pageContext.request.contextPath}/updatePoints",
                        method: "POST",
                        data: { pointReason: '보이스피싱 체험완료' }, // 추가된 부분(소미추가)
                        success: function(response) {
                            console.log(response);
                        },
                        error: function(xhr, status, error) {
                            console.error("Failed to update points. Status: " + status + ", Error: " + error);
                        }
                    });
                }

                
                if (data.audioPath && !data.voiceNotFound) {
                    var audioPlayer = document.getElementById("audioPlayer");
                    // 타임스탬프를 추가하여 캐시 방지
                    var audioSrc = "${pageContext.request.contextPath}/resources/audio/" + data.audioPath + "?t=" + new Date().getTime();
                    audioPlayer.src = audioSrc;
                    audioPlayer.style.display = "block";
                    
                    console.log("Audio source set to: " + audioSrc); // Debug message

                    // 음성이 로드되면 자동 재생
                    audioPlayer.load();
                    audioPlayer.play().then(() => {
                        console.log("Audio is playing."); // Debug message
                        visualizePlayback(audioPlayer);
                    }).catch(error => {
                        console.error("Failed to play audio automatically. Trying to play after user interaction.", error);
                        document.getElementById("result").innerText += " Click to play.";
                        document.getElementById("result").onclick = function() {
                            audioPlayer.play();
                            visualizePlayback(audioPlayer);
                        };
                    });
                } else {
                    $("#audioPlayer").hide();
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX request failed. Status:", status, "Error:", error);
            }
        });
    }

    function showAlert(message) {
        Swal.fire({
            title: '체험 종료',
            text: message,
            icon: 'info',
            confirmButtonText: '닫기'
        });
    }

    function showMultipleAlerts(message) {
        Swal.fire({
            title: '체험 종료',
            text: '당신은 보이스피싱 범죄의 시나리오를 알아 채셨나요?',
            icon: 'info',
            confirmButtonText: '확인'
        }).then((result) => {
            if (result.isConfirmed) {
                setTimeout(() => {
                    Swal.fire({
                        title: '유의 사항',
                        text: message,
                        icon: 'info',
                        confirmButtonText: '닫기'
                    });
                }, 3000); // 3초 후 실행
            }
        });
    }

    function visualize(stream) {
        if (!audioCtx) {
            audioCtx = new AudioContext();
        }

        const source = audioCtx.createMediaStreamSource(stream);
        const analyser = audioCtx.createAnalyser();
        analyser.fftSize = 2048;
        const bufferLength = analyser.frequencyBinCount;
        const dataArray = new Uint8Array(bufferLength);

        source.connect(analyser);

        function draw() {
            const WIDTH = canvas.width;
            const HEIGHT = canvas.height;

            requestAnimationFrame(draw);

            analyser.getByteTimeDomainData(dataArray);

            canvasCtx.fillStyle = "rgba(200, 200, 200, 0.5)";
            canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

            canvasCtx.lineWidth = 2;
            canvasCtx.strokeStyle = "rgb(0, 0, 0)";

            canvasCtx.beginPath();

            let sliceWidth = (WIDTH * 1.0) / bufferLength;
            let x = 0;

            for (let i = 0; i < bufferLength; i++) {
                let v = dataArray[i] / 128.0;
                let y = (v * HEIGHT) / 2;

                if (i === 0) {
                    canvasCtx.moveTo(x, y);
                } else {
                    canvasCtx.lineTo(x, y);
                }

                x += sliceWidth;
            }

            canvasCtx.lineTo(canvas.width, canvas.height / 2);
            canvasCtx.stroke();
        }

        draw();
    }

    function visualizePlayback(audioElement) {
        if (!audioCtx) {
            audioCtx = new AudioContext();
        }

        const source = audioCtx.createMediaElementSource(audioElement);
        const analyser = audioCtx.createAnalyser();
        analyser.fftSize = 2048;
        const bufferLength = analyser.frequencyBinCount;
        const dataArray = new Uint8Array(bufferLength);

        source.connect(analyser);
        analyser.connect(audioCtx.destination);

        function draw() {
            const WIDTH = canvas.width;
            const HEIGHT = canvas.height;

            requestAnimationFrame(draw);

            analyser.getByteTimeDomainData(dataArray);

            canvasCtx.fillStyle = "rgba(200, 200, 200, 0.5)";
            canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

            canvasCtx.lineWidth = 2;
            canvasCtx.strokeStyle = "rgb(0, 0, 0)";

            canvasCtx.beginPath();

            let sliceWidth = (WIDTH * 1.0) / bufferLength;
            let x = 0;

            for (let i = 0; i < bufferLength; i++) {
                let v = dataArray[i] / 128.0;
                let y = (v * HEIGHT) / 2;

                if (i === 0) {
                    canvasCtx.moveTo(x, y);
                } else {
                    canvasCtx.lineTo(x, y);
                }

                x += sliceWidth;
            }

            canvasCtx.lineTo(canvas.width, canvas.height / 2);
            canvasCtx.stroke();
        }

        draw();
    }

    </script>

	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>
</body>
</html>
