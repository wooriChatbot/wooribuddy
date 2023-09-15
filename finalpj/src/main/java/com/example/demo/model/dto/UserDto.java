package com.example.demo.model.dto;


import com.example.demo.model.entity.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
// Database와 무관하게 화면 --> Service까지 사용
public class UserDto {
	
	private String id;
	private String name;
	private String pw;
	private String grade;
	private String phoneNo;
	
	public User toEntity() {
		User user = new User();
		user.setId(this.getId());
		user.setName(this.getName());
		user.setPw(this.getPw());
		user.setGrade(this.getGrade());
		user.setPhoneNo(this.getPhoneNo());
		return user;
		
	}

}