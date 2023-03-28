package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	private final Logger log=LoggerFactory.getLogger(MemberController.class.getName());
	
	@GetMapping("/member/login")
	public String login(HttpServletRequest request, Model model) {
		log.info("login 페이지");
		model.addAttribute("chk", request.getParameter("chk"));
		return "/member/login";
	}
	
	@PostMapping("/member/login")
	public String login(MemberVo mvo, HttpSession session) {
		return service.login(mvo, session);
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}

	@RequestMapping("/member/member_input")
	public String member_input(Model model) {
		return service.member_input(model);
	}
	
	@RequestMapping("/member/member_input_ok")
	public String member_input_ok(MemberVo mvo) {
		return service.member_input_ok(mvo);
	}
	
	@RequestMapping("/member/mypage")
	public String mypage(HttpSession session, Model model) {
		return service.mypage(session, model);
	}
	
	@RequestMapping("/member/towork")
	public String towork(HttpSession session) {
		return service.towork(session);
	}
	
	@RequestMapping("/member/tohome")
	public String tohome(HttpSession session) {
		return service.tohome(session);
	}
}