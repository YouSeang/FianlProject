<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Voice Detail">
    <meta name="author" content="Your Name">

    <!-- Template Title -->
    <title>LocKB</title>

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <!-- jQuery -->
    <script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
</head>

<body>

    <h1>Real-time Speech Recognition</h1>
    <button id="startButton" onclick="startRecording()">Start Recording</button>
    <button id="stopButton" onclick="stopRecording()" disabled>Stop Recording</button>
    <p id="result"></p>

    <div id="voiceDetail">
        <p id="voicePath"></p>
        <p id="isFinal"></p>
        <p id="voiceNotFound"></p>
    </div>

    <audio id="audioPlayer" controls style="display:none;"></audio>

    <script>
        var mediaRecorder;
        var socket;

        function startRecording() {
            navigator.mediaDevices.getUserMedia({ audio: true })
                .then(function(stream) {
                    mediaRecorder = new MediaRecorder(stream, { mimeType: 'audio/webm', timeSlice: 1000 });
                    mediaRecorder.ondataavailable = function(event) {
                        if (event.data.size > 0) {
                            sendData(event.data);
                        }
                    };
                    mediaRecorder.start();
                    console.log("Recording started.");
                })
                .catch(function(error) {
                    console.error("Error accessing media devices.", error);
                });

            document.getElementById("startButton").disabled = true;
            document.getElementById("stopButton").disabled = false;

            socket = new WebSocket("ws://localhost:8080/study/audio");
            socket.binaryType = "arraybuffer";

            socket.onopen = function(event) {
                console.log("WebSocket connection opened.");
            };

            socket.onmessage = function(event) {
                console.log("Received from server: ", event.data);
                document.getElementById("result").innerText = event.data;
                getVoiceData(event.data);
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
            document.getElementById("startButton").disabled = false;
            document.getElementById("stopButton").disabled = true;
        }

        function sendData(audioBlob) {
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

        function getVoiceData(id) {
            console.log("Requesting voice data with id: " + id); // Debug message
            $.ajax({
                url: "${pageContext.request.contextPath}/getVoice",
                method: "GET",
                data: { id: id },
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
                        }).catch(error => {
                            console.error("Failed to play audio automatically. Trying to play after user interaction.", error);
                            document.getElementById("result").innerText += " Click to play.";
                            document.getElementById("result").onclick = function() {
                                audioPlayer.play();
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

    </script>

    <!-- JavaScript -->
    <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>

</html>
