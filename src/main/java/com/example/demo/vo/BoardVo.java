package com.example.demo.vo;

import lombok.Data;

@Data
public class BoardVo {
   private int id, level, readnum;
   private String title, content, depart, empId, date;
   private String name;
}