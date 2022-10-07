package org.wi.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wi.Mapper.ReplyDAO;
import org.wi.model.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAO rdao;
	
	// 댓글 쓰기를 위한 구현
	public int rewrite(ReplyDTO reply) {
		return rdao.rewrite(reply);
		
	}
	// 댓글을 보기 위한 구현
	public ArrayList<ReplyDTO> list(int rno) {
		
		return rdao.list(rno);
	}
	// 댓글 수정을 위한 구현
	public int remodify(ReplyDTO reply) {
		return rdao.remodify(reply);

	}

	// 댓글 삭제를 위한 구현
	public int remove(int rno) {
		return rdao.remove(rno);
	}
	@Override
	public ReplyDTO replylist(ReplyDTO rdto) {
		
		return rdao.replylist(rdto);
	}
	

}
