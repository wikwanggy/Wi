package org.wi.Mapper;

import java.util.ArrayList;

import org.wi.model.ReplyDTO;

// 댓글 관련 mapper
public interface ReplyDAO {
	// 댓글 쓰기를 위한 구현
	// return 타입이 int일 때, 1이면 insert 성공
	// return 타입이 int일 때, 0이면 insert 실패
	public int rewrite(ReplyDTO reply);
	// 댓글 목록리스트를 위한 구현
	public ArrayList<ReplyDTO> list(int rno);
	// 댓글 수정을 위한 구현
	public int remodify(ReplyDTO reply);
	// 댓글 삭제를 위한 구현
	public int remove(int rno);
	//
	public ReplyDTO replylist(ReplyDTO reply);
	
}
