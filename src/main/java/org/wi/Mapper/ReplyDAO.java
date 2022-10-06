package org.wi.Mapper;

import java.util.ArrayList;

import org.wi.model.ReplyDTO;

public interface ReplyDAO {

	public int rewrite(ReplyDTO reply);

	public ArrayList<ReplyDTO> list(int bno);

	public int remodify(ReplyDTO reply);

	public int remove(int rno);

}
