package com.sist.socket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")
public class ChatServer {
	private static Set<Session> users = Collections.synchronizedSet(new HashSet<Session>());

	@OnOpen
	public void onOpen(Session session) {
		users.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		users.remove(session);
	}

	@OnMessage
	public void onMessage(String message, Session session) throws Exception {
		// 동기화 - 쓰레드에 대표적인 기능
		synchronized (users) {
			for (Session client : users) {
				client.getBasicRemote().sendText(message);
			}
		}
	}
}
