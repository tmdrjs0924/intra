package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CommuteVo;
import com.example.demo.vo.DepartVo;
import com.example.demo.vo.MemberVo;

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
}
