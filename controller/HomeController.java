package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/insertMenu")
	public String insertMenu() {
		return "cafe/insertMenu";
	}
}
