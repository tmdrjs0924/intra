package com.example.demo.vo;

import lombok.Data;

@Data
public class MemberVo {
	private int level;
	private String userid, pwd, name, email, phone, zip, address, address_etc, joining, depart, empId;
	private String depart_name;
}
