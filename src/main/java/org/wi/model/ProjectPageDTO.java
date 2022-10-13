package org.wi.model;

import org.wi.model.ProjectCriteriaDTO;

public class ProjectPageDTO {
	// 시작번호
	   private int startPage;
	   // 끝번호
	   private int endPage;
	   // 이전버튼
	   private boolean prev;
	   // 다음버튼
	   private boolean next;
	   // CriteriaVO 포함
	   private ProjectCriteriaDTO pcd;
	   // board테이블의 전체건수를 저장
	   private int total;
	   // 매개변수가2개인 생성자 선언
	   public  ProjectPageDTO(ProjectCriteriaDTO pcd, int total) {
	      this.pcd = pcd;
	      this.total = total;

	      
	      // 끝번호 = (현재페이지/10)(올림)*10
	      this.endPage = (int) (Math.ceil((pcd.getPageNum() / 10.0))) * 10;

	      // 시작번호,끝번호,이전버튼,다음버튼 계산
	      // 끝번호가 10 시작번호 1, 끝번호가20 시작번호 11 -> 시작번호 = 끝번호-9
	      this.startPage = this.endPage - 9;
	      
	      // 제일 마지막 페이지 번호는 전체건수를 고려해야함
	      // 제일 마지막 끝번호=전제건수(올림)/페이지당 게시물 갯수
	      int realEnd = (int) (Math.ceil((total * 1.0) / pcd.getAmount()));
	      // 123*1.0 =123.0
	      // 123.0/10=12.3(올림)->13

	      if (realEnd < this.endPage) {
	         this.endPage = realEnd;
	      }
	      // startPage가 1보다 크면 이전버튼 활성화
	      this.prev = this.startPage > 1;
	      
	      //endPage가 realEnd보다 작으면 다음버튼 활성화
	      this.next = this.endPage < realEnd;

	   }
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public ProjectCriteriaDTO getPcd() {
		return pcd;
	}
	public void setPcd(ProjectCriteriaDTO pcd) {
		this.pcd = pcd;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "ProjectPageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", pcd=" + pcd + ", total=" + total + "]";
	}

	  

}
