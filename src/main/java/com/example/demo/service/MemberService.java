package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MemoVo;

public interface MemberService {
	public String login(MemberVo mvo, HttpSession session);
	public String logout(HttpSession session);
	public String member_input(Model model);
	public String member_input_ok(MemberVo mvo);
	public String mypage(HttpSession session, Model model);
	public String towork(HttpSession session);
	public String tohome(HttpSession session);
	public String member_commute(HttpServletRequest request, Model model);
	public String send(Model model, HttpSession session);
	public ArrayList<MemberVo> getName(HttpServletRequest request, Model model);
	public String send_ok(MemoVo mvo);
}
