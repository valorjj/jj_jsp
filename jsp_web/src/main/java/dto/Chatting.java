package dto;

import java.io.IOException;
import java.util.Vector;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatting") // 서버 소켓 [종착점] (경로생성)
public class Chatting {

	private static Vector<Session> clients = new Vector<Session>();

	@OnOpen // 소켓에 접속하는 어노테이션
	// 클라이언트가 서버로부터 접속 요청
	public void onOpen(Session session) {
		clients.add(session);
		
	}

	@OnClose // 소켓으로부터 접속 해지하는 어노테이션
	// 클라이언트가 서버로부터 접속 해지
	public void onClose(Session session) {
		clients.remove(session);
	}

	// 서버가 클라이언트로부터 메시지 받는 메소드
	@OnMessage // 메시지를 받는 어노테이션
	public void onMessage(String msg, Session session) {
		// @Param : 메시지, 세션
		for (Session client : clients) {
			if (!client.equals(session)) {
				// 본인을 제외한 모든 사람에게
				try {
					client.getBasicRemote().sendText(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

	/*
	 * @OnError // 알아서 오류생기면 소켓이 끊기기 때문에 굳이 쓸 필요는 없어요 그냥 있으니까 적어봤네요 public void
	 * onError(Session session) {
	 * 
	 * }
	 */

}
