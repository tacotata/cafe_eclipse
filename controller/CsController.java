package com.example.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.activation.FileDataSource;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.CsVo;
import com.example.domain.MemberVo;
import com.example.service.CsService;
import com.example.service.MemberService;
import com.example.service.MySqlService;
import com.sun.mail.util.logging.MailHandler;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/board")
public class CsController {

	@Autowired
	private CsService csService;

	@Autowired
	private MySqlService mySqlService;

	@Autowired
	JavaMailSender javaMailSender;

	@GetMapping("/cs")
	public String cs() {
		return "board/cs";
	}

	@GetMapping("/csContent")
	public String csContent() {
		return "board/csContent";
	}

	@GetMapping("/csForm")
	public String csForm(Model model, MemberVo memberVo) {

		return "board/csForm";
	}

	
	@PostMapping("/csForm")
	public String csForm(@ModelAttribute CsVo csVo, HttpServletRequest request,
			@RequestParam("file") MultipartFile multipartFile) throws IOException {
		
		csVo.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		int num = mySqlService.getNextNum("notice");
		csVo.setNum(num);
	
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/");

		File dir = new File(realPath + "/upload");

		if (!dir.exists()) {
			dir.mkdir();
		}

		String filename = multipartFile.getOriginalFilename();

		File saveFile = new File(dir, filename);

		multipartFile.transferTo(saveFile);

		csVo.setCsImg(filename);

		csService.addCs(csVo);

		
//  =============== 첨부파일 이메일 보내기 =====================
		
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		
		try {
			
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			
			helper.setSubject(csVo.getCsTitle());
			helper.setText("아이디:"+csVo.getCsId()+"\n"+"메일주소:"+csVo.getCsEmail()+"\n내용:"+csVo.getCsContent());
			helper.setTo("a01079074499@gmail.com");
			helper.addAttachment(csVo.getCsImg(), saveFile);
			
			
			
				javaMailSender.send(mimeMessage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "board/viewCs";
	}
}
