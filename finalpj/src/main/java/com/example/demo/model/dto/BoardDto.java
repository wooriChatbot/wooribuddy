package com.example.demo.model.dto;

import com.example.demo.model.entity.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardDto {
	
	private int boardNo;
	private String title;
	private String content;
	private String userId;
	
	public Board toEntity() {
		Board board = new Board();
		board.setBoardNo(this.getBoardNo());
		board.setTitle(this.getTitle());
		board.setContent(this.getContent());
		return board;
		
	}
}
