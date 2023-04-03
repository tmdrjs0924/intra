package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BoardVo;

@Mapper
public interface BoardMapper {
    public ArrayList<BoardVo> list();
    public void write_ok(BoardVo bvo);
    public void readnum(String id);
    public BoardVo content(String id);
    public void update_ok(BoardVo bvo);
    public void delete_ok(String id);
}
