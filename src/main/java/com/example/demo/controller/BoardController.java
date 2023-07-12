package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;
import com.example.demo.vo.BoardVo;

@Controller
public class BoardController {
	//test
	//test .1
	//test2
	@Autowired
	@Qualifier("bs")
	private BoardService service;
	
	@RequestMapping("/board/list")
	public String list(HttpSession session, Model model, HttpServletRequest request) {
		return service.list(session, model, request);
	}
	
	@RequestMapping("/board/write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping("/board/write_ok")
	public String write_ok(BoardVo bvo, HttpSession session) {
		return service.write_ok(bvo, session);
	}
	
	@RequestMapping("/board/readnum")
	public String readnum(String id, HttpSession session) {
		return service.readnum(id, session);
	}
	
	@RequestMapping("/board/content")
	public String content(String id, Model model) {
		return service.content(id, model);
	}
	
	@RequestMapping("/board/update")
	public String update(String id, Model model) {
		return service.update(id, model);
	}
	
	@RequestMapping("/board/update_ok")
	public String update_ok(BoardVo bvo) {
		return service.update_ok(bvo);
	}
	
	@RequestMapping("/board/delete_ok")
	public String delete_ok(String id) {
		return service.delete_ok(id);
	}
}
