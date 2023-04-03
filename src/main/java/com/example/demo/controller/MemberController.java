package com.example.demo.controller;

import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MemoVo;

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
	public String login(MemberVo mvo, HttpSession session, Model model, HttpServletRequest request) {
		return service.login(mvo, session, model, request);
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
	
	@RequestMapping("/member/member_commute")
	public String member_commute(HttpServletRequest request, Model model) {
		return service.member_commute(request, model);
	}
	
	@RequestMapping("/member/send")
	public String send(Model model, HttpSession session) {
		return service.send(model, session);
	}
	
	@RequestMapping("/member/getName")
	public @ResponseBody ArrayList<MemberVo> getName(HttpServletRequest request, Model model) {
		return service.getName(request, model);
	}
	
	@RequestMapping("/member/send_ok")
	public String send_ok(MemoVo mvo) {
		return service.send_ok(mvo);
	}
	
	@RequestMapping("/member/getSendMemo")
	public @ResponseBody ArrayList<MemoVo> getSendMemo(HttpSession session) {
		return service.getSendMemo(session);
	}
	
	@RequestMapping("/member/getReceiveMemo")
	public @ResponseBody ArrayList<MemoVo> getReceiveMemo(HttpSession session) {
		return service.getReceiveMemo(session);
	}
	
	@RequestMapping("/member/receiveView")
	public @ResponseBody MemoVo receiveView(String id){
		return service.receiveView(id);
	}
	
	@RequestMapping("/member/sendView")
	public @ResponseBody MemoVo sendView(String id){
		return service.sendView(id);
	}
}
