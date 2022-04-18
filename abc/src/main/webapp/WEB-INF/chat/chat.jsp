<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
	let websocket;
	function connection() {
		// 소켓 생성 
		websocket = new WebSocket("ws://localhost:8080/chat")
		websocket.onopen = onOpen;
		console.log(websocket.onopen);
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}
	// callback => websocket에서 자동 호출 함수 지정 
	function onOpen(event) {
		alert("스프링 채팅 서버와 연결되었습니다!!");
	}
	function onMessage(event) {
		let data = event.data;
		if (data.substring(0, 4) == "msg:")
		{
			appendMessage(data.substring(4));
		}
	}
	function onClose(event) {
		alert("스프링 채팅서버와 연결 종료되었습니다!!")
		websocket.onerror = function(event) {
			console.log(event);
		}
	}
	function disConnection() {
		websocket.close();
	}
	function send() {
		let name = $('#name').val();
		if (name.trim() == "") {
			$('#name').focus();
			return;
		}
		let msg = $('#sendMsg').val();
		if (msg.trim() == "") {
			$('#sendMsg').focus();
			return;
		}
		// 입력이 된 경우
		websocket.send("msg:[" + name + "]" + msg);
		$('#sendMsg').val("")
		$('#sendMsg').focus();
	}
	function appendMessage(msg) {
		$('#recvMsg').append(msg + "<br>");
		let ch = $('#chatArea').height();
		let m = $('#recvMsg').height() - ch;
		$('#chatArea').scrollTop(m);
	}
	$(function() {
		$('#startBtn').click(function() {
			connection();
		})
		$('#closeBtn').click(function() {
			disConnection();
		})
		$('#sendBtn').click(function() {
			send();
		})
		$('#sendMsg').keydown(function(key) {
			if (key.keyCode == 13)//13=enter
			{
				send();
			}
		})
	})
</script>
<style type="text/css">
#name{
	width: 200px;
	height: 50px;
	border-radius: 0 0 0 10px;
	border: none;
	padding-left: 20px;
	font-size: 25px;
}
#startBtn{
	width: 100px;
	height: 50px;
	margin-left: 5px;
	font-size: 25px;
	color: white;
	font-weight: 700;
}
#sendMsg{
	width: 500px;
	height: 50px;
	border: none;
	margin-left: 10px;
	padding-left: 20px;
	font-size: 25px;
}
#sendBtn{
	width: 100px;
	height: 50px;
	margin-left: 5px;
	font-size: 25px;
	border-radius: 0 0 10px 0;
	color: white;
	font-weight: 700;
}
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 0px;">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 50px;">
			<div class="row" style="width: 1000px;margin: 0px auto; background-color: #fdbe51; border-radius: 20px; padding: 20px 10px 10px 10px;">
				
				<%-- security , task , validation --%>
				<div class="text-center">
					<table class="table">
						<tr>
							<td colspan="2">
								<div id="chatArea" 
									style="height: 500px; overflow-y: auto; width: 100%;border-radius: 20px 20px 0 0; background-color: white;">
									<div id="recvMsg" style="padding: 20px; text-align: left;font-size: 25px;"></div>
								</div>
							</td>	
						</tr>
						<tr>
							<td><input type=text id=name class="inpu-sm"
								style="float: left" value="${id }"> <input type=button value="입장"
								class="btn btn-sm btn-info" id="startBtn" style="float: left">
							</td>
							<td><input type=text id="sendMsg" size=70 class="input-sm"
								style="float: left"> <input type=button id="sendBtn"
								class="btn btn-sm btn-danger" value="전송" style="float: left">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</main>
	</div>
</body>
</html>