package org.wi.Mapper;

import org.wi.model.AccountDTO;

public interface AccountDAO {
	// 로그인 select
	public AccountDTO login(AccountDTO adto);
	// 로그인 체크
	public int logincheck(AccountDTO adto);
	// 회원가입
	public void signup(AccountDTO adto);
	// 회원가입 아이디 체크
	public AccountDTO idcheck(String id);
}
