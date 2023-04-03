package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.BoardVo;

public interface BoardService {
	public String list(HttpSession session, Model model, HttpServletRequest request);
    public String write_ok(BoardVo bvo, HttpSession session);
    public String readnum(String id, HttpSession session);
    public String content(String id, Model model);
    public String update(String id, Model model);
    public String update_ok(BoardVo bvo);
    public String delete_ok(String id);
}
