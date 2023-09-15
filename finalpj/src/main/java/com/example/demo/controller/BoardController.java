package com.example.demo.controller;


import java.util.List;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.dto.BoardDto;
import com.example.demo.model.entity.Board;
//import com.example.demo.model.dto.UserDto;
import com.example.demo.model.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	
	private BoardService service;
	
	@Autowired
	public BoardController(BoardService service) {
		this.service = service;
	}
	
	@GetMapping("/regist")
	public String registForm() {
		return "board/registboard";
	}
	
	@PostMapping("/regist")
	public String doRegist(@ModelAttribute BoardDto dto) {
		log.debug("board 전달 파라미터 확인: {}", dto);
		service.writeBoard(dto);
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list(@RequestParam(required = false, defaultValue = "1") Integer page, Model model) {
		page--;
		log.debug("page: {}",page);
		Page<Board> pageInfo = service.listBoard(page);
		model.addAttribute("pageInfo", pageInfo);
		return "board/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("boardNo") int boardNo, Model model) {
		log.debug("boardNo", boardNo);
		try {
			Board board = service.detailBoard(boardNo);
			model.addAttribute("board",board);
//			List<Reply> reply = null;
//			reply = replyService.
			return "board/detail";
		}catch(RuntimeException e){
			return "/board/list";
		}
		
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int boardNo) {
		log.debug("board no: {}", boardNo);
		service.deleteBoard(boardNo);
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDto dto, Model model) {
		log.debug("board 수정: {}", dto);
		service.writeBoard(dto);
//		model.addAttribute("board", service.detailBoard(dto.getNo()));
		return "redirect:/board/detail?boardNo="+dto.getBoardNo();
		
	}
	
	@GetMapping("/search")
	public String search(@RequestParam(required = false) String keyword, Model model) {
	    if (keyword != null && !keyword.isEmpty()) {
	        // 게시물 검색을 수행하는 서비스 메서드를 호출하고 결과를 모델에 추가
	        List<Board> searchResults = service.searchBoards(keyword);
	        model.addAttribute("searchResults", searchResults);
	    }
	    return "board/list"; // 검색 결과를 보여줄 뷰 페이지로 이동
	}
	
	

}
