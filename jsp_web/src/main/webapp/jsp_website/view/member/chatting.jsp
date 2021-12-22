<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<%@ include file="../header.jsp"%>

	<div class="container">

		<div class="row">

			<div class="col-md-6">

				<div id="msgbox"></div>
				<div class="row no-gutters">
					<!-- 채팅 입력과 버튼 -->
					<div class="col-md-9" style="margin: 5px;">
						<input type="text" class="form-control" placeholder="내용 입력"
							id="msginput" onkeyup="entersend();" />
					</div>
					<div class="col-md-2" style="margin: 5px;">
						<button class="form-control" onclick="btnsend();">전송</button>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<button onclick="onOpen();"></button>

				보내는 사람 : <input class="form-control" type="text"
					value="<%=loginid%>" id="loginid"> 받는 사람 : <input
					type="text" class="form-control" value="all" /> 접속 회원 목록 :
				<div id="mlist"></div>

			</div>
		</div>
	</div>


	<script type="text/javascript">
		// 1. 입력창에 입력된 데이터를 가져온다. 
		var msginput = document.getElementById('msginput').value;
		// 2. 현재 회원 아이디 가져오기 
		var loginid = document.getElementById('loginid').value; // value 속성이 있는 태그만 가능
		// 3. 채팅창 가져오기 
		var msgbox = document.getElementById('msgbox');
		// 4. 웹 소켓 { ws://http port번호/프로젝트명/경로 }
		var webSocket = new WebSocket('ws://localhost:8081/jsp_web/chatting'); // 접속 객체 생성 
		// 5. 웹소켓 메소드
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onclose = function(event) {
			onClose(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		webSocket.onerror = function(event) {
			onError(event)
		};

		// 6. 이벤트 메소드 정의 
		function onOpen(event) {
			alert('접속 되었습니다.');
		}
		function onClose(event) {
			alert('퇴장 했습니다.');
		}

		function onError(event) {
			alert(event.data);
		}

		// 7. 보내는 메소드
		function btnsend() {
			// 엔터를 눌렀을 때 

			var msginput = document.getElementById('msginput').value;
			if (msginput == "") { // 공백 전송을 막는다. 
				return;
			}
			// 누가 보냈는지 도 같이 보낸다.
			let today = new Date();
			var time = today.toLocaleTimeString();
			var msg = loginid + ',' + msginput + ',' + time;
			// 입력된 문자와 날짜를 포함시킨다. 
			msgbox.innerHTML += "<div class='d-flex justify-content-end mx-2 my-2'> <span class='msg-time d-flex align-items-end'> "
					+ time
					+ " </span> <span class='from mx-1'> "
					+ msginput
					+ "</span> </div> "; // 서버로부터 메시지 전송 
			webSocket.send(msg); // *** 서버로부터 메시지 전송
			document.getElementById('msginput').value = "";
			// 스크롤이 있을 경우 스크롤 위치를 가장 아래로 이동한다. 
			msgbox.scrollTop = masbox.scrollHeight;
			// 현 스크롤 위치 = 스크롤 전체높이 [바닥]

		}

		function entersend() {
			// 엔터를 눌렀을 때 
			// window  에서 'enter' 라는 이벤트가 없다. 
			if (window.event.keyCode == 13) {
				// 윈도우 키보드 이벤트에 할당된 키코드 enter = 13;
				var msginput = document.getElementById('msginput').value;
				if (msginput == "") { // 공백 전송을 막는다. 
					return;
				}
				// 누가 보냈는지 도 같이 보낸다.
				let today = new Date();
				var time = today.toLocaleTimeString();
				var msg = loginid + ',' + msginput + ',' + time;
				// 입력된 문자와 날짜를 포함시킨다. 
				msgbox.innerHTML += "<div class='d-flex justify-content-end mx-2 my-2'> <span class='msg-time d-flex align-items-end'> "
						+ time
						+ " </span> <span class='from mx-1'> "
						+ msginput + "</span> </div> "; // 서버로부터 메시지 전송 
				webSocket.send(msg); // *** 서버로부터 메시지 전송
				document.getElementById('msginput').value = "";
				// 스크롤이 있을 경우 스크롤 위치를 가장 아래로 이동한다. 
				msgbox.scrollTop = masbox.scrollHeight;
				// 현 스크롤 위치 = 스크롤 전체높이 [바닥]
			}

		}

		// 8. 받는 메소드 
		function onMessage(event) {
			var from = event.data.split(',')[0];
			var msg = event.data.split(',')[1];
			var time = event.data.split(',')[2];
			msgbox.innerHTML += "<div class='profile'>" + from + "</div>"
			msgbox.innerHTML += "<div class='d-flex justify-content-start mx-2 my-2'> <span class='to d-flex align-items-end'>"
					+ msg
					+ "</span> <span class='msgtime d-lfex align-items-end'> "
					+ time + " </span> </div>";
			msgbox.scrollTop = msgbox.scrollHeight;
			// 현 스크롤 위치 =  스크롤 전체높이[바닥]

		};
	</script>

</body>
</html>