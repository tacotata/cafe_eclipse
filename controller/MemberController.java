package com.example.controller;


import java.io.Console;
import java.sql.Timestamp;
import java.util.HashMap;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.ByeVo;
import com.example.domain.MemberVo;
import com.example.service.MemberService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	JavaMailSender javaMailSender;
	

	
	//회원가입 페이지로 이동
	@GetMapping("/join")
	public void join() {
		log.info("GET - join() 호출됨");		
	}//회원가입 페이지로 이동
	
	//회원가입
	@PostMapping("/join")
	public String join(MemberVo memberVo) {
		log.info("POST - join() 호출됨");
		
		//회원가입 날짜 설정 
		memberVo.setRegDate(new Timestamp(System.currentTimeMillis()));
		log.info("memberVo :" + memberVo);
		
		//회원가입 처리 
		memberService.addMember(memberVo);
		
		return "redirect:/member/login";
	}//회원가입
	
	
	// 아이디 중복체크
	@GetMapping("/joinIdDupChk")
	@ResponseBody//리턴객체를 JSON 문자열로 변환해서 응답을 줌 
	public int ajaxJoinIdDupChk(@RequestParam("id") String id) {
		
		int count = memberService.getCountById(id);
		
		return count;
	}
	
	
	
	//로그인 페이지로 이동 
	@GetMapping("/login")
	public void login() {
		log.info("GET - login() 호출됨");
		
	}//로그인 페이지로 이동 
	
	//로그인
	@PostMapping("/login")
	public ResponseEntity<String> login( String id, String passwd,
			@RequestParam(defaultValue ="false") boolean keepLogin,
			HttpSession session,
			HttpServletResponse response) {
		
		int check = memberService.userCheck(id, passwd);
		
		//로그인 실패시
		if (check !=1 ) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", "text/html; charset=UTF-8");
			
			StringBuilder sb = new StringBuilder(); 
			sb.append("<script>");
			sb.append("alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');");
			sb.append("history.back();");
			sb.append("</script>");
			
			return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
		}
		//세션값 저장 
		session.setAttribute("id", id);
		
		if(keepLogin) {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 30);//유효기간 0-> 쿠키 삭제 음수 지정 브라우저 종료될 떄 쿠키 삭제 
			cookie.setPath("/");//특정 path 아래의 정보 요구할 때만 쿠키 보냄 
			//클라이언트에게 전송 서버는 요청으로부터 저달된 쿠키를 읽어 들여서 사용			
			response.addCookie(cookie);
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/");
		return new ResponseEntity<String>(headers,HttpStatus.FOUND);
		
	}//로그인
	

	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		//세션 초기화		
		session.invalidate();
		
		// 로그인 상태유지용 쿠키가 존재하면 삭제 
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("id")) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					
					response.addCookie(cookie);
				}
			}
		}
		
		return "redirect:/";
		
	}//로그아웃
	
	//아이디 찾기 
	@RequestMapping(value="/member/idSearch")
	public String idSearch() {		
		return "member/idSearch";
	}
	
	// 찾은 아이디 보여주기 
//	@RequestMapping(value="/member/viewId", method=RequestMethod.GET)
	@GetMapping("/viewId")
	public String viewIdGet() {		
		return "member/viewId";
	}
	
	// 입력 정보 틀렸을 경우 
	@GetMapping("/back")
	public ResponseEntity<String> back() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");		

		StringBuilder sb = new StringBuilder(); 
		sb.append("<script>");
		sb.append("alert('존재하지 않거나 정보가 일치하지 않습니다.');");
		sb.append("history.back();");
		sb.append("</script>");
		
		return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
	}
	
	//
	//@RequestMapping(value="/member/viewId", method=RequestMethod.POST)
	@PostMapping("/viewId")
	public String viewIdPost(@ModelAttribute MemberVo memberVo, Model model) {
		MemberVo vo = memberService.idSearch(memberVo);
		if(vo == null ) {
			return "redirect:/member/back";
		}else {
		model.addAttribute("vo", vo);
			return "member/viewId";
		}
	}
	
	//비밀번호 찾기
	
	@RequestMapping(value="/member/pwdSearch")
	public String pwdSearch() {		
		return "member/pwdSearch";
	}
	
	// 찾은 비번 이메일 전송 했어요 
	@GetMapping("/viewPwd")
	public String viewPwdGet() {		
		return "member/viewPwd";
	}
	
	
	@PostMapping("/viewPwd")
	public String viewPwdPost(@ModelAttribute MemberVo memberVo, Model model) {
		MemberVo vo = memberService.pwdSearch(memberVo);
		if(vo == null ) {
			return "redirect:/member/back";
		}else {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(vo.getEmail());
			message.setSubject("안녕하세요. 고객님 cafe입니다.");
			message.setText("안녕하세요!" +vo.getName()+"님\n비밀번호는"+ vo.getPasswd() + "입니다.\n로그인을 하신 후 반드시 비밀번호를 변경하시기 바랍니다.");
			javaMailSender.send(message);
			model.addAttribute("vo", vo);
			return "member/viewPwd";
		}
	}
	
	
	@GetMapping("/delete")
	public String deleteMember() {
		return"member/delete";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteMember(  String passwd, String id, ByeVo byeVo,  HttpSession session) throws Exception {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
		int sessionPass = memberService.userCheck( id, passwd);
		
		//비밀번호 입력 실패시
				if (sessionPass !=1 ) {
					HttpHeaders headers = new HttpHeaders();
					headers.add("Content-type", "text/html; charset=UTF-8");
					
					StringBuilder sb = new StringBuilder(); 
					sb.append("<script>");
					sb.append("alert(' 잘못된 비밀번호입니다.');");
					sb.append("history.back();");
					sb.append("</script>");
					
					return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
				} 
			 session.getAttribute(id);

				
				memberService.deleteMember(id);
				byeVo.setByeDate(new Timestamp(System.currentTimeMillis()));
				memberService.insertBye(byeVo);
				session.invalidate();
				
				
			
//				
//				/*
//				 * HttpHeaders headers = new HttpHeaders();
//				 * 
//				 * headers.add("Content-type", "text/html; charset=UTF-8");
//				 * 
//				 * StringBuilder sb = new StringBuilder(); sb.append("<script>");
//				 * sb.append("alert(' 회원탈퇴가 정상적으로 처리되었습니다.');"); sb.append("history.back();");
//				 * sb.append("</script>");
//				 */
				
				HttpHeaders headers = new HttpHeaders();
				headers.add("Location", "/");
				
				
				return new ResponseEntity<String>(headers,HttpStatus.FOUND);
		
		
		
		
		
		
	}
		
		
		
		
		
		
		
	/*	
		
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return"redirect:/member/delete";
		}
		
		memberService.deleteMember(memberVo);
		session.invalidate();
		
		return"redirect:/";
	}
	
*/
	

	
}

