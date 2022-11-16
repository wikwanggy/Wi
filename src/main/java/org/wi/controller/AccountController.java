package org.wi.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wi.model.AccountDTO;
import org.wi.model.AttachFileDTO;
import org.wi.model.ProjectCriteriaDTO;
import org.wi.model.ProjectDTO;
import org.wi.model.ProjectPageDTO;
import org.wi.model.adminCriteriaDTO;
import org.wi.model.adminPageDTO;
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
		//email체크
		@GetMapping("/Account/Signup/emailcheck/{email}")
		//                  @PathVariable
		public ResponseEntity<AccountDTO> emailcheck(@PathVariable("email") String email) {
			System.out.println(email);
			return new ResponseEntity<>(as.emailcheck(email), HttpStatus.OK);
		}
		// ID 찾기 페이지로 이동
		@GetMapping("/Account/searchId")
		public void getfindId() {}
		// ID 찾기 실행
		@GetMapping("/Account/findId/{name}/{email}")
		public ResponseEntity<AccountDTO> findId(@PathVariable("name") String name,@PathVariable("email") String email){
			System.out.println("controller="+name);
			System.out.println("controller="+email);
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
		// 프로젝트 리스트
		@GetMapping("/Account/projectlist")
		public String list(Model model,ProjectCriteriaDTO pcd,HttpSession session) {
			model.addAttribute("list",as.list(pcd));
			int total = as.total(pcd);
			model.addAttribute("paging",new ProjectPageDTO(pcd,total));
			return "/Account/projectlist";
		}
		// 프로젝트 디테일
		@GetMapping("/Account/detail")
		public String detail(Model model,ProjectDTO pjd,HttpSession session) {
			model.addAttribute("detail",as.detail(pjd));
			
			return "/Account/detail";
		}
		// 프로젝트 수정
		@PostMapping("/Account/modify")
		public String modify(ProjectDTO pjd, RedirectAttributes rttr,HttpSession session) {
			as.modify(pjd);
			rttr.addFlashAttribute("bno",pjd.getBno());
			return "redirect:/Account/projectlist";
		}
		// 프로젝트 삭제
		@PostMapping("/Account/remove")
		public String remove(ProjectDTO pjd,HttpSession session) {
			as.remove(pjd);
			return "redirect:/Account/projectlist";
		}
		// 글쓰기 화면
		@GetMapping("/Account/newproject")
		public void newproject(HttpSession session) {}
		// 게시판 글쓰기 페이지
		@PostMapping("/Account/newproject")
		public String newprojectpost(ProjectDTO pjd) {
			System.out.println("pjd===>"+pjd);
			// 비즈니스 영역 연결한 후 BoardService에 있는 write메소드호츨	
			as.newproject(pjd);
			return "redirect:/Account/projectlist";
		}
		// 해당게시물의 첨부파일의 데이터를 ajax로 전송
		@RequestMapping(value ="/attachlist", method=RequestMethod.GET)
		public ResponseEntity<ArrayList<AttachFileDTO>>  uploadAjaxPost(int bno){
			return new ResponseEntity<>(as.attachlist(bno),HttpStatus.OK);
		}// 회원 페이지 이동
		@GetMapping("/Account/mypage")
		public void Accountmove(AccountDTO adto,Model model) {
			model.addAttribute("mypage",as.mmdetail(adto));
		}
		// 회원정보 수정페이지로 이동
		@GetMapping("/Account/mmdetail")
		public void mdetail(AccountDTO adto,Model model) {
			
			model.addAttribute("mmdetail", as.mmdetail(adto));

		}
		// 회원정보 상세
		@PostMapping("/Account/mmdetail")
		public String detailpost(AccountDTO adto,Model model) {
			
			
			return "/Accountm/mmdetail";
			
		}
		// 회원정보 수정
		@PostMapping("/Account/mmodify")
		public String mmodify(AccountDTO adto, RedirectAttributes rttr) {
			System.out.println(adto);
			as.mmodify(adto);
			rttr.addAttribute("id",adto.getId());
			return "redirect:/Account/mypage";
		}
		
		
		// 회원 탈퇴
		@GetMapping("/Account/mleave")
		public String mleave(AccountDTO adto,HttpSession session) {
			as.mleave(adto);
			session.invalidate();
			return "redirect:/";
		}
		// 회원리스트
		@GetMapping("/Admin/memberlist")
		public String memberlist(Model model, adminCriteriaDTO cri) {
			model.addAttribute("memberlist",as.memberlist(cri));
			int total = as.mtotal(cri);
			//model.addAttribute("paging",new PageVo(cri,190));
			model.addAttribute("paging",new adminPageDTO(cri,total));
			return "/Admin/memberlist";
		}
		// 관리자로 로그인 후 멤버리스트에서 상세정보로 이동
		@GetMapping("/Admin/listdetail")
		public void listdetail(AccountDTO adto,Model model) {
			model.addAttribute("mypage",as.mmdetail(adto));
		}
		// 관리자로 로그인 후 멤버리스트 상세정보들어가서 회원삭제
		@GetMapping("/Admin/mleave")
		public String adminleave(AccountDTO adto,HttpSession session) {
			as.mleave(adto);
			return "redirect:/Admin/memberlist";
		}
		
}	

