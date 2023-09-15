// package com.example.demo;

// import java.util.List;

// import org.junit.jupiter.api.Assertions;
// import org.junit.jupiter.api.Test;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
// import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
// import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
// import org.springframework.data.domain.Page;
// import org.springframework.data.domain.PageRequest;
// import org.springframework.data.domain.Pageable;
// import org.springframework.data.domain.Sort.Direction;

// import com.example.demo.model.entity.Board;
// import com.example.demo.model.entity.User;
// import com.example.demo.model.repo.BoardRepository;
// import com.example.demo.model.repo.UserRepository;

// @DataJpaTest
// @AutoConfigureTestDatabase(replace = Replace.NONE)
// public class BoardRepoTest {
// 	@Autowired
// 	BoardRepository brepo;
	
// 	@Autowired
// 	UserRepository urepo;
	
	
// 	@Test
// 	public void insert() {
// //		User user = urepo.findById("hong").get(); // select 호출
// 		User user = urepo.getReferenceById("hong"); // 실제 select를 하지는 않음
// 		Board board = Board.builder().title("제목").content("내용").user(user).build();
// 		brepo.saveAndFlush(board);
		
// 		Board selected = brepo.findById(board.getNo()).get();
// 		Assertions.assertEquals(selected.getContent(), "내용");
		
// 	}
	
// 	@Test
// 	public void paging() {
// 		// 1페이지에 5개씩 보여주자
// 		Pageable pageable = PageRequest.of(0, 5, Direction.DESC, "no");
// 		Page<Board> pageInfo = brepo.findAll(pageable);
// 		List<Board> boardList = pageInfo.getContent();
		
// 		Assertions.assertEquals(boardList.get(0).getTitle(), "ㅂ");
// 		Assertions.assertEquals(pageInfo.getTotalPages(), 2);
		
// 	}
// }
