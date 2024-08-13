<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Charity, Non Profit and NGO Website created with Bootstrap and Sass">
<meta name="author" content="Tariqul Islam">
<title>메신저피싱</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/components/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
/* 스타일 설정 */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #f0f0f0;
	padding: 20px;
	box-sizing: border-box;
}

.wrapper {
	width: 100%;
	max-width: 900px;
	display: flex;
	flex-direction: column;
	align-items: center;
	box-sizing: border-box;
}

.header {
	width: 100%;
	padding: 10px;
	background-color: #ffb200;
	color: white;
	text-align: center;
	font-size: 1.2em;
	font-weight: bold;
	box-sizing: border-box;
}

.container {
	display: flex;
	flex-direction: column;
	width: 100%;
	max-width: 900px;
	height: auto;
	margin-top: 10px;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.mobile-frame {
	width: 100%;
	max-width: 390px;
	height: 667px;
	border: 16px solid #000;
	border-radius: 36px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	background-color: #fff;
	overflow: hidden;
	position: relative;
	margin-bottom: 20px;
	box-sizing: border-box;
}

.mobile-content {
	width: 100%;
	height: 100%;
	overflow-y: auto;
	padding: 10px;
	box-sizing: border-box;
}

.message {
	display: flex;
	margin-bottom: 10px;
}

.message.sent {
	justify-content: flex-end;
}

.message.received {
	justify-content: flex-start;
}

.message .bubble {
	max-width: 70%;
	padding: 10px;
	border-radius: 20px;
	background-color: #f1f0f0;
	position: relative;
}

.message.sent .bubble {
	background-color: #007aff;
	color: white;
}

.sidebar {
	width: 100%;
	max-width: 390px;
	height: auto;
	background-color: transparent;
	padding: 10px;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.sidebar img {
	width: 100%;
	height: auto;
	border-radius: 8px;
}

button {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: none;
	border-radius: 5px;
	background-color: #ffb200;
	color: white;
	cursor: pointer;
}

button:hover {
	background-color: #005bb5;
}

@media ( min-width : 768px) {
	.container {
		flex-direction: row;
		justify-content: space-between;
	}
	.mobile-frame {
		margin-right: 20px;
		margin-bottom: 0;
	}
	.sidebar {
		align-items: flex-start;
	}
}

.switch-container {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	transition: .4s;
}

input:checked+.slider {
	background-color: #ffb200;
}

input:checked+.slider:before {
	transform: translateX(26px);
}

.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
</head>

<body>

	<div class="wrapper">
		<div class="header">메신저피싱 모의 체험</div>
		<div class="container">
			<!-- 오디오 재생을 위한 요소 추가 -->
			<audio id="audioElement" controls></audio>
			<div class="mobile-frame">
				<div class="mobile-content" id="mobile-content">
					<!-- 메시지가 이곳에 동적으로 추가됩니다 -->
				</div>
			</div>
			<div class="sidebar">
				<div class="switch-container">
					<label class="switch"> <input type="checkbox"
						id="toggleSwitch"> <span class="slider round"></span>
					</label> <span style="margin-left: 10px;">음성 기능</span>
				</div>
				<div id="sidebar-content">
					<!-- 버튼이 동적으로 추가됩니다 -->
				</div>
			</div>
		</div>
	</div>

	<script>
        var isLoggedIn = <c:out value="${sessionScope.isLoggedIn}" default="false" />;
    </script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
        var isSpeakingEnabled = false;

        document.addEventListener('DOMContentLoaded', function () {
            function addMessagesSequentially(messages, type, delay, callback) {
                if (messages.length === 0) {
                    if (callback) callback();
                    return;
                }
                addMessage(messages[0], type);
                setTimeout(function () {
                    addMessagesSequentially(messages.slice(1), type, delay, callback);
                }, delay);
            }

            function addMessage(content, type) {
                var mobileContent = document.getElementById('mobile-content');
                var message = document.createElement('div');
                message.className = 'message ' + type;
                var bubble = document.createElement('div');
                bubble.className = 'bubble';
                bubble.innerText = content;
                message.appendChild(bubble);
                mobileContent.appendChild(message);
                mobileContent.scrollTop = mobileContent.scrollHeight;

                if (isSpeakingEnabled) {
                    speakText(content, type === 'received' ? 'mijin' : 'jinho'); // 범죄자와 사용자의 목소리 설정
                }
            }

            function updateChat(choice) {
                console.log('updateChat called with choice:', choice);
                if (!choice) {
                    console.error('Choice is empty!');
                    return;
                }

                addMessage(choice, 'sent');

                switch (choice) {
                    case '핸드폰이 고장났다구? 전화를 해봐':
                        addMessagesSequentially([
                            '계속 목소리가 끊겨서 통화는 어려울 것 같아...',
                            '임시폰이라 그런가봐',
                            '일단 중고거래로 휴대폰을 사려고 하는데 이체가 안돼서 아빠/엄마가 먼저 돈 좀 보내줄 수 있어?'
                        ], 'received', 1000, function () {
                            updateSidebar('그럼 어떻게 해주면 돼?', '아무리 급해도 알아보고 하는게 좋을 것 같아. 이따가 집에가서 같이 이야기해보자');
                        });
                        break;
                    case '어떻게 도와줘?':
                        addMessagesSequentially([
                            '중고거래로 휴대폰을 사려고 하는데 이체가 안돼서 아빠/엄마가 먼저 돈 좀 보내줄 수 있어?',
                            '[국민은행 123456-78-90123] 홍사기 여기로 650,000원 보내고 나한테 알려줘!'
                        ], 'received', 1000, function () {
                            updateSidebar('그래, 지금 보냈어.', '아무리 급해도 엄마/아빠랑도 이야기해보는게 맞을 것 같다. 확인해보고 다시 연락해줄게');
                        });
                        break;
                    case '그래, 지금 보냈어.':
                        Swal.fire({
                            title: '예방실패!',
                            text: '지인 및 자녀를 사칭한 메신저피싱에 유의하세요.',
                            icon: 'warning',
                            showCloseButton: true,
                            confirmButtonText: '체험 다시하기'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload();
                            }
                        });
                        break;
                    case '그럼 어떻게 해주면 돼?':
                        addMessagesSequentially([
                            '[국민은행 123456-78-90123] 홍사기 여기로 650,000원 보내고 나한테 알려줘!'
                        ], 'received', 1000, function () {
                            updateSidebar('그래, 지금 보냈어.', '아무리 급해도 엄마/아빠랑도 이야기해보는게 맞을 것 같다. 확인해보고 다시 연락해줄게');
                        });
                        break;
                    case '아무리 급해도 알아보고 하는게 좋을 것 같아. 이따가 집에가서 같이 이야기해보자':
                    case '아무리 급해도 엄마/아빠랑도 이야기해보는게 맞을 것 같다. 확인해보고 다시 연락해줄게':
                        Swal.fire({
                            title: '예방성공!',
                            text: '지인 및 자녀를 사칭한 메신저피싱에 유의하세요',
                            icon: 'success',
                            showCloseButton: true,
                            showDenyButton: true,
                            confirmButtonText: '확인',
                            denyButtonText: '체험 다시하기'
                        }).then((result) => {
                            if (result.isConfirmed && isLoggedIn === true) {
                                updatePoints();  // 로그인 상태에서만 포인트 업데이트
                            } else if (result.isDenied) {
                                location.reload(); // 사용자가 다시 시도하기를 원할 경우 페이지를 리로드
                            }
                        });
                        break;
                    default:
                        console.error('Unhandled choice:', choice);
                }
            }

            function updatePoints() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/updatePoints",
                    method: "POST",
                    data: { pointReason: '메신저피싱 체험완료' },
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

            function updateSidebar(optionA, optionB) {
                var sidebarContent = document.getElementById('sidebar-content');
                sidebarContent.innerHTML = ''; // Clear previous content

                var buttonA = document.createElement('button');
                buttonA.className = 'response-button';
                buttonA.setAttribute('data-choice', optionA);
                buttonA.textContent = 'A: ' + optionA;
                sidebarContent.appendChild(buttonA);

                var buttonB = document.createElement('button');
                buttonB.className = 'response-button';
                buttonB.setAttribute('data-choice', optionB);
                buttonB.textContent = 'B: ' + optionB;
                sidebarContent.appendChild(buttonB);

                console.log('updateSidebar called with options:', optionA, optionB);

                document.querySelectorAll('.response-button').forEach(function (button) {
                    button.addEventListener('click', function () {
                        var choice = this.getAttribute('data-choice');
                        console.log('Button clicked with choice:', choice);
                        updateChat(choice);
                    });
                });
            }

            // Google TTS API 호출 대신 서버의 컨트롤러로 요청을 보냅니다.
   function speakText(text, speaker) {
    console.log('speakText 함수 호출됨');
    fetch('${pageContext.request.contextPath}/api/synthesize', {
        headers: {
            "Content-Type": "application/json"
        },
        method: "POST",
        body: JSON.stringify({
            text: text,
            speaker: speaker
        })
    })
    .then(response => response.json())
    .then(result => {
        if (result.audioContent) {
            console.log('Audio content received:', result.audioContent.substring(0, 50) + '...');

            // MP3 형식 지원 여부 확인
            const audioElement = document.getElementById("audioElement");
            const canPlayMp3 = audioElement.canPlayType('audio/mp3');

            if (canPlayMp3) {
                const audioData = result.audioContent;
                const audioBlob = base64ToBlob(audioData, 'audio/mp3');
                const audioUrl = URL.createObjectURL(audioBlob);

                audioElement.src = audioUrl;
                audioElement.play().catch(error => console.error('Audio playback failed:', error));
            } else {
                console.error('MP3 format is not supported by this browser.');
                Swal.fire({
                    title: '오디오 재생 실패',
                    text: '이 브라우저는 MP3 형식을 지원하지 않습니다. 다른 브라우저를 사용해 보세요.',
                    icon: 'error',
                    confirmButtonText: '확인'
                });
            }
        } else {
            console.error('No audio content returned from the API');
        }
    })
    .catch(error => {
        console.error('Error 발생:', error);
    });
}

function base64ToBlob(base64, mime) {
    const byteChars = atob(base64);
    const byteNumbers = new Array(byteChars.length);
    for (let i = 0; i < byteChars.length; i++) {
        byteNumbers[i] = byteChars.charCodeAt(i);
    }
    const byteArray = new Uint8Array(byteNumbers);
    return new Blob([byteArray], { type: mime });
}

            document.getElementById('toggleSwitch').addEventListener('change', function () {
                isSpeakingEnabled = this.checked;
                if (isSpeakingEnabled) {
                    var content = document.getElementById('mobile-content').innerText;
                    speakText(content, 'mijin'); // 전체 내용을 범죄자 목소리로 재생
                } else {
                    window.speechSynthesis.cancel();
                }
            });

            // 초기화 로직
            Swal.fire({
                title: '메신저피싱 시뮬레이션',
                text: '확인 버튼을 누르면 체험이 시작됩니다!',
                icon: 'info',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    addMessagesSequentially([
                        '아빠/엄마!! 지금 바빠??',
                        '나 핸드폰 물에 빠뜨려서 고장났어ㅠㅠ지금 임시폰으로 연락하고 있어',
                        '지금 좀 급한데 도와줄 수 있어?'
                    ], 'received', 1000, function () {
                        updateSidebar('핸드폰이 고장났다구? 전화를 해봐', '어떻게 도와줘?');
                    });
                }
            });
        });
    </script>
</body>

</html>
