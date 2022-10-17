package org.wi.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wi.Mapper.ReplyDAO;
import org.wi.model.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAO rm;
	
	// 댓글 쓰기를 위한 구현
	public int rewrite(ReplyDTO reply) {
		return rm.rewrite(reply);
		
	}
	// 댓글을 보기 위한 구현
	public ArrayList<ReplyDTO> list(int bno) {
		
		return rm.list(bno);
	}
	// 댓글 수정을 위한 구현
	public int remodify(ReplyDTO reply) {
		return rm.remodify(reply);

	}

	// 댓글 삭제를 위한 구현
	public int remove(int rno) {
		return rm.remove(rno);
	}
	

}
