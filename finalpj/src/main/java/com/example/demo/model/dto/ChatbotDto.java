package com.example.demo.model.dto;

import com.example.demo.model.entity.Chatbot;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatbotDto {
	
	private int chatbotNo;
	private String input;
	private String output;
	private String feedback;
	private String userId;
	private String bestContext;
	
	public Chatbot toEntity() {
		Chatbot chatbot = new Chatbot();
		chatbot.setChatbotNo(this.getChatbotNo());
		chatbot.setFeedback(this.getFeedback());
		chatbot.setInput(this.getInput());
		chatbot.setOutput(this.getOutput());
		chatbot.setBestContext(this.getBestContext());
		return chatbot;
		
	}
}
