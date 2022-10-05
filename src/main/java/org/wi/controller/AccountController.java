package org.wi.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wi.model.AccountDTO;
import org.wi.service.AccountService;

@Controller
public class AccountController {
		@Autowired
		AccountService as;

		// 로그인//
		@RequestMapping(value="/Account/loginpost",method=RequestMethod.POST)
		public String postLogin(AccountDTO adto, HttpSession session, RedirectAttributes rttr){
			boolean result=as.login(adto,session);
			if(result) { // 로그인 성공
				System.out.println("로그인 성공");
				rttr.addFlashAttribute("msg","success");
				return "redirect:/";
			}else {
				System.out.println("로그인 실패");
				rttr.addFlashAttribute("msg","fail");
				return "redirect:/Account/login";
			}		
		}
		// 로그인 체크
		@PostMapping("/Account/logincheck")
		public ResponseEntity<String> logincheck(@RequestBody AccountDTO adto) {
			System.out.println(adto);
			int result = as.logincheck(adto);
			System.out.println("result 결과" + result);
			
			return result==1?new ResponseEntity<>("success", HttpStatus.OK)
							:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 로그아웃
		@GetMapping("/Account/logout")
		public String getLogout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
		// login 화면으로 이동
		@RequestMapping(value="/Account/login", method=RequestMethod.GET)
		public void getlogin() {}
	
		// 회원가입으로 이동
		@GetMapping("/Account/Signup")
		public void getsignup() {}
		
		// 회원가입하기
		@PostMapping("/Account/Signup")
		public String signup(AccountDTO adto) {
			as.signup(adto);
			return "redirect:/";	
		}	
		// id 체크
		@GetMapping("/Account/Signup/idcheck/{id}")
		public ResponseEntity<AccountDTO> idcheck(@PathVariable("id") String id){
			
			return new ResponseEntity<>(as.idcheck(id), HttpStatus.OK);
		}
		// ID 찾기 페이지로 이동
		@GetMapping("/Account/searchId")
		public void getfindId() {}
		// ID 찾기 실행
		@GetMapping("/Account/findId/{name}/{email}")
		public ResponseEntity<AccountDTO> findId(@PathVariable("name") String name,@PathVariable("email") String email){
		
			return new ResponseEntity<>(as.findId(name,email), HttpStatus.OK);
		}
		// 비밀번호 찾기
		@GetMapping("/Account/findPw")
		public void getfindPw() throws Exception {
			
		}
		// 비밀번호 찾기
		@PostMapping("/Account/findPw")
		public void findPwPOST(@ModelAttribute AccountDTO adto,HttpServletResponse response) throws Exception{
			System.out.println("findPw");
			as.findPw(response,adto);
		}
		// 관리자 페이지로 이동
		@GetMapping("/Admin/Admin")
		public void getAdmin() {}
}

