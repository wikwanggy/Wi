package org.wi.Mapper;

import java.util.ArrayList;

import org.wi.model.AttachFileDTO;

public interface projectAttachDAO {
	
	// 글 쓰기할 당시에 첨부파일 DB작업 설계
	public void insert(AttachFileDTO attach);
	// 해당게시물의 첨부파일 조회
	public ArrayList<AttachFileDTO> attachlist(int bno);
}
