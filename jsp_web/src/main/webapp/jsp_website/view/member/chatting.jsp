<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<%@ include file="../header.jsp"%>

	<div class="text-center">실시간 채팅</div>
	<div class="container">
		<div class="row">
			<button id="btnEnter" onclick="start('<%=loginid%>');"
				class="form-control col-md-4 offset-4">채팅방 들어가기</button>
		</div>

		<!-- 채팅방 만들기 -->
		<div class="row my-3" id="startDiv">
			<button onclick="start('<%=loginid%>', 1)"
				class="form-control col-md-3">채팅방1</button>
			<button onclick="start('<%=loginid%>', 2)"
				class="form-control col-md-3">채팅방2</button>
			<button onclick="start('<%=loginid%>', 3)"
				class="form-control col-md-3">채팅방3</button>
			<button onclick="start('<%=loginid%>', 4)"
				class="form-control col-md-3">채팅방4</button>
		</div>
		<!-- 채팅방 만들기 -->
		<div class='row'>
			<input type="hidden" id="roomNo" />
			<!-- js 외에 변수를 만들어서 저장한다  -->
		</div>

		<!-- 채팅방 나가기 -->
		<div class="row my-3" id="roomInfo" style="display: none;">
			<div id="roomNo"></div>
			<button onclick="exit();" class="form-control col-md-4 offset-4"
				id="btnExit">채팅방 나가기</button>
		</div>
		<!-- 채팅방 나가기 -->


		<div class="row">
			<div class="col-md-6" style="display: none;" id="chatBox">

				<div id="msgbox">
					<!-- 채팅창 추가되는 위치 -->
				</div>
				<!-- 채팅창 하단 -->
				<div class="row no-gutters">
					<div class="col-md-2">
						<input id="toid" class="form-control" type="text" placeholder="공개">
					</div>
					<!-- 채팅 입력과 버튼 -->
					<div class="col-md-8" style="margin: 5px;">
						<input type="text" class="form-control" placeholder="내용 입력"
							id="msginput" />
						<!--  onkeyup="함수();" -->
					</div>

					<div class="col-md-2" style="margin: 5px;">
						<button class="form-control" id="" onclick="msgSend();">전송</button>

					</div>
				</div>
				<!-- 채팅창 하단 -->
			</div>
		</div>
	</div>


	<script type="text/javascript">
		// webSocket 은 servlet 에서 지원하는 library 입니다.
		// 
		var loginid = null; // 로그인 아이디 null 값으로 초기화 시키며 메모리 할당
		var msgbox = null; // 채팅창 null 값으로 초기화 시키며 메모리 할당
		var webSocket = null; // 소켓 null 값으로 초기화 시키며 메모리 할당 
		// 1. 입력창에 입력된 데이터를 가져온다. 
		var msginput = document.getElementById('msginput').value;

		var roomNo = 0; // 채팅창 번호

		function roomSelect(no) {
			roomNo = no; // 방 번호를 사용해 초기화시킨다. 
			document.getElementById('').innerHTML = '';

		}
		// 2. 현재 회원 아이디 가져오기 
		// var loginid = document.getElementById('loginid').value; // value 속성이 있는 태그만 가능

		// 4. 웹 소켓 { ws://http port번호/프로젝트명/경로 }

		function start(id, no) {

			// 회원제 게시판 컨셉이니까, 로그인 안되어있을 때를 막습니다.

			if (id == null) {
				alert('로그인 후 진행할 수 있습니다. ');
			} else {// 로그인 아이디 null 값으로 초기화 시키며 메모'
				document.getElementById('chatBox').style = 'display: block';
				document.getElementById('startDiv').style = 'display: none';
				document.getElementById('btnExit').style = 'display: block';
				loginid = id;
				msgbox = document.getElementById('msgbox'); // 3. 채팅창 가져오기 
				msgbox.innerHTML += "<div class='text-center roomStart'>" + no
						+ " 번째 방에 입장</div>";
				roomNo = no;
				document.getElementById('chatBox').value = roomNo;
				webSocket = new WebSocket(
						'ws://localhost:8081/jsp_web/chatting/' + roomNo); // 접속 객체 생성 
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
				document.getElementById('startDiv').style = 'display: block';

			}

		}

		function exit() { // 방 나가기 [1. 채팅방 초기화 2. 소켓 닫기 3. 채팅방 숨기기]
			document.getElementById('chatBox').style = 'display: none'; // 채팅방 숨기고
			document.getElementById('msgbox').innerHTML = ''; // 채팅방 초기화
			document.getElementById('startDiv').style = 'display: none'; // 채팅창 목록
			document.getElementById('btnExit').style = 'display: none'; // 나가기 버튼 숨기기
			webSocket.close(); // 소켓 닫기 

		}

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

		// 7. 보내는 메소드 [ 전송 버튼 눌렀을 때 ]
		function msgSend() {
			send();
				
			// keyup 이벤트를 어떻게 받아올까?
			if (window.event.keyCode == 13) {
				send();
			}
		}

		function send() {

			var msginput = document.getElementById('msginput').value;
			if (msginput == "") { // 공백 전송을 막는다. 
				return;
			}
			// 누가 보냈는지 도 같이 보낸다.
			let today = new Date();
			var time = today.toLocaleTimeString();
			var toid = document.getElementById('toid').value;
			// 보내는 메시지 내용
			if (toid == "") { // 귓속말 대상이 없으면
				toid = 'all';
			}

			roomNo = document.getElementById('chatBox').value = roomNo;

			var msg = roomNo + ',' + loginid + ',' + toid + ',' + msginput
					+ ',' + time;
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

		// 8. 받는 메소드 [보낸 클라이언트 따로, 받는 클라이언트 따로따로야~]
		function onMessage(event) {
			// 받은 메시지에서 방번호를 제외한 나머지를 분리한다. 
			var from = event.data.split(',')[1]; // ','  기준으로 문자열 스플릿
			var to = event.data.split(',')[2];
			var msg = event.data.split(',')[3];
			var time = event.data.split(',')[4];

			// 현재 로그인된 아이디와 to 와 동일할 경우 [ 특정 아이디만 메시지 받음]
			if (loginid == to) {

				msgbox.innerHTML += "<div class='profile'>" + from + "</div>"
				msgbox.innerHTML += "<div class='d-flex justify-content-start mx-2 my-2'> <span class='to d-flex align-items-end'>"
						+ msg
						+ "</span> <span class='msgtime d-lfex align-items-end'> "
						+ time + " </span> </div>";
				msgbox.scrollTop = msgbox.scrollHeight; // 현 스크롤 위치 =  스크롤 전체높이[바닥]

			}

			// 모든 메시지 [모든 사람이 받는 메시지]
			else if (to == 'all') {

				msgbox.innerHTML += "<div class='profile'>" + from + "</div>"
				msgbox.innerHTML += "<div class='d-flex justify-content-start mx-2 my-2'> <span class='to d-flex align-items-end'>"
						+ msg
						+ "</span> <span class='msgtime d-lfex align-items-end'> "
						+ time + " </span> </div>";
				msgbox.scrollTop = msgbox.scrollHeight; // 현 스크롤 위치 =  스크롤 전체높이[바닥]

			}
			// 다를 경우 [메시지 전송 불가]
			else {

			}

		};
	</script>

</body>
</html>