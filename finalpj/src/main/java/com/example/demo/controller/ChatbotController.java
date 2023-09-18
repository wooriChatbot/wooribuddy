package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.model.dto.ChatbotDto;
import com.example.demo.model.dto.MoneyDto;
import com.example.demo.model.entity.ChatMessage;
import com.example.demo.model.service.ChatbotService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chatbot")
@SessionAttributes({ "chatMessages", "QAresponse", "GPTresponse" })
public class ChatbotController {

	@Autowired
	private ChatbotService chatbotService;

	@ModelAttribute("chatMessages")
	public List<ChatMessage> initializeChatMessages(HttpSession session) {
		// Try to retrieve chat history from the session
		List<ChatMessage> chatMessages = (List<ChatMessage>) session.getAttribute("chatMessages");

		// If chat history doesn't exist in the session, create a new one
		if (chatMessages == null) {
			chatMessages = new ArrayList<>();
			session.setAttribute("chatMessages", chatMessages);
		}

		return chatMessages;
	}

	@GetMapping("/chat")
	public String chatForm() {
		return "chatbot/chat";

	}

	@PostMapping("/chat")
	public String postQAChatbotResponse(@RequestParam("question") String question, Model model,
			@ModelAttribute("chatMessages") List<ChatMessage> chatMessages, HttpSession session) {

		String QAresponse = chatbotService.getQAChatbotResponse(question);
		QAresponse = chatbotService.decodeUnicode(QAresponse);
		model.addAttribute("QAresponse", QAresponse);

		System.out.println("QA:" + QAresponse);

		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonResponse;
		try {
			jsonResponse = objectMapper.readTree(QAresponse);
			String result_answer = jsonResponse.get("answer").asText();
			String best_context = jsonResponse.get("best_context").asText();
			String user_question = jsonResponse.get("aaquestion").asText();
			// System.out.println(question);

			result_answer = chatbotService.decodeUnicode(result_answer);
			best_context = chatbotService.decodeUnicode(best_context);
			user_question = chatbotService.decodeUnicode(user_question);

			// Add user's question to chat messages
			ChatMessage userMessage = new ChatMessage("user", question);
			chatMessages.add(userMessage);

			// Add chatbot's response to chat messages
			ChatMessage chatbotResponse = new ChatMessage("chatbot", result_answer);
			chatMessages.add(chatbotResponse);

			// Set the chat messages list in the model
			model.addAttribute("chatMessages", chatMessages);

			session.setAttribute("chatMessages", chatMessages);

			model.addAttribute("chatMessages", chatMessages);

			model.addAttribute("result_answer", result_answer);
			model.addAttribute("best_context", best_context);
			model.addAttribute("user_question", user_question);

			return "chatbot/chat";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping("/gpt")
	public String postGPTChatbotResponse(@ModelAttribute ChatbotDto dto, @RequestParam("question") String question,
			@RequestParam(required = false, defaultValue = "yes") String feedback, Model model,
			@ModelAttribute("chatMessages") List<ChatMessage> chatMessages, HttpSession session) {

		System.out.println("question:" + question);
		if ("no".equals(feedback)) {

			try {

				//JSONObject jsonResponse1 = new JSONObject(question);
				//String answer = jsonResponse1.getString("answer");
				//String best_context = jsonResponse1.getString("best_context");

				// GPT 답변보완 요청
				JSONObject jsonRequest2 = new JSONObject();
				//jsonRequest2.put("answer", answer); // 수정된 부분
				//jsonRequest2.put("best_context", best_context); // 수정된 부분
				jsonRequest2.put("aaquestion", question); // 수정된 부분
				String GPTresponse = chatbotService.getGPTChatbotResponse(question);
				model.addAttribute("GPTresponse", GPTresponse);

				// Add chatbot's response to chat messages
				ChatMessage gptResponse = new ChatMessage("gpt", GPTresponse);
				chatMessages.add(gptResponse);
				
				log.debug("chatbot dto: {}",dto);
				chatbotService.registChatbot(dto);
				
				return "chatbot/chat";// Return the view name

			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else {
			
			log.debug("chatbot dto: {}",dto);
			chatbotService.registChatbot(dto);
			return "chatbot/chat";
		}
	}
}
