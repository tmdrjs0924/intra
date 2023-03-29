package com.example.demo.vo;

import lombok.Data;

@Data
public class MemoVo {
	private int id, state;
	private String sender, receiver, title, content, date;
}
