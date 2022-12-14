package org.wi.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wi.Mapper.AccountDAO;
import org.wi.Mapper.projectAttachDAO;
import org.wi.model.AccountDTO;
import org.wi.model.AttachFileDTO;
import org.wi.model.ProjectCriteriaDTO;
import org.wi.model.ProjectDTO;
import org.wi.model.adminCriteriaDTO;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	AccountDAO adao;
	
	@Autowired
	projectAttachDAO padao;

	
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
	public int emailkeycheck(AccountDTO adto) {
		System.out.println(adto);
		return adao.emailkeycheck(adto);
	}
	//회원가입
	public void signup(AccountDTO adto) {
		adao.signup(adto);
		
	}
	// 회원가입 아이디 체크
	public AccountDTO idcheck(String id) {
		
		return adao.idcheck(id);
	}
	
	// 아이디 찾기
	public AccountDTO findId(String name, String email) {
		
		return adao.findId(name,email);
	}@Override
	public void sendEmail(AccountDTO adto, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.mail.nate.com";//"smtp.gmail.com"; //네이버 이용시 
		String hostSMTPid = "dnkrhkdrb@nate.com";
		String hostSMTPpwd = "8586439m!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "dnkrhkdrb@nate.com";
		String fromName = "개인프로젝트";
		String subject ="임시비밀번호";
		String msg ="임시비밀번호입니다.";

		if(div.equals("findPw")) {
			subject ="임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += adto.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += adto.getPassword() + "</p></div>";
		
		}

		// 받는 사람 E-Mail 주소
		String mail = adto.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	//비밀번호 찾기
	public void findPw(HttpServletResponse response, AccountDTO adto) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		
		AccountDTO ck = adao.idcheck(adto.getId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(adao.idcheck(adto.getId())==null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}else if(!adto.getEmail().equals(ck.getEmail())) { // 가입된 email이 아니면
			out.print("등록되지 않은 Email입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw ="";
			for(int i = 0; i < 12; i++) {
				pw += (char)((Math.random()*26)+97);
			}
			adto.setPassword(pw);
			//비밀번호 변경
			adao.updatePassword(adto);
			// 비밀번호 변경 메일 발송
			sendEmail(adto,"findPw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}// 이메일 인증 
	public void emailkey(HttpServletResponse response, AccountDTO adto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		
		if(adao.emailcheck(adto.getEmail())!=null) { // 가입된 email이면
			// 임시 비밀번호 생성
			System.out.println("aaaa");
			String mk="";
			for(int i = 0; i < 12; i++) {
				mk += (char)((Math.random()*26)+97);
			}
			adto.setMailkey(mk);
			//비밀번호 변경
			adao.updateMailkey(adto);
			// 비밀번호 변경 메일 발송
			sendkey(adto,"emailkey");
			
			out.print("이메일로 인증번호를 발송하였습니다.");
			out.close();
		}else {
			out.print("등록되어 있지 않은 Email입니다.");
			out.close();
		}
		
		
	}
	
	@Override
	public void sendkey(AccountDTO adto, String div) throws Exception {
		// Mail Server 설정
		
		String charSet = "utf-8";
		String hostSMTP = "smtp.mail.nate.com";//"smtp.gmail.com"; //네이버 이용시 
		String hostSMTPid = "dnkrhkdrb@nate.com";
		String hostSMTPpwd = "8586439m!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "dnkrhkdrb@nate.com";
		String fromName = "개인프로젝트";
		String subject ="이메일 인증 번호입니다.";
		String msg ="";

		if(div.equals("emailkey")) {
			System.out.println("emailkey"+subject);
			subject ="이메일 인증 번호입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += adto.getId() +"님의 이메일 인증 번호입니다. 인증번호를 입력해주세요</h3>";
			msg += "<p>인증번호 :"+adto.getMailkey()+"</p></div>";
			  
		
		}

		// 받는 사람 E-Mail 주소
		String mail = adto.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
			
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	

	//게시물 리스트
	public ArrayList<ProjectDTO> list(ProjectCriteriaDTO pcd){
		
		return adao.list(pcd);
	}
	public int total(ProjectCriteriaDTO pcd) {
		return adao.total(pcd);
	}
	@Override
	public ProjectDTO detail(ProjectDTO pjd) {
		adao.cntup(pjd);
		return adao.detail(pjd);
	}
	@Override
	public void modify(ProjectDTO pjd) {
		adao.modify(pjd);
		
	}
	public void remove(ProjectDTO pjd) {
		adao.remove(pjd);
		
	}
	
	public void newproject(ProjectDTO pjd) {
		adao.newproject(pjd);
		
		pjd.getAttach().forEach(attach ->{
			attach.setBno(pjd.getBno());
			padao.insert(attach);
		});
		
	}
	
	public ArrayList<AttachFileDTO> attachlist(int bno) {
		
		return padao.attachlist(bno);
	}
	@Override
	public AccountDTO emailcheck(String email) {
		
		return adao.emailcheck(email);
	}

	// 회원 리스트
	public ArrayList<AccountDTO> memberlist(adminCriteriaDTO cri) {

		return adao.memberlist(cri);
	}
	
	// 회원 정보 상세
	public AccountDTO mmdetail(AccountDTO adto) {
	
		return adao.mmdetail(adto);
	}
	// 회원정보 수정
	public void mmodify(AccountDTO adto) {
		adao.mmodify(adto);
	}
	// 회원 탈퇴
	public void mleave(AccountDTO adto) {
		adao.mleave(adto);

	}// 페이징
			public int mtotal(adminCriteriaDTO cri) {
				return adao.mtotal(cri);

	}
			@Override
			public void pwUpdate(String pASSWORD, String eMAIL, String iD) {
				// TODO 자동 생성된 메소드 스텁
				
			}
			@Override
			public void mailUpdate(String mAILKEY, String eMAIL) {
				// TODO 자동 생성된 메소드 스텁
				
			}
			
			

}
