package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.CommuteVo;
import com.example.demo.vo.DepartVo;
import com.example.demo.vo.MemberVo;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String login(MemberVo mvo, HttpSession session) {
		MemberVo mvo2=mapper.login(mvo);
		if(mvo2!=null) {
			session.setAttribute("empId", mvo2.getEmpId());
			session.setAttribute("name", mvo2.getName());
			session.setAttribute("level", mvo2.getLevel());
			return "redirect:/main/main";
		}
		else {
			return "redirect:/member/login?chk=1";
		}
	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main";
	}
	
	@Override
	public String member_input(Model model) {
		//부서정보 전달
		model.addAttribute("list", mapper.getDepart());
		//사원번호 자동생성
		String code="c"+String.format("%03d", mapper.getEmpId());
		model.addAttribute("code", code);
		return "/member/member_input";
	}
	
	@Override
	public String member_input_ok(MemberVo mvo) {
		mapper.member_input_ok(mvo);
		return "redirect:/member/member_input";
	}
	
	@Override
	public String mypage(HttpSession session, Model model) {
		//회원정보
		String empId=session.getAttribute("empId").toString();
		model.addAttribute("mvo", mapper.getMember(empId));
		
		//출퇴근 이력
		LocalDate date=LocalDate.now();
		CommuteVo cvo=mapper.getCommute(date.toString(), empId);
		int chk;
		if(cvo==null)
			chk=1;
		else if(cvo.getTowork()!=null && cvo.getTohome()==null)
			chk=2;
		else
			chk=3;
		model.addAttribute("chk", chk);
		model.addAttribute("cvo", cvo);
		
		//사원간 쪽지
		
		
		return "/member/mypage";
	}
	
	@Override
	public String towork(HttpSession session) {
		String empId=session.getAttribute("empId").toString();
		String date=LocalDate.now().toString();
		mapper.toWork(date, empId);
		return "redirect:/member/mypage";
	}
	
	@Override
	public String tohome(HttpSession session) {
		String empId=session.getAttribute("empId").toString();
		String date=LocalDate.now().toString();
		mapper.toHome(date, empId);
		return "redirect:/member/mypage";
	}
}
