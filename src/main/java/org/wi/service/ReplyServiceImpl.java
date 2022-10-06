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

	@Override
	public int rewrite(ReplyDTO reply) {
		
		return rdao.rewrite(reply);
	}

	@Override
	public ArrayList<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return rdao.list(bno);
	}

	@Override
	public int remodify(ReplyDTO reply) {
		// TODO Auto-generated method stub
		return rdao.remodify(reply);
	}

	@Override
	public int remove(int rno) {
		// TODO Auto-generated method stub
		return rdao.remove(rno);
	}
	
	
}
