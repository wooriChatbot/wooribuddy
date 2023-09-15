package com.example.demo.model.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessage {
	private String sender;
	private String content;

	public ChatMessage(String sender, String content) {
		this.sender = sender;
		this.content = content;
	}
}
