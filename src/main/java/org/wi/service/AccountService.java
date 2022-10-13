package org.wi.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.wi.model.AccountDTO;
import org.wi.model.ProjectCriteriaDTO;
import org.wi.model.ProjectDTO;

public interface AccountService {
	// 로그인
	public boolean login(AccountDTO adto, HttpSession session);
	// 로그인 체크
	public int logincheck(AccountDTO adto);
	// 회원가입
	public void signup(AccountDTO adto);
	// id중복체크
	public AccountDTO idcheck(String id);
	// id 찾기
	public AccountDTO findId(String name, String email);
	// 비밀번호 찾기
	public void findPw(HttpServletResponse response, AccountDTO adto) throws Exception;
	// 비밀번호 메일 전송
	void sendEmail(AccountDTO adto, String div) throws Exception;
	// 게시물 리스트
	public ArrayList<ProjectDTO> list(ProjectCriteriaDTO pcd);
	public int total(ProjectCriteriaDTO pcd);

}
