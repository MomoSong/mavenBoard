package ino.web.freeBoard.service;

import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.dto.Pagination;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardService {
	@Autowired
	SqlSession sqlSession;
		
	public List<FreeBoardDto> selectList(Pagination pagination){
		return sqlSession.selectList("selectList", pagination);
	}
	
	public int totalCount(){
		return sqlSession.selectOne("totalCount");
	}
	
	public FreeBoardDto selectOne(int num){
		return sqlSession.selectOne("selectOne", num);
	}
	
	public void modify(FreeBoardDto dto){
		sqlSession.update("modify", dto);
	}
	
	public FreeBoardDto afterInsert(int maxNum){
		return sqlSession.selectOne("selectOne", maxNum);
	}
	
	public int maxNum(){
		return sqlSession.selectOne("maxNum");
	}
	
	public void insert(FreeBoardDto dto){
		sqlSession.insert("insertPro", dto);
	}
	
	public void delete(int num){
		sqlSession.insert("delete", num);
	}	
}
