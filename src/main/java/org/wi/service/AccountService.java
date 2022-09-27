package org.wi.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.wi.model.AccountDTO;

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
	

}
