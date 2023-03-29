package com.example.demo.vo;

import lombok.Data;

@Data
public class CommuteVo {
	private int id, state;
	private String towork, tohome, date, empId;
	private String name;
}
