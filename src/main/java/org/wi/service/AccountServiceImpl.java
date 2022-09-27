package org.wi.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wi.Mapper.AccountDAO;
import org.wi.model.AccountDTO;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	AccountDAO adao;
	
	// 로그인 select
	public boolean login(AccountDTO adto, HttpSession session) {
		AccountDTO login=adao.login(adto);
		boolean result=false;
		// login가 null이 아니면
		if(login!=null) {
			System.out.println("세션값");
			session.setAttribute("login", login);
			System.out.println("세션값 ="+session.getAttribute("login"));
			result=true;
		}
		return result;
	}
	// 로그인체크
	public int logincheck(AccountDTO adto) {
		System.out.println(adto);
		return adao.logincheck(adto);
	}
	//회원가입
	public void signup(AccountDTO adto) {
		adao.signup(adto);
		
	}
	// 회원가입 아이디 체크
	public AccountDTO idcheck(String id) {
		
		return adao.idcheck(id);
	}
}
