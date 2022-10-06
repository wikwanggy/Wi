package org.wi.service;

import java.util.ArrayList;

import org.wi.model.ReplyDTO;

public interface ReplyService {

	// 댓글 쓰기를 위한 설계
		public int rewrite(ReplyDTO reply);
		// 댓글을 보기 위한 설계
		public ArrayList<ReplyDTO> list(int bno);
		// 댓글 수정을 위한 설계
		public int remodify(ReplyDTO reply);
		// 댓글 삭제를 위한 설계
		public int remove(int rno);
}
