package com.example.demo.model.entity;


import java.util.List;

import com.example.demo.model.dto.UserDto;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrimaryKeyJoinColumn;
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
//@ToString(exclude = "boards")
//Database와 관련되며 Service --> Repository에서 사용
public class User {
	@Id
	@Column(nullable = true, name = "id", insertable=false, updatable=false)
	private String id;
	private String name;
	private String pw;
	private String grade;
	@Column(nullable = true, name = "phone_no")
	private String phoneNo;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
	private List<Board> boards;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
	private List<Money> moneys;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
	private List<Chatbot> chatbots;
	

	public UserDto toDto() {
		UserDto user = new UserDto();
		user.setId(this.getId());
		user.setName(this.getName());
		user.setPw(this.getPw());
		user.setGrade(this.getGrade());
		user.setPhoneNo(this.getPhoneNo());
		return user;

	}
}
