package org.wi.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.wi.model.AccountDTO;
import org.wi.model.AttachFileDTO;
import org.wi.model.ProjectCriteriaDTO;
import org.wi.model.ProjectDTO;
import org.wi.model.adminCriteriaDTO;

public interface AccountService {
	// 로그인
	public boolean login(AccountDTO adto, HttpSession session);
	// 로그인 체크
	public int logincheck(AccountDTO adto);
	
	public int emailkeycheck(AccountDTO adto);
	// 회원가입
	public void signup(AccountDTO adto);
	// id중복체크
	public AccountDTO idcheck(String id);
	
	// id 찾기
	public AccountDTO findId(String name, String email);
	// 비밀번호 찾기
	public void findPw(HttpServletResponse response, AccountDTO adto) throws Exception;
	// 비밀번호 메일 전송
	public void sendEmail(AccountDTO adto, String div) throws Exception;
	// 이메일 인증 키 전송
	public void emailkey(HttpServletResponse response, AccountDTO adto) throws Exception;
	// 메일 인증 전송
	public void sendkey(AccountDTO adto, String div) throws Exception;
	// 게시물 리스트
	public ArrayList<ProjectDTO> list(ProjectCriteriaDTO pcd);
	// 토탈
	public int total(ProjectCriteriaDTO pcd);
	// 상세보기
	public ProjectDTO detail(ProjectDTO pjd);
	// 수정
	public void modify(ProjectDTO pjd);
	// 삭제
	public void remove(ProjectDTO pjd);
	// 글쓰기 설계
	public void newproject(ProjectDTO pjd);
	// 첨부파일 조회 설계
	public ArrayList<AttachFileDTO> attachlist(int bno);
	// 이메일체크
	public AccountDTO emailcheck(String email);
	
	// 멤버 리스트
	public ArrayList<AccountDTO> memberlist(adminCriteriaDTO cri);
	// 회원정보 상세 
	public AccountDTO mmdetail(AccountDTO adto);
	// 회원정보 상세 
	public void mmodify(AccountDTO adto);
	// 회원정보 상세 
	public void mleave(AccountDTO adto);
	// memberlist테이블 전체건수 설계
	public int mtotal(adminCriteriaDTO cri);
	
	public void pwUpdate(String pASSWORD, String eMAIL, String iD);

	public void mailUpdate(String mAILKEY,String eMAIL);
	
	
	
	
	
	
	

	
}
