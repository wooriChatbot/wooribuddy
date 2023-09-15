package com.example.demo.model.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.example.demo.model.dto.MoneyDto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Money {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, name = "money_no")
	private int moneyNo;
	
	
	private int money;
	private String type;
	
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date days;
	
	@Column(nullable = true, name = "money_type")
	private String moneyType;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	public MoneyDto toDto() {
		MoneyDto dto = new MoneyDto();
		dto.setDays(this.getDays());
		dto.setMoney(this.getMoney());
		dto.setMoneyNo(this.getMoneyNo());
		dto.setType(this.getType());
		dto.setUserId(this.getUser().getId());
		dto.setMoneyType(this.getMoneyType());
		
		return dto;
	}

}
