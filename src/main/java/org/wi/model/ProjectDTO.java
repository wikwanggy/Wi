package org.wi.model;

public class ProjectDTO {
	private String name;
	private String logo;
	private String link; 
	private String uuid;
	private int bno;
	private String id;
	private String content;
	private int cnt;
	private String regdate;
	private int rownum;
	private int count;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
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
	@Override
	public String toString() {
		return "ProjectDTO [name=" + name + ", logo=" + logo + ", link=" + link + ", uuid=" + uuid + ", bno=" + bno
				+ ", id=" + id + ", content=" + content + ", cnt=" + cnt + ", regdate=" + regdate + ", rownum=" + rownum
				+ ", count=" + count + "]";
	}
	
	
}
