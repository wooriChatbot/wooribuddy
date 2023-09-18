package com.example.demo.model.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Optional;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.demo.model.dto.ChatbotDto;
import com.example.demo.model.dto.MoneyDto;
import com.example.demo.model.entity.Chatbot;
import com.example.demo.model.entity.Money;
import com.example.demo.model.entity.User;
import com.example.demo.model.repo.ChatbotRepository;
import com.example.demo.model.repo.UserRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.transaction.Transactional;
import net.minidev.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class ChatbotService {
	private UserRepository urepo;
	private ChatbotRepository crepo;

	@Autowired
	public ChatbotService(UserRepository urepo, ChatbotRepository crepo) {
		this.urepo = urepo;
		this.crepo = crepo;
	}

	// 유니코드 이스케이프 문자열을 디코드하는 함수
	public String decodeUnicode(String str) {
		Pattern pattern = Pattern.compile("\\\\u([0-9A-Fa-f]{4})");
		Matcher matcher = pattern.matcher(str);
		StringBuffer sb = new StringBuffer();
		while (matcher.find()) {
			matcher.appendReplacement(sb, String.valueOf((char) Integer.parseInt(matcher.group(1), 16)));
		}
		matcher.appendTail(sb);
		return sb.toString();
	}
	
	@Transactional
	   public void registChatbot(ChatbotDto dto) {
	      String userId = dto.getUserId();
	      System.out.println(userId);
	      User user = urepo.getReferenceById(userId);
	      Chatbot chatbot = dto.toEntity();
	      chatbot.setUser(user);
	      crepo.saveAndFlush(chatbot);
	   }
	
	public String getQAChatbotResponse(String question) {
		// Create a JSON request and send it to the QA model
		JSONObject jsonRequest = new JSONObject();
		jsonRequest.put("question", question);
		String response = sendPostRequest("http://15.165.250.251:5000/model_response", jsonRequest.toString());
		return response;
	}

	public String getGPTChatbotResponse(String question) {
		// Create a JSON request and send it to the GPT model
		JSONObject jsonRequest = new JSONObject();
		jsonRequest.put("question", question);
		String response = sendPostRequest("http://15.165.250.251:5000/gpt_response", jsonRequest.toString());

		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonResponse;
		try {
			jsonResponse = objectMapper.readTree(response);
			// Retrieve the "answer" value from the JSON
			String result_answer = jsonResponse.get("response_text").asText();

			result_answer = decodeUnicode(result_answer);
			// Additional processing and decoding can be done here
			return result_answer;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	private String sendPostRequest(String urlString, String requestBody) {
		// Your HTTP POST request logic here
		try {
			URL url = new URL(urlString);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json; utf-8");
			con.setRequestProperty("Accept", "application/json");
			con.setDoOutput(true);

			try (OutputStream os = con.getOutputStream()) {
				byte[] input = requestBody.getBytes("utf-8");
				os.write(input, 0, input.length);
			}

			try (BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine = null;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}

				return response.toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
