package com.ssafy.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Notice;
import com.ssafy.model.dto.Search;
import com.ssafy.model.service.BoardService;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.MemberService;
import com.ssafy.model.service.NoticeService;
import com.ssafy.model.service.SearchService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins= {"*"}, maxAge= 6000)
@RestController
@Api(value="SafeFood", description="SafeFood Project with Vue 2019")
public class MainRestController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private SearchService searchService;

	@ExceptionHandler
	public ResponseEntity<Map<String, Object>> handle(Exception e) {
		e.printStackTrace();
		return handleFail(e.getMessage(), HttpStatus.OK);
	}

	@GetMapping("/searchInfo")
	private ResponseEntity<Map<String, Object>> searchbar(){
		List<Search> list = searchService.searchAll();
		Collections.sort(list, new Comparator<Search>() {
			@Override
			public int compare(Search a0, Search a1) {
				// TODO Auto-generated method stub
				return a1.getScnt()-a0.getScnt();
			}
		});
		return handleSuccess(list);
	}
	
	@GetMapping("/foodNutritionInfo/{fcode}")
	@ApiOperation("영양정보 출력을 위한 기능")
	private ResponseEntity<Map<String, Object>> nutrition(@PathVariable String fcode) {
		Food food = foodService.search(fcode);
		return handleSuccess(food);
	}
	
	@GetMapping("/boardSearchAll")
	@ApiOperation("QnA 게시판 목록 조회 기능")
	private ResponseEntity<Map<String,Object>> boardSearchAll(){
		List<Board> list = boardService.searchAll();
		return handleSuccess(list);
	}
	
	@GetMapping("/noticeSearchAll")
	@ApiOperation("공지사항 목록 조회 기능")
	private ResponseEntity<Map<String,Object>> noticeSearchAll(){
		List<Notice> list = noticeService.searchAll();
		return handleSuccess(list);
	}
	
	@GetMapping("/boardSearch/{no}")
	@ApiOperation("QnA 게시물 상세 조회 기능")
	private ResponseEntity<Map<String,Object>> boardSearch(@PathVariable String no){
		Board board = boardService.search(no);
		return handleSuccess(board);
	}
	
	@GetMapping("/noticeSearch/{no}")
	@ApiOperation("공지글 상세 조회 기능")
	private ResponseEntity<Map<String,Object>> noticeSearch(@PathVariable String no){
		Notice notice = noticeService.search(no);
		return handleSuccess(notice);
	}
	
	@PostMapping("/insertBoard")
	@ApiOperation("QnA 게시물 추가 기능")
	private ResponseEntity<Map<String,Object>> insertBoard(@RequestBody Board board){
		boardService.insert(board);
		return handleSuccess("게시물 등록 완료");
	}
	
	@PostMapping("/insertNotice")
	@ApiOperation("공지사항 게시물 추가 기능")
	private ResponseEntity<Map<String,Object>> insertNotice(@RequestBody Notice notice){
		noticeService.insert(notice);
		return handleSuccess("공지글 등록 완료");
	}
	
	@GetMapping("/getsessionId")
	@ApiOperation("QnA를 위한 Session Id를 받는 기능")
	private ResponseEntity<Map<String,Object>> getsessionId(HttpServletRequest request){
		String id = getId(request);
		return handleSuccess(id);
	}
	
	@PutMapping("/updateBoard")
	@ApiOperation("QnA 게시물 수정 기능")
	private ResponseEntity<Map<String,Object>> updateBoard(@RequestBody Board board,HttpServletRequest request){
		String id = getId(request);
		if(!board.getId().equals(id)) {
			return handleFail("wrongid", HttpStatus.OK) ;
		}else {
			boardService.update(board);
			return handleSuccess("게시물 수정 완료");
		}
	}
	
	@PutMapping("/updateNotice")
	@ApiOperation("공지글 수정 기능")
	private ResponseEntity<Map<String,Object>> updateNotice(@RequestBody Notice notice,HttpServletRequest request){
		noticeService.update(notice);
		return handleSuccess("공지글 수정 완료");
	}
	
	@DeleteMapping("/deleteBoard/{no}")
	@ApiOperation("QnA 게시물 삭제 기능")
	private ResponseEntity<Map<String,Object>> deleteBoard(@PathVariable String no) {
		boardService.delete(no);
		return handleSuccess("게시물 삭제 완료");
	}
	
	@DeleteMapping("/deleteNotice/{no}")
	@ApiOperation("공지글 삭제 기능")
	private ResponseEntity<Map<String,Object>> deleteNotice(@PathVariable String no) {
		noticeService.delete(no);
		return handleSuccess("게시물 삭제 완료");
	}
	
	
	@PutMapping("/replyBoard")
	@ApiOperation("QnA 게시물 답변 등록 및 수정 기능")
	private ResponseEntity<Map<String,Object>> replyBoard(@RequestBody Board board){
		boardService.reply(board);
		return handleSuccess("답변 등록 완료");
	}
	
	public ResponseEntity<Map<String, Object>> handleSuccess(Object data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "ok");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}

	public ResponseEntity<Map<String, Object>> handleFail(Object data, HttpStatus status) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "fail");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	public String getId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String) session.getAttribute("id");
	}
}
