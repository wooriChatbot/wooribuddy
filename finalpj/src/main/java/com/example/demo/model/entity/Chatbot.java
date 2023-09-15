package com.example.demo.model.entity;

import com.example.demo.model.dto.ChatbotDto;

import jakarta.persistence.Column;
//import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
//import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
//import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
//import lombok.ToString;

//@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
//@ToString(exclude = "user")
public class Chatbot {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, name = "chatbot_no")
	private int chatbotNo;
	private String input;
	private String output;
	private String feedback;
	private String bestContext;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	public ChatbotDto toDto() {
		ChatbotDto dto = new ChatbotDto();
		dto.setChatbotNo(this.getChatbotNo());
		dto.setFeedback(this.getFeedback());
		dto.setInput(this.getInput());
		dto.setOutput(this.getOutput());
		dto.setUserId(this.getUser().getId());
		dto.setBestContext(this.getBestContext());
		return dto;
	}


}
