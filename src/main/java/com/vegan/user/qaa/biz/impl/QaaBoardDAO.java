package com.vegan.user.qaa.biz.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vegan.admin.qaa.biz.AdminQaaBoardVO;
import com.vegan.user.qaa.biz.QaaBoardVO;

@Repository
public class QaaBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertBoard(QaaBoardVO vo) {
		mybatis.insert("QaaBoardDAOTemp.insertBoard", vo);
	}

	public void updateBoard(QaaBoardVO vo) {
		mybatis.update("QaaBoardDAOTemp.updateBoard", vo);
	}
	
	public void deleteBoard(QaaBoardVO vo) {
		
		mybatis.delete("QaaBoardDAOTemp.deleteBoard", vo);
	}
	

	
	public QaaBoardVO getBoard(QaaBoardVO vo) {
		return mybatis.selectOne("QaaBoardDAOTemp.getBoard", vo);
	
	}
	
	public List<QaaBoardVO> getBoardList(QaaBoardVO vo) {
		
			return mybatis.selectList("QaaBoardDAOTemp.getBoardList", vo);
		
	}


	public QaaBoardVO getReply(QaaBoardVO vo) {
		return mybatis.selectOne("QaaBoardDAOTemp.getReply", vo);
	}
	
}

