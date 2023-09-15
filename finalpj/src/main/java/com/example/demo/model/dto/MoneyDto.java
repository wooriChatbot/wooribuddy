package com.example.demo.model.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.example.demo.model.entity.Money;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MoneyDto {
	private int moneyNo;
	private String userId;
	private int money;
	private String type;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date days;
	
	private String moneyType;
	
	public Money toEntity() {
		Money money = new Money();
		money.setDays(this.getDays());
		money.setMoney(this.getMoney());
		money.setMoneyNo(this.getMoneyNo());
		money.setMoneyType(this.getMoneyType());
		money.setType(this.getType());
		return money;
	}

}
