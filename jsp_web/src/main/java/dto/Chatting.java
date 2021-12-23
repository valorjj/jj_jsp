package dto;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;
import java.util.Map.Entry;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatting/{roomNo}") // 서버 소켓 [종착점] (경로생성)
public class Chatting {

	private Integer roomNo = 0;

	private static Map<Session, Integer> clients = new Hashtable<Session, Integer>();

	@OnOpen // 소켓에 접속하는 어노테이션
	// 클라이언트가 서버로부터 접속 요청
	public void onOpen(Session session, @PathParam("roomNo") int roomNo) {
		this.roomNo = roomNo;
		clients.put(session, this.roomNo);

	}

	@OnClose // 소켓으로부터 접속 해지하는 어노테이션
	// 클라이언트가 서버로부터 접속 해지
	public void onClose(Session session) {
		clients.remove(session); // 특정 roomNo 을 제거시킨다. roomNo 에서 퇴장
	}

	// 서버가 클라이언트로부터 메시지 받는 메소드
	@OnMessage // 메시지를 받는 어노테이션
	public void onMessage(String msg, Session session) throws IOException {

		for (Session key : clients.keySet()) {
			if (clients.get(key) == Integer.parseInt(msg.split(",")[0])) {
				// 같은 방에 있는 사람한테만
				if (!key.equals(session)) {
					key.getBasicRemote().sendText(msg);
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
