<!DOCTYPE html>
<html>
<head>
    <title>LocKB</title>
    <script>
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

    </script>
</head>
<body>
    <h1>Real-time Speech Recognitionss</h1>
    <button id="startButton" onclick="startRecording()">Start Recording</button>
    <button id="stopButton" onclick="stopRecording()" disabled>Stop Recording</button>
    <p id="result"></p>
</body>
</html>
