package com.example.demo.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.entity.User;

public interface UserRepository extends JpaRepository<User, String>{

}
