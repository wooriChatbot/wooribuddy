package com.example.demo.model.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.entity.Money;

public interface MoneyRepository extends JpaRepository<Money, Integer>{

    @Query("SELECT m FROM Money m WHERE m.user.id = :userId AND YEAR(m.days) = :year AND MONTH(m.days) = :month")
    Page<Money> findByUserIdAndYearAndMonth(String userId, int year, int month, Pageable pageable);
    
    void deleteByUserId(String userId);
}
