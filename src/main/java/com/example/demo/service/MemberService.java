package com.example.demo.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.MemberVo;

public interface MemberService {
	public String login(MemberVo mvo, HttpSession session);
	public String logout(HttpSession session);
	public String member_input(Model model);
	public String member_input_ok(MemberVo mvo);
	public String mypage(HttpSession session, Model model);
	public String towork(HttpSession session);
	public String tohome(HttpSession session);
}
