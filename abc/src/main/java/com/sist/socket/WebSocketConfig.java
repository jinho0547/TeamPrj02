package com.sist.socket;

import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

//@Configuration
//@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addHandler(chatHandler(), "/chat-ws");
		System.out.println("Call... 1");
	}

	@Bean
	public WebSocketChatHandler chatHandler() {
		System.out.println("Server start...");
		return new WebSocketChatHandler();
	}

}