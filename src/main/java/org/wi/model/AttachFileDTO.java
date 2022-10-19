package org.wi.model;

public class AttachFileDTO {
	
	// 1. 파일이 저장되어 있는 경로
	private String uploadPath; //2022\\08\\24
	// 2. 업로드된 파일명
	private String fileName; 
	// UUID
	private String uuid;
	// 4. 업로드된 파일이 이미지 파일인지 아닌지 대한 정보
	private boolean image;
	// 5. 게시판 번호
	private int bno;
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "AttachFileDTO [uploadPath=" + uploadPath + ", fileName=" + fileName + ", uuid=" + uuid + ", image="
				+ image + ", bno=" + bno + "]";
	}

	
	
	
	
	
	
	
}
