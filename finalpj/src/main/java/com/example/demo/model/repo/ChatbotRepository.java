package com.example.demo.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.entity.Chatbot;


public interface ChatbotRepository extends JpaRepository<Chatbot, Integer>{
	// 특정 페이지의 데이터만 보이도록 처리
	

}
