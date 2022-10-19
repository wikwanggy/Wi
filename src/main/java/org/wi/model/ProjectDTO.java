package org.wi.model;

import java.util.ArrayList;

public class ProjectDTO {
	private String name;
	private String link; 
	private int bno;
	private String id;
	private String content;
	private int cnt;
	private String regdate;
	private int rownum;
	private int count;
	private String filem;
	
	// AttachFileVo(파일 업로드관련 모델)
	private ArrayList<AttachFileDTO> attach;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getFilem() {
		return filem;
	}

	public void setFilem(String filem) {
		this.filem = filem;
	}

	public ArrayList<AttachFileDTO> getAttach() {
		return attach;
	}

	public void setAttach(ArrayList<AttachFileDTO> attach) {
		this.attach = attach;
	}

	@Override
	public String toString() {
		return "ProjectDTO [name=" + name + ", link=" + link + ", bno=" + bno + ", id=" + id + ", content=" + content
				+ ", cnt=" + cnt + ", regdate=" + regdate + ", rownum=" + rownum + ", count=" + count + ", filem="
				+ filem + ", attach=" + attach + "]";
	}

	
	
	
}
