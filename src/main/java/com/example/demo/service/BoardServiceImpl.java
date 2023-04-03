package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.vo.BoardVo;

@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService {

	@Autowired
    private BoardMapper mapper;

	@Override
	public String list(HttpSession session, Model model, HttpServletRequest request) {
		model.addAttribute("list", mapper.list());
		model.addAttribute("chk", request.getParameter("chk"));
		return "/board/list";
	}
	
	@Override
	public String write_ok(BoardVo bvo, HttpSession session) {
		bvo.setDepart(session.getAttribute("depart").toString());
		bvo.setEmpId(session.getAttribute("empId").toString());
		mapper.write_ok(bvo);
		return "redirect:/board/list";
	}
	
	@Override
	public String readnum(String id, HttpSession session) {
		if(session.getAttribute("level")!=null) {
			int level=Integer.parseInt(session.getAttribute("level").toString());
			int level2=mapper.content(id).getLevel();
			if(level>=level2) {
				mapper.readnum(id);
				return "redirect:/board/content?id="+id;
			}
			else
				return "redirect:/board/list?chk=1";
		}
		else
			return "redirect:/member/login?chk=1";
	}
	
	@Override
	public String content(String id, Model model) {
		model.addAttribute("bvo", mapper.content(id));
		return "/board/content";
		
	}
	
	@Override
	public String update(String id, Model model) {
		model.addAttribute("bvo", mapper.content(id));
		return "/board/update";
	}
	
	@Override
	public String update_ok(BoardVo bvo) {
		mapper.update_ok(bvo);
		return "redirect:/board/content?id="+bvo.getId();
	}
	
	@Override
	public String delete_ok(String id) {
		mapper.delete_ok(id);
		return "redirect:/board/list";
	}
}