package com.example.demo.model.service;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.example.demo.controller.MoneyController;
import com.example.demo.model.dto.MoneyDto;

import com.example.demo.model.entity.Money;
import com.example.demo.model.entity.User;

import com.example.demo.model.repo.MoneyRepository;
import com.example.demo.model.repo.UserRepository;

import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MoneyService {

   
   private UserRepository urepo;
   private MoneyRepository mrepo;
   
   @Autowired
   public MoneyService(UserRepository urepo, MoneyRepository mrepo) {
      this.urepo = urepo;
      this.mrepo = mrepo;
   }
   
   @Transactional
   public void writeMoney(MoneyDto dto) {
      String userId = dto.getUserId();
      User user = urepo.getReferenceById(userId);
      Money money = dto.toEntity();
      money.setUser(user);
      mrepo.saveAndFlush(money);
   }
   
   public Page<Money> listMoney(int page){

	  long totalMoneyCount = mrepo.count();
	  log.debug("totalMoneyCount: {}",totalMoneyCount);
	  int pageSize = (int)totalMoneyCount;
	  if(pageSize < 1) {
		  pageSize = 1;
	  }
      Pageable pageable = PageRequest.of(page, pageSize, Direction.DESC, "days");
      Page<Money> pageInfo = mrepo.findAll(pageable);
      return pageInfo;
   }
//      return brepo.findAll(pageable);
  
   public void deleteMoney(int moneyNo) {
      mrepo.deleteById(moneyNo);
      
   }
   
   public Page<Money> listMoneyByYearAndMonth(int page, String userId, int year, int month) {
	  long totalMoneyCount = mrepo.count();
	  log.debug("totalMoneyCount: {}",totalMoneyCount);
	  int pageSize = (int)totalMoneyCount;
	  if(pageSize < 1) {
		  pageSize = 1;
	  }
      Pageable pageable = PageRequest.of(page, pageSize, Direction.DESC, "days");
       Page<Money> pageInfo = mrepo.findByUserIdAndYearAndMonth(userId, year, month, pageable);
       return pageInfo;
   }
   
   
}