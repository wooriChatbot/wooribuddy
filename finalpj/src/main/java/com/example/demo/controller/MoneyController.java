package com.example.demo.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.dto.MoneyDto;
import com.example.demo.model.entity.Money;
import com.example.demo.model.service.MoneyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/money")
@Slf4j
public class MoneyController {
   
   private MoneyService service;
   
   @Autowired
   public MoneyController(MoneyService service) {
      this.service = service;

   }
   
   @GetMapping("/regist")
   public String registForm() {
      return "money/registmoney";
   }
   
   @PostMapping("/regist")
   public String doRegist(@ModelAttribute MoneyDto dto, @RequestParam(required = false) String userId) {
      log.debug("money regist 전달 파라미터 확인: {}", dto);
      service.writeMoney(dto);
      return "redirect:/money/list?year=&month=&userId="+userId;
   }

   
   @GetMapping("/list")
   public String list(@RequestParam(required = false, defaultValue = "1")Integer page, @RequestParam(required = false) Integer year, @RequestParam(required = false) Integer month, @RequestParam(required = false) String userId,Model model) {
      page--;
      log.debug("page: {}",page);
      
      Page<Money> moneyPageInfo;
      if (year != null && month != null) {
          // If both year and month are provided, retrieve specific data
          moneyPageInfo = service.listMoneyByYearAndMonth(page,userId, year, month);
      } else {
          // Otherwise, retrieve all data
         
          Date date = new Date();
          Calendar calendar = new GregorianCalendar();
          calendar.setTime(date);
          moneyPageInfo = service.listMoneyByYearAndMonth(page, userId,calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1);
      }
      model.addAttribute("moneyPageInfo", moneyPageInfo);
      return "money/list";
   }
   
   
   @GetMapping("/delete")
   public String delete(@RequestParam(required = false) String userId, @RequestParam int no) {
      log.debug("money no: {}", no);
      service.deleteMoney(no);
      return "redirect:/money/list?year=&month=&userId="+userId;
//      return "redirect:/money/list";
   }

 /*  
   @PostMapping("/update")
   public String update(@ModelAttribute MoneyDto dto, Model model) {
      log.debug("money 수정: {}", dto);
      service.writeMoney(dto);
      //model.addAttribute("board", service.detailBoard(dto.getNo()));
      return "redirect:/money/detail?moneyNo="+dto.getMoneyNo();
      
   }*/
}