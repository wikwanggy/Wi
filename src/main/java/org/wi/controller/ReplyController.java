package org.wi.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.wi.model.ReplyDTO;
import org.wi.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyService rs;
	
	// 댓글 쓰기
	@RequestMapping(value = "/replies/new",method = RequestMethod.POST)
	public ResponseEntity<String> replywrite(@RequestBody ReplyDTO reply,HttpSession session) { // Model일 경우 @RequestBody를 쓰고
		// insert가 성공했으면 result 변수에 1저장
		// insert가 실패했으면 result 변수에 0저장
		int result = rs.rewrite(reply);
		
		System.out.println(reply);
		
		
		return  result == 1 ? new ResponseEntity<>("success", HttpStatus.OK) // result가 1이면 HttpStatus.OK
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR ); // result가 0이면 HttpStatus.INTERNAL_SERVER_ERROR
	}	
	// 댓글 목록 리스트
	@RequestMapping(value = "/replies/{bno}",method = RequestMethod.GET) 
	public  ResponseEntity<ArrayList<ReplyDTO>> getlist(@PathVariable int bno){ // int이기에 @PathVariable를 쓴다.
		System.out.println("댓글 목록 리스트="+bno);
		
		//rs.list(bno);
		
		
		//System.out.println("121212="+rs.list(bno));
		
		
		return new ResponseEntity<>(rs.list(bno),HttpStatus.OK); 
	}
	@RequestMapping(value = "/replies/modify",method = RequestMethod.PUT)
	public ResponseEntity<String> replymodify(@RequestBody ReplyDTO reply) { 
		System.out.println(reply);
		int result = rs.remodify(reply);
		// update가 성공했으면 result 변수에 1저장
		// update가 실패했으면 result 변수에 0저장
		
		
		
		 return  result == 1 ? new ResponseEntity<>("success", HttpStatus.OK) // result가 1이면 HttpStatus.OK
							 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR ); // result가 0이면 HttpStatus.INTERNAL_SERVER_ERROR
}	
	@RequestMapping(value = "/replies/remove/{rno}",method = RequestMethod.DELETE)
	public ResponseEntity<String> replyremove(@PathVariable int rno) {
		
		int result=rs.remove(rno);
		return result ==1? new ResponseEntity<>("success", HttpStatus.OK) // result가 1이면 HttpStatus.OK
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR ); // result가 0이면 HttpStatus.INTERNAL_SERVER_ERROR
	}
}
