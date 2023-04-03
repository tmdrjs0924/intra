package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CommuteVo;
import com.example.demo.vo.DepartVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MemoVo;

@Mapper
public interface MemberMapper {
	public MemberVo login(MemberVo mvo);
	public void member_input_ok(MemberVo mvo);
	public ArrayList<DepartVo> getDepart();
	public int getEmpId();
	public MemberVo getMember(String empId);
	public CommuteVo getCommute(String date, String empId);
	public void toWork(String date, String empId);
	public void toHome(String date, String empId);
	public ArrayList<CommuteVo> member_commute(String date);
	public ArrayList<MemberVo> getName(String depart);
	public void send_ok(MemoVo mvo);
	public int totalReceiveMemo(String receiver);
	public int readReceiveMemo(String receiver);
	public int totalSendMemo(String sender);
	public int readSendMemo(String sender);
	public ArrayList<MemoVo> getSendMemo(String empId);
	public ArrayList<MemoVo> getReceiveMemo(String empId);
	public MemoVo receiveView(String id);
	public MemoVo sendView(String id);
	public void stateUpdate(String id);
}