package com.example.demo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.example.demo.model.repo.BoardRepository;
import com.example.demo.model.repo.ChatbotRepository;
import com.example.demo.model.repo.MoneyRepository;
import com.example.demo.model.repo.UserRepository;
import com.jayway.jsonpath.JsonPath;

import jakarta.transaction.Transactional;

@Service
public class OpenAiService {

	@Autowired
	private RestTemplate restTemplate;

	@Value("${API_KEY}")
	private String API_KEY;

	@Value("${MODEL_ID}")
	private String MODEL_ID;

	@Value("${URL}")
	private String URL;

	private UserRepository urepo;
	private ChatbotRepository crepo;

	@Autowired
	public OpenAiService(UserRepository urepo, ChatbotRepository crepo) {
		this.urepo = urepo;
		this.crepo = crepo;
	}

	public String OpenAiSericeCall(String userInput) {

		HttpHeaders headers = new HttpHeaders();

		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Authorization", "Bearer " + API_KEY);

		String requestBody = "{\"model\": \"" + MODEL_ID + "\", \"messages\":[{\"role\": \"user\", " + "\"content\": \""
				+ userInput + "\"}]}";

		HttpEntity<String> requestEntity = new HttpEntity<>(requestBody, headers);

		String response = restTemplate.postForObject(URL, requestEntity, String.class);

		return parseResponse(response);

	}

	private String parseResponse(String jsonResponse) {
		try {
			String content = JsonPath.read(jsonResponse, "$.choices[0].message.content");
			return content;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "Unable to get a valid response from the API.";
	}

}