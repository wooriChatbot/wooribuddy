package com.example.demo.model.entity;

import com.example.demo.model.dto.BoardDto;

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
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, name = "board_no")
	private int boardNo;
	private String title;
	private String content;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	public BoardDto toDto() {
		BoardDto dto = new BoardDto();
		dto.setBoardNo(this.getBoardNo());
		dto.setTitle(this.getTitle());
		dto.setContent(this.getContent());
		dto.setUserId(this.getUser().getId());
		return dto;
	}


}
