package org.wi.Mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.wi.model.AccountDTO;
import org.wi.model.ProjectCriteriaDTO;
import org.wi.model.ProjectDTO;
import org.wi.model.adminCriteriaDTO;

public interface AccountDAO {
	// 로그인 select
	public AccountDTO login(AccountDTO adto);
	// 로그인 체크
	public int logincheck(AccountDTO adto);
	// 회원가입
	public void signup(AccountDTO adto);
	// 회원가입 아이디 체크
	public AccountDTO idcheck(String id);
	// id찾기
	public AccountDTO findId(@Param("name") String name,@Param("email") String email);
	// 비밀번호 업데이트
	public void updatePassword(AccountDTO adto);
	// 게시물 리스트
	public ArrayList<ProjectDTO> list(ProjectCriteriaDTO pcd);
	// 토탈
	public int total(ProjectCriteriaDTO pcd);
	// 디테일
	public ProjectDTO detail(ProjectDTO pjd);
	// 조회수
	public void cntup(ProjectDTO pjd);
	// 수정
	public void modify(ProjectDTO pjd);
	// 삭제
	public void remove(ProjectDTO pjd);
	//글쓰기
	public void newproject(ProjectDTO pjd);
	// 이메일 중복체크
	public AccountDTO emailcheck(String email);
	// 회원 멤버리스트
	public ArrayList<AccountDTO> memberlist(adminCriteriaDTO cri);
	// 회원정보 상세
	public ProjectDTO mmdetail(AccountDTO adto);
	// 회원정보 수정
	public void mmodify(AccountDTO adto);
	// 회원탈퇴
	public void mleave(AccountDTO adto);
	// memberlist 전체 테이블 건수 체크
	public int mtotal(adminCriteriaDTO cri);
}
